//
//  BotBrain.swift
//  SimpleChatBot
//
//  Created by Mindy Douglas on 5/13/24.
//

import Foundation
import SwiftUI

struct BotBrain {
    
     func processMessage(message: Message) -> Message {
        var response: String = "I don't understand."
        let userMessage = message.text.lowercased()
        
        if userMessage.contains("hello") || userMessage.contains("hi") {
            response = "Greetings"
        } else if userMessage.contains("red") || userMessage.contains("yellow") || userMessage.contains("green") || userMessage.contains("purple") || userMessage.contains("black") || userMessage.contains("white") || userMessage.contains("color") {
            response = "Colors are the smiles of nature"
        } else if userMessage.contains("orange") || userMessage.contains("blue") || userMessage.contains("rainbow") {
            response = "Colors, like features, follow the changes of the emotions"
        } else if userMessage.contains("How") && userMessage.contains("do") || userMessage.contains("does") {
            response = "Why don't you ask my friend Google"
        } else if userMessage.contains("should") {
            response = "Do you always find it hard to make decisions?"
        } else if userMessage.contains("name") {
            response = "I am ChatBot 2.0 at your service"
        } else if userMessage.contains("live") || userMessage.contains("old") {
            response = "The longer I live the more beautiful life becomes."
        } else if userMessage.contains("beauty") || userMessage.contains("is") && userMessage.contains("What") {
            response = "What is the color of a sunset?"
        } else if userMessage.contains("friend") {
            response = "A true friend is a sheltering tree"
        }else if userMessage.contains("food") || userMessage.contains("pizza") || userMessage.contains("burger") || userMessage.contains("taco") || userMessage.contains("eat") {
            response = "You're making me hungry."
        } else if userMessage.contains("dumb") {
            response = "Please be kind"
        } else {
            response = "But what do you REALLY want to know?"
        }
        return Message(isBot: true, text: response)
    }
}
