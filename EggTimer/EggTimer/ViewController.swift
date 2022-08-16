//
//  SceneDelegate.swift
//  EggTimer
//  Created by Batuhan Sena Sert on 08/8/2022.

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    
    var player: AVAudioPlayer!
    let eggTimes : [String : Int] = ["Soft": 5, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var uiDone: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0
        secondsPassed = 0
        uiDone.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            secondsPassed += 1 //
            progressBar.progress = Float(secondsPassed) / Float(totalTime) //
            
        } else {
            timer.invalidate()
            uiDone.text = "DONE!"
            //Alarm sound oynatma
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
            }
    }


}
