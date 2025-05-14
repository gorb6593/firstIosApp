//
//  LoginView.swift
//  firstIosApp
//
//  Created by 해규 on 5/12/25.
//
import SwiftUI

struct LoginView: View {
    var body: some View {
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

                // 네이버 로그인 버튼
                Button(action: {
                    print("네이버 로그인 버튼 눌림")
                }) {
                    HStack {
                        Image(systemName: "n.circle.fill") // 임시 로고
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

                // 애플 로그인 버튼
                Button(action: {
                    print("애플 로그인 버튼 눌림")
                }) {
                    HStack {
                        Image(systemName: "apple.logo") // 임시 로고
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
                    print("카카오 로그인 버튼 눌림")
                }) {
                    HStack {
                        Image(systemName: "k.circle.fill") // 임시 로고
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

                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 100)
        }
    }
}

#Preview {
    LoginView()
}
