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


    @IBAction func checkStudentAnswers(_ sender: Any) {
    }
}

