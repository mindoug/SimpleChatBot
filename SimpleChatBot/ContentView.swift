//
//  ContentView.swift
//  ChatBot
//
//  Created by Mindy Douglas on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var messages: [Message] = [Message(isBot: true, text: "Hello, I'm ChatBot.  How can I help you?")]
    
    var body: some View {
        VStack {
            HStack {
                Text("ChatBot")
                    .font(.largeTitle)
                    .bold()
                Image(systemName: "desktopcomputer")
                    .font(.system(size: 30))
            }
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    HStack {
                        if message.isBot {
                            Image(systemName: "brain")
                                .font(.system(size: 28))
                                .foregroundColor(.purple)
                        } else {
                            Spacer()
                        }
                        
                        Text(message.text)
                            .padding(10)
                            .background(message.isBot ? Color.gray.opacity(0.2) : Color.blue)
                            .foregroundColor(message.isBot ? .black : .white)
                            .clipShape(RoundedRectangle(cornerRadius: 5.0))
                        
                        if message.isBot {
                            Spacer()
                        } else {
                            Image(systemName: "person.fill")
                                .font(.system(size: 35))
                                .cornerRadius(1.0)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            HStack {
                TextField("Type a message for ChatBot", text: $message)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                Image(systemName: "paperplane")
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
                    .onTapGesture {
                        if message.count > 0 {
                            let userMessage = Message(isBot: false, text: message)
                            messages.append(userMessage)
                            message = ""
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                messages.append(BotBrain().processMessage(message: userMessage))
                            }
                        }
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
