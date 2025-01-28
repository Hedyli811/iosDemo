//
//  ViewController.swift
//  bullseye
//
//  Created by LI, Hedy on 2025-01-22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hitLabel: UILabel!
    
    @IBOutlet weak var hitButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLbel: UILabel!
    @IBOutlet weak var bellseyeImageView: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    var score:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func hitMePressed(_ sender: Any) {
        let randomNumer = Int.random(in: 1...10)
        let sliderValue = Int(slider.value.rounded())
        
        if sliderValue == randomNumer {
            score += 2
            bellseyeImageView.isHidden = false
            messageLabel.text = "bullseye"
            if score >= 10{
                messageLabel.text = "10 points you win"
            }
        }else{
            bellseyeImageView.isHidden = true
            messageLabel.text = "sorry better luck next time"
        }
        
        scoreLbel.text = "\(score)"
        
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        resetGame()
    }
    
    func resetGame(){
        score = 0
        slider.value = 6
        bellseyeImageView.isHidden = true
        messageLabel.text = ""
        scoreLbel.text = "0"
    }
    

}

