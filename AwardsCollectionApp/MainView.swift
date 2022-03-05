//
//  MainView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

enum Images: String, CaseIterable {
    case airplane = "Airplane"
    case peace = "Peace"
}

struct MainView: View {
    @State private var showAward = false
    @State private var selectedAward: Images = .airplane
    
    var body: some View {
        VStack {
            HStack{
                Text("Choose your award!").foregroundColor(.purple)
                Spacer()
            }
            HStack{
            Picker("Choose your award!", selection: $selectedAward) {
                ForEach(Images.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }.pickerStyle(.segmented).frame(width: 150, height: 30)
              Spacer()
            }
            Button(action: duttonAction) {
                HStack {
                    Text(showAward ? "Hide Award" : "Show Award")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .scaleEffect(showAward ? 2 : 1)
                        .rotationEffect(.degrees(showAward ? 0 : 180))
                     .animation(.default)
                }
            }
            
            Spacer()
          if showAward && selectedAward == .airplane {
                GradientRectangles()
                    .frame(width: 250, height: 250)
                    .transition(.transition)
            } else if showAward && selectedAward == .peace {
                PeaceView()
                    .frame(width: 140, height: 300)
                    .transition(.transition2)
            
            }
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    
    private func duttonAction() {
        withAnimation {
            showAward.toggle()
        }
    }
}

extension AnyTransition {
    static var transition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    static var transition2: AnyTransition {
        let insertion = AnyTransition.move(edge: .top).combined(with: .opacity)
        let removal = AnyTransition.move(edge: .bottom).combined(with: .scale)

        return .asymmetric(insertion: insertion, removal: removal)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
