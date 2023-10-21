//
//  ContentView.swift
//  Memorize
//
//  Created by Marcus Vinicius Caetano de Freitas on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    let emojis : [String] = ["😍", "😇", "😜", "😡"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12.0)
            if isFaceUp {
                base.fill(.white)
                base
                    .strokeBorder(lineWidth: 2.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text(content)
            } else {
                base
                    .foregroundColor(.blue)
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
