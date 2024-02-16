//
//  ContentView.swift
//  Quizzler
//
//  Created by Nishant Minerva on 15/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var trueButtonBackground = Color.clear
    
    @State var falseButtonBackground = Color.clear
    
    let quiz = [Question(q: "A slug's blood is green.", a: "True"),
                Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                Question(q: "Google was originally called 'Backrub'.", a: "True"),
                Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
]
    
    @State var questionNumber: Int = 0
    
    
    var body: some View {
        ZStack{
           Color( #colorLiteral(red: 0.1921496391, green: 0.2325932682, blue: 0.3668456078, alpha: 1))
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Spacer()
                Text(quiz[questionNumber].text)
                    .font(.title)
                    .foregroundStyle(Color.white)
//                    .bold()
                    .padding(.horizontal, 20)
                
                Spacer()
                ZStack{
                        Image("Background-Bubbles")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                }
            }
            
            .ignoresSafeArea()
            
            VStack(spacing : 40){
                Spacer()

                Button(action: {
                    updateUI(buttonName: "True")
                    
                }, label: {
                    Text("True")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                        .frame(width: 320, height: 70)
                        .background(
                            Image("Rectangle")
                        )
                })
                .background(trueButtonBackground)
                
                Button(action: {
                    updateUI(buttonName: "False")
                }, label: {
                    Text("False")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                        .frame(width: 320, height: 70)
                        .background(
                            Image("Rectangle")
                        )
                        
                })
                .background(falseButtonBackground)
                
                ProgressView("", value: Float(questionNumber + 1), total: Float(quiz.count))
                    .frame(width: 300)
                    .accentColor(Color.pink)
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .padding()

            }
        }
    }
    
   func updateUI(buttonName : String) {
        if quiz[questionNumber].answer == buttonName {
            print("Right!")
            if buttonName == "False" {
                falseButtonBackground = Color.green
            } else {
                trueButtonBackground = Color.green
            }
        } else {
            print("Wrong")
            if buttonName == "False" {
                falseButtonBackground = Color.red
            } else {
                trueButtonBackground = Color.red
            }
        }
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
       Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
               // perform your task here...
           falseButtonBackground = Color.clear
           trueButtonBackground = Color.clear
           }
    }
}

#Preview {
    ContentView()
}
