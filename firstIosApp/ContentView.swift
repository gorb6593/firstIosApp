//
//  ContentView.swift
//  test123
//
//  Created by 해규 on 5/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var navigateToLogin = false // 네비게이션 상태 관리
    
    var body: some View {
        NavigationStack {
            ZStack {
                // 배경 이미지
                Image("dev_picture") // Assets에 추가한 이미지
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
            }
            // 네비게이션 링크: navigateToLogin이 true일 때 LoginView로 이동
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }
            .navigationBarHidden(true) // 네비게이션 바 숨김
            .onAppear {
                // 3초 후 navigateToLogin을 true로 설정
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    navigateToLogin = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
