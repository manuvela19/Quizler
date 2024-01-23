//
//  ViewController.swift
//  Quizler
//
//  Created by Manuvela on 21/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
       
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let answerPressed = sender.titleLabel?.text! ?? ""
        let userGotItCorrect = quizBrain.checkAnswer(answerPressed)
        
        if(userGotItCorrect){
            //print("Right!")
            sender.backgroundColor = UIColor.green
        }
        else{
            //print("Wrong!")
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        //updateUI()
        
    }
    
    @objc func updateUI() {
        //let value = Float(1.0) / Float(12.0)
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score : " + quizBrain.getScore() + "/ 12"
        progressBar.progress = quizBrain.getProgress()
        
        
    }
    
}

