//
//  ContentView.swift
//  Memorize
//
//  Created by Marcus Vinicius Caetano de Freitas on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView(isFaceUp: true)
            CardView()
        }
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(){
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12.0)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12.0)
                    .strokeBorder(lineWidth: 2.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text("Hello, world!😊")
            } else {
                RoundedRectangle(cornerRadius: 12.0)
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    ContentView()
}
