

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft" : 30 , "Medium" : 40 ,"Hard" : 50] //seconds
    var totalTime = 0
    var secondPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        titleLabel.text = hardness
        secondPassed = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

        }
    @objc func updateCounter() {
        //example functionality
        if secondPassed < totalTime {
            print("\(secondPassed) Seconds passed.")
            secondPassed += 1
            let percentageProgress =  Float (secondPassed) / Float(totalTime)
            print(percentageProgress)
            progressBar.progress = percentageProgress
            //secondPassed += 1  if we keep this statement here we wont get the secondPassed to maximum value
        } else {
            timer.invalidate()
            titleLabel.text = "Done!" // so here we will get secondsRemaining = 0 , then we need to change the label, so we will end the timer first then make the label change to "Done!"
            playSound(soundName: "alarm_sound")
        }
    }
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }

}
