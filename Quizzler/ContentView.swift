//
//  ContentView.swift
//  Quizzler
//
//  Created by Nishant Minerva on 15/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var quizBrain = QuizBrain()
    @State var trueButtonBackground = Color.clear
    @State var falseButtonBackground = Color.clear
    @State var questionLabel = ""
    @State var progress : Float = 0.00
    @State var score : Int = 0
    
    
    var body: some View {
        ZStack{
            Color( #colorLiteral(red: 0.1921496391, green: 0.2325932682, blue: 0.3668456078, alpha: 1))
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Text("Score : \(score)")
                    .foregroundStyle(Color.white)
                    .font(.headline)
                    .padding()
                Spacer()
                Text(questionLabel)
                    .font(.title2)
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
                
                ProgressView("", value: progress)
                    .frame(width: 300)
                    .accentColor(Color.pink)
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .padding()
                
            }
        }
        .onAppear{
            questionLabel = quizBrain.getQuestionText()
            progress = quizBrain.getProgress()
            score = quizBrain.getScore()
            
            falseButtonBackground = Color.clear
            trueButtonBackground = Color.clear
        }
    }
    
    func updateUI(buttonName : String) {
        
        let userAnswer = buttonName
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            if buttonName == "False" {
                falseButtonBackground = Color.green
            } else {
                trueButtonBackground = Color.green
            }
        } else {
            if buttonName == "False" {
                falseButtonBackground = Color.red
            } else {
                trueButtonBackground = Color.red
            }
        }
        
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
            // perform your task here...
            questionLabel = quizBrain.getQuestionText()
            progress = quizBrain.getProgress()
            score = quizBrain.getScore()
            
            falseButtonBackground = Color.clear
            trueButtonBackground = Color.clear
        }
        
        
    }
}

#Preview {
    ContentView()
}
