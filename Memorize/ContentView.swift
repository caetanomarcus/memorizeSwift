//
//  ContentView.swift
//  Memorize
//
//  Created by Marcus Vinicius Caetano de Freitas on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    
    let emojisDictionary = ["faces": ["😍", "😇", "😍", "😇"], "objects": ["⌚️", "💻", "⌚️", "💻"], "foods": ["🍎", "🍇", "🍎", "🍇"] ]
    @State var emojis : [String] = ["😍", "😇", "😍", "😇"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            title
            themes
            Spacer()
            ScrollView {
                cards
            }

        }.padding()
    }
    
    var title: some View {
        Text("Memorize")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.teal)
    }
    
    var themes: some View {
        HStack {
            themeSelector(title: "faces")
            themeSelector(title: "objects")
            themeSelector(title: "foods")
        }
    }
    
    var cards: some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 120))]) {
            let shuffledCards: [String] = emojis.shuffled()
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: shuffledCards[index])
                    .aspectRatio(2/2.8, contentMode: .fit)
            }
        }
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }.imageScale(.large)
        .font(.largeTitle)

    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    func themeSelector(title : String) -> some View {
        Button(action: {
            emojis = emojisDictionary[title]!
        }, label: {
            Text(title.capitalized).foregroundStyle(.white)
        })
        .padding().border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/).background(.blue)
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group {
                base.fill(.white)
                base
                    .strokeBorder(lineWidth: 2.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text(content)
                    .font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }.foregroundColor(.orange)
    }
}

#Preview {
    ContentView()
}
