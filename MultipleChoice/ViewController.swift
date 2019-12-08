//
//  ViewController.swift
//  MultipleChoice
//
//  Created by Chen, Sihan on 2019-12-03.
//  Copyright © 2019 Chen, Sihan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var questionNumber: UITextField!
    @IBOutlet weak var correctAnswer: UITextField!
    @IBOutlet weak var studentAnswerInput: UITextField!
    @IBOutlet weak var outputMessage: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outputMessage.text = ""
    }
    
    // MARK: Methods
    @IBAction func checkStudentAnswers(_ sender: Any) {
        // Avoid false input
        // Avoid empty text
        guard let questionNumberInputAsString = questionNumber.text, questionNumberInputAsString != "" else {
            outputMessage.text = "Please enter an integer value greater than zero."
            return
        }
        
        // Avoid decimals, set the range of the numbers
        guard let questionNumberInputAsInt = Int(questionNumberInputAsString), questionNumberInputAsInt > 0 else {
            outputMessage.text = "Please enter an integer value greater than zero."
            return
        }
        // Avoid empty text for correct answer
        // Word count has to match question number input
        guard let correctAnswerInput = correctAnswer.text, correctAnswerInput != "", correctAnswerInput.count == questionNumberInputAsInt else {
            outputMessage.text = "Please be sure you input exactly \(questionNumberInputAsInt) answers for the answer key."
            return
        }
        // Avoid empty text for student answer
        // Word count has to match question number input
        guard let studentAnswer = studentAnswerInput.text, studentAnswer != "", studentAnswer.count == questionNumberInputAsInt else {
            outputMessage.text = "Please be sure you input exactly \(questionNumberInputAsInt) answers for student answers."
            return
        }
        // Make sure only "ABCDE" are used
        let possibleCharacter = "ABCDE"
        // Use for...in loop to avoid user using letters other than ABCDE
        for characters in studentAnswer {
            guard possibleCharacter.contains(characters) else {
                outputMessage.text = "Student answers contain invalid choices, please ensure only character A, B, C, D or E are used."
                return
            }
            
        }
        // Use for...in loop to avoid user using letters other than ABCDE
        for characters in correctAnswerInput {
            
            guard possibleCharacter.contains(characters) else {
                outputMessage.text = "Correct answers contain invalid choices, please ensure only character A, B, C, D or E are used."
                return
            }
            
        }
        
        
      // Use index to check if student answer and correct answer match each other
        var indexNumber = -1
        var numberOfCorrectAnswers = 0
        for character in correctAnswerInput {
            indexNumber += 1
        let indexPosition = studentAnswer.index(studentAnswer.startIndex, offsetBy: indexNumber)
        let characterInStudnetAnswer = studentAnswer[indexPosition]
            if character == characterInStudnetAnswer {
                numberOfCorrectAnswers += 1
            }
            
        
            
            
            
        }
        
        
        
        
        outputMessage.text = "The student answered \(numberOfCorrectAnswers) question(s) correctly."
    }
    
    
    
    
}
