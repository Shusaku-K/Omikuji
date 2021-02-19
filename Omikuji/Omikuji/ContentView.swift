//
//  ContentView.swift
//  Omikuji
//
//  Created by 金城秀作 on 2021/02/17.
//

import SwiftUI

struct ContentView: View {
    let omikujis = ["daikiti" , "chukiti", "syoukiti", "kyo"]
    @State private var kuji = "empty"
    @State private var isShow = false
    var body: some View {
        VStack {
            Text("おみくじ")
                .font(.largeTitle)
            Image(kuji)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 400)
                .scaleEffect(isShow ? 1 : 0)
                .rotationEffect(isShow ? .degrees(360) : .zero)
                .animation(.easeInOut(duration: 1))
            
            Spacer()
            HStack {
                Spacer()
                
                Button(action: {
                    if !self.isShow {
                        self.isShow = true
                        self.kuji = self.omikujis.randomElement()!
                    }
                }) {
                Text("占う")
                    .font(.largeTitle)
                    .padding()
                    .background(Capsule()
                                    .foregroundColor(isShow ? .gray : .yellow)
                                    .frame(width: 100, height: 40)
                )
            }
                .disabled(isShow ? true : false)
                Spacer()
                
                Button(action: {
                    self.isShow = false
                }) {
                    Text("消去")
                        .font(.largeTitle)
                        .background(Capsule()
                                        .foregroundColor(!isShow ? .gray : .yellow)
                                        .frame(width: 100, height: 40)
                        )
                }
                .disabled(!isShow ? true : false)
                Spacer()
      }
  }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

