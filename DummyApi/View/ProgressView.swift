//
//  ProgressView.swift
//  DummyApi
//
//  Created by Bhumika Patel on 01/03/24.
//

import SwiftUI

struct ProgressView: View {
    var body: some View {
        ZStack{
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            Text("Fetching Data......")
        }
    }
}

#Preview {
    ProgressView()
}
