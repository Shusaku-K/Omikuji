//
//  ContentView.swift
//  Omikuji
//
//  Created by 金城秀作 on 2021/02/17.
//
//完成図
//1.配列からランダムで表示する
//2.表示の際にアニメーションの動きをつける
//3.
//4.

import SwiftUI

struct ContentView: View {
    let omikujis = ["daikiti" , "chukiti", "syoukiti", "kyo"]
    @State private var kuji = "empty"
    @State private var isShow = false
    var body: some View {
        //垂直方向に配置。
        VStack {
            Text("おみくじ")
                .font(.largeTitle)
            Image(kuji)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 400)
                .scaleEffect(isShow ? 1 : 0)
            　　 //ビューを拡大するscaleEffectモディファイア「1:元のサイズ」、「0:そうでない場合」
                .rotationEffect(isShow ? .degrees(360) : .zero)
            　　 //ビューを回転させるrotationEffectモディファイア.ここでは0〜360。
                .animation(.easeInOut(duration: 1))
                //animationの種類を指定して動きつける。
            
            Spacer()
            //水平（横方向）にボタンを2つ設置。
            HStack {
                Spacer()
                
                // 「占う」ボタン
                Button(action: {
                    if !self.isShow {
                        self.isShow = true
                        self.kuji = self.omikujis.randomElement()!
                        //kujiにomikujisを代入してrandomElementメソッドを使用してランダムに取り出す。
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
                
                // 「消去」ボタン
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

