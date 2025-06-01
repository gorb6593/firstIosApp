import SwiftUI
import KakaoSDKAuth

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                // 배경: 부드러운 그라디언트
                LinearGradient(
                    gradient: Gradient(colors: [.gray.opacity(0.2), .white]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    // 제목
                    Text("로그인")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .padding(.bottom, 40)

                    // 네이버 로그인 버튼 (미구현)
                    Button(action: {
                        print("네이버 로그인 버튼 눌림")
                    }) {
                        HStack {
                            Image(systemName: "n.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.green)
                            Text("네이버로 로그인")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // 애플 로그인 버튼 (미구현)
                    Button(action: {
                        print("애플 로그인 버튼 눌림")
                    }) {
                        HStack {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.white)
                            Text("Apple로 로그인")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // 카카오 로그인 버튼
                    Button(action: {
                        viewModel.loginWithKakao()
                    }) {
                        HStack {
                            Image(systemName: "k.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.black)
                            Text("카카오로 로그인")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundStyle(.black)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // 에러 메시지 표시
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }

                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 100)
                .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                    MainView() // 로그인 성공 시 이동할 메인 뷰
                }
            }
        }
        .onOpenURL { url in
            // 카카오톡 로그인 콜백 처리
            //_ = AuthApi.handleOpenUrl(url: url)
        }
    }
}

struct MainView: View {
    var body: some View {
        VStack {
            Text("메인 화면")
                .font(.largeTitle)
                .fontWeight(.bold)
            // 여기에 메인 화면 콘텐츠 추가
        }
    }
}

#Preview {
    LoginView()
}
