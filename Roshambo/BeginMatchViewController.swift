//
//  BeginMatchViewController.swift
//  Roshambo
//
//  Created by Olive Iosello on 2/3/21.
//

import UIKit

class BeginMatchViewController: UIViewController {

    
//    @IBOutlet weak var rockButton: UIButton!
//    @IBOutlet weak var paperButton: UIButton!
//    @IBOutlet weak var scissorsButton: UIButton!
//    
    
        @IBAction  func playRock(_ sender: UIButton) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
            vc.userChoice = getUserShape(sender)
            present(vc, animated: true, completion: nil)
        }

        @IBAction  func playPaper(_ sender: UIButton) {
            performSegue(withIdentifier: "play", sender: sender)
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "play" {
                let vc = segue.destination as! ResultsViewController
                vc.userChoice = getUserShape(sender as! UIButton)
            }
        }

        private func getUserShape(_ sender: UIButton) -> Shape {
            let shape = sender.title(for: UIControl.State())!
            return Shape(rawValue: shape)!
        }
    }
