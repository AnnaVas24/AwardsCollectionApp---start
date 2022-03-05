//
//  PeaceView.swift
//  AwardsCollectionApp
//
//  Created by Vasichko Anna on 05.03.2022.
//

import SwiftUI

struct PeaceView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ZStack{
                ForEach(0..<4) { iteration in
                    
            Ellipse()
                .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .yellow, .blue]),
                    startPoint: UnitPoint(x: 0, y: 1),
                    endPoint: UnitPoint(x: 1, y: 0)
                )
                ).rotationEffect(.degrees(Double(iteration) * 45))
                        .opacity(0.9)
                        .frame(
                            width: width * 0.7,
                            height: height * 0.7
                        )
        }
                Image(systemName: "peacesign")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                    .opacity(0.8)
                    .scaleEffect(0.7)
            }
        }
    }
}

struct PeaceView_Previews: PreviewProvider {
    static var previews: some View {
        PeaceView()
            .frame(width: 140, height: 300)
    }
}
