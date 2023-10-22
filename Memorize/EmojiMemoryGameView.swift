//
//  ContentView.swift
//  Memorize
//
//  Created by Marcus Vinicius Caetano de Freitas on 20/10/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var ViewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            title
            Spacer()
            ScrollView {
                cards
            }
            Button("Shuffle") {
                ViewModel.shuffle()
            }

        }.padding()
    }
    
    var title: some View {
        Text("Memorize")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.teal)
    }
    
    
    var cards: some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(ViewModel.cards.indices, id: \.self) { index in
                CardView(ViewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
    }

    
}

struct CardView: View {
    let card : MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group {
                base.fill(.white)
                base
                    .strokeBorder(lineWidth: 2.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }.opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView(ViewModel: EmojiMemoryGame())
}
