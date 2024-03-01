//
//  ToastViewModifier.swift
//  DummyApi
//
//  Created by Bhumika Patel on 01/03/24.
//

import SwiftUI

extension View {
    func toast(isPresented: Binding<Bool>, message: String) -> some View {
        ModifiedContent(
            content: self,
            modifier: ToastViewModifier(isPresented: isPresented, message: message)
        )
    }
}

struct ToastViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    let message: String

    func body(content: Content) -> some View {
        content
            .overlay(
                isPresented ?
                    ToastView(message: message)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isPresented = false
                            }
                        }
                    }
                    : nil
            )
    }
}
