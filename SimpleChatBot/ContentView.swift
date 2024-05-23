//
//  ContentView.swift
//  ChatBot
//
//  Created by Mindy Douglas on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var messages: [Message] = [Message(isUser: false, text: "Hello, I'm ChatBot.  How can I help you?")]
    
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
                        if message.isUser {
                            Spacer()
                        } else {
                            Image(systemName: "brain")
                                .font(.system(size: 28))
                                .foregroundColor(.purple)
                        }
                        
                        Text(message.text)
                            .padding(10)
                            .background(message.isUser ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(message.isUser ? .white : .black)
                            .clipShape(RoundedRectangle(cornerRadius: 5.0))
                        
                        if message.isUser {
                            Image(systemName: "person.fill")
                                .font(.system(size: 35))
                                .cornerRadius(1.0)
                                .foregroundColor(.blue)
                        } else {
                            Spacer()
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
                            let userMessage = Message(isUser: true, text: message)
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
