import SwiftUI
import KakaoSDKCommon
import SwiftKeychainWrapper

@main
struct firstIosAppApp: App {
    @StateObject private var viewModel = LoginViewModel()
    
    init() {
        // 카카오 SDK 초기화
        KakaoSDK.initSDK(appKey: "YOUR_NATIVE_APP_KEY") // 실제 NATIVE_APP_KEY로 교체
    }
    
    var body: some Scene {
        WindowGroup {
            // 저장된 JWT가 있고 로그인 상태면 MainView, 아니면 LoginView
            if KeychainWrapper.standard.string(forKey: "jwtToken") != nil && viewModel.isLoggedIn {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}
