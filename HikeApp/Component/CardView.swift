//
//  CardView.swift
//  HikeApp
//
//  Created by Shubham Kumar on 17/08/24.
//

import SwiftUI

struct CardView: View {
    @State private var isShowingSheet: Bool = false
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack(spacing: 40) {
                // MARK: - Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom)
                                
                            )
                        Spacer()
                        Button {
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                // MARK: - Main Content
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                }
                
                Button {
                  randomImage()
                } label: {
                  Text("Explore More")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(
                      LinearGradient(
                        colors: [
                          .customGreenLight,
                          .customGreenMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                      )
                    )
                    .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }
            .padding(.horizontal, 30)
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
