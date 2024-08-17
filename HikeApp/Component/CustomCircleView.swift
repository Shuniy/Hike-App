//
//  CustomCircleView.swift
//  HikeApp
//
//  Created by Shubham Kumar on 17/08/24.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false

    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            Color.customIndigoMedium,
                            Color.customSalmonLight],
                        startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing)
                )
                .onAppear(perform: {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                    }
                })
            .frame(width: 256, height: 256)
            MotionAnimationView()
        }
    }
}

#Preview {
    CustomCircleView()
}
