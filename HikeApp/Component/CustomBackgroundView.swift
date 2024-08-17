//
//  CustomBackgroundView.swift
//  HikeApp
//
//  Created by Shubham Kumar on 17/08/24.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            Color.customGreenDark
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y: 12)
            Color.customGreenLight
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y: 3)
                .opacity(0.85)
            LinearGradient(colors: [Color.customGreenLight, Color.colorGreenMedium], startPoint: .top, endPoint: .bottom)
                .clipShape(RoundedRectangle(cornerRadius: 40))
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
