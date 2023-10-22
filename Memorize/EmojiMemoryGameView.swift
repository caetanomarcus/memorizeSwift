//
//  ContentView.swift
//  Memorize
//
//  Created by Marcus Vinicius Caetano de Freitas on 20/10/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var ViewModel: EmojiMemoryGame
    
    let emojisDictionary = [
        "faces": ["😍", "😇", "😍", "😇", "🤯", "😱", "🤯","😱"],
        "objects": ["⌚️", "💻", "⌚️", "💻"],
        "foods": ["🍎", "🍇", "🍎", "🍇"] ]
    @State var emojis : [String] = []
    var body: some View {
        VStack {
            title
            Spacer()
            ScrollView {
                cards
            }
            themes

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
            themeSelector(title: "faces", icon: "person.circle.fill")
            themeSelector(title: "objects", icon: "faxmachine")
            themeSelector(title: "foods", icon: "fork.knife")
        }
    }
    
    var cards: some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 90))]) {
            let shuffledCards: [String] = emojis.shuffled()
            ForEach(shuffledCards.indices, id: \.self) { index in
                CardView(content: shuffledCards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }

    
    func themeSelector(title : String, icon : String) -> some View {
        Button(action: {
            emojis = emojisDictionary[title]!
        }, label: {
            VStack {
                Image(systemName: icon).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(title.capitalized).font(.subheadline)
            }
        })
        .padding().imageScale(.large)
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
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
    EmojiMemoryGameView()
}
