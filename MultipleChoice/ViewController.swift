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
    }
    
    // MARK: Methods
    @IBAction func checkStudentAnswers(_ sender: Any) {
        // Avoid false input
        guard let questionNumberInputAsString = questionNumber.text, questionNumberInputAsString != "" else {
            outputMessage.text = "Please enter an integer value greater than zero."
            return
        }
        
        guard let questionNumberInputAsInt = Int(questionNumberInputAsString), questionNumberInputAsInt > 0 else {
            outputMessage.text = "Please enter an integer value greater than zero."
            return
        }
        
        guard let correctAnswerInput = correctAnswer.text, correctAnswerInput != "", correctAnswerInput.count == questionNumberInputAsInt else {
            outputMessage.text = "Please be sure you input exactly \(questionNumberInputAsInt) answers for the answer key."
            return
        }
        
        guard let studentAnswer = studentAnswerInput.text, studentAnswer != "", studentAnswer.count == questionNumberInputAsInt, studentAnswer.contains("A") || studentAnswer.contains("B") || studentAnswer.contains("C") || studentAnswer.contains("D") || studentAnswer.contains("E") else {
            outputMessage.text = "Please be sure you input exactly \(questionNumberInputAsInt) answers for student answers."
            return
        }
         let possibleCharacter = "ABCDE"
        
        for characters in studentAnswer {
            guard possibleCharacter.contains(characters) else {
                outputMessage.text = "Student answers contain invalid choices, please ensure only character A, B, C, D or E are used."
                return
            }
            
        }
        for characters in correctAnswerInput {
           
            guard possibleCharacter.contains(characters) else {
                outputMessage.text = "Correct answers contain invalid choices, please ensure only character A, B, C, D or E are used."
                return
            }
            
            
        }
        
        
    }


}
