//
//  ViewController.swift
//  RPS
//
//  Created by Zheng Liu on 7/23/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var playerRock: UIButton!
    @IBOutlet weak var playerScissor: UIButton!
    @IBOutlet weak var playerPaper: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playerSelectRock(_ sender: Any) {
        play(playerSign: .rock)
    }
    
    @IBAction func playerSelectScissor(_ sender: Any) {
        play(playerSign: .scissors)
    }
    
    @IBAction func playerSelectPaper(_ sender: Any) {
        play(playerSign: .paper)
    }
    
    @IBAction func playAgainPressed(_ sender: Any) {
        updateUI(for: .start)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(for: .start)
    }

    func updateUI(for state: GameState) {
        if state == .lose {
            gameStatus.text = "You lost!"
            view.backgroundColor = UIColor.red
        } else if state == .win {
            gameStatus.text = "You won!"
            view.backgroundColor = UIColor.green
        } else if state == .draw {
            gameStatus.text = "It's a draw!"
            view.backgroundColor = UIColor.yellow
        } else {
            gameStatus.text = "Select your sign!"
            view.backgroundColor = UIColor.white
            appSign.text = "🤖"
            
            playAgainButton.isHidden = true
            playerRock.isEnabled = true
            playerScissor.isEnabled = true
            playerPaper.isEnabled = true
            
            playerRock.isHidden = false
            playerScissor.isHidden = false
            playerPaper.isHidden = false
        }
    }

    func play(playerSign: Sign) {
        let appSign = randomSign()
        self.appSign.text = appSign.emoji
        // Compare the player's sign with the app's sign
        var gameState = playerSign.compare(with: appSign)
        updateUI(for: gameState)
        
        
        playerRock.isEnabled = false
        playerScissor.isEnabled = false
        playerPaper.isEnabled = false
        
        playerRock.isHidden = true
        playerScissor.isHidden = true
        playerPaper.isHidden = true
        
        if playerSign == .rock {
            playerRock.isHidden = false
        } else if playerSign == .paper {
            playerPaper.isHidden = false
        } else if playerSign == .scissors {
            playerScissor.isHidden = false
        }
        
        playAgainButton.isHidden = false
    }
}

