import Foundation
import KakaoSDKUser
import SwiftKeychainWrapper

class LoginViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var errorMessage: String?

    func loginWithKakao() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { (token, error) in
                if let error = error {
                    print("카카오톡 로그인 실패: \(error)")
                    self.loginWithKakaoAccount()
                } else if let token = token {
                    self.sendTokenToBackend(token: token.accessToken)
                }
            }
        } else {
            loginWithKakaoAccount()
        }
    }

    private func loginWithKakaoAccount() {
        UserApi.shared.loginWithKakaoAccount { (token, error) in
            if let error = error {
                self.errorMessage = "카카오 계정 로그인 실패: \(error.localizedDescription)"
            } else if let token = token {
                self.sendTokenToBackend(token: token.accessToken)
            }
        }
    }

    private func sendTokenToBackend(token: String) {
        guard let url = URL(string: "http://localhost:8080/kakao/login") else {
            self.errorMessage = "잘못된 백엔드 URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: String] = ["accessToken": token]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = "백엔드 통신 실패: \(error.localizedDescription)"
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                      let data = data,
                      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let jwtToken = json["jwtToken"] as? String else {
                    self.errorMessage = "백엔드 응답 오류"
                    return
                }
                
                // JWT를 Keychain에 저장
                KeychainWrapper.standard.set(jwtToken, forKey: "jwtToken")
                self.isLoggedIn = true
            }
        }.resume()
    }
}
