//
//  ViewController.swift
//  HW6-GamePoint
//
//  Created by 沈庭鋒 on 2023/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    var scoreA : Int = 0
    var scoreB : Int = 0
    var scoreA2 : Int = 0
    var scoreB2 : Int = 0
    var player : String = ""
    
    
    
    
    
    @IBOutlet weak var playerName1: UILabel!
    
    @IBOutlet weak var playerName2: UILabel!
    
    @IBOutlet weak var scoreLabelA: UILabel!
    
    @IBOutlet weak var scoreLabelB: UILabel!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NewGame()
        
    }


    @IBAction func getPointButtonA(_ sender: UIButton) {
  
        switch sender.tag{
        case 1 :
            scoreA += 1
            scoreA2 = scoreA
            getPoint()
        case 2 :
            scoreB += 1
            scoreB2 = scoreB
            getPoint()
        default : return
        }
    }
    
    
    @IBAction func retrunButton(_ sender: UIButton) {
        
        switch sender.tag{
        case 1 :
            scoreA -= 1
            scoreA2 = scoreA
            getPoint()
        case 2 :
            scoreB -= 1
            scoreB2 = scoreB
            getPoint()
        default : return
        }
        
    }
    
    
    

    
    @IBAction func NewGameButton(_ sender: Any) {
        NewGame()
    }
    
    @IBAction func changeButton(_ sender: Any) {
 
        scoreA = scoreB
        scoreB = scoreA2
        scoreA2 = scoreB2
        scoreB2 = scoreB
        scoreLabelA.text = String(scoreA2)
        scoreLabelB.text = String(scoreB2)
        if playerName1.text == "player 1"{
            playerName1.text = "player 2"
            playerName2.text = "player 1"
        }else{
            playerName1.text = "player 1"
            playerName2.text = "player 2"
        }
        
    }
    
    
    func NewGame(){
        scoreA = 0
        scoreB = 0
        scoreA2 = 0
        scoreB2 = 0
        scoreLabelA.text = "0"
        scoreLabelB.text = "0"
    }
    
    func gameEndAlert(){
        if scoreA2 > scoreB2 {
           player = "player 1"
        }else{ player = "player 2" }
        let endAlert = UIAlertController(title: "Game End", message: "Winner is \(player)", preferredStyle: .alert)
        let endAcrion = UIAlertAction(title: "Start New Game", style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            self.NewGame()
        })
        
        endAlert.addAction(endAcrion)
        
        present(endAlert, animated: true)
    }
    
    func getPoint(){
        
        scoreLabelA.text = String(scoreA2)
        scoreLabelB.text = String(scoreB2)
        
        let pointDiff = abs(scoreA2-scoreB2)
        
        if pointDiff > 1{
            if scoreA2 > 10 || scoreB2 > 10{
                gameEndAlert()
            }
        }
    }
    
    
}

