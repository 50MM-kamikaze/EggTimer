# Intro 
---
-  setup skeleton project 
- swift IF / ELSE statement 
- swift switch statements 
- Dictionaries 
- Optionals 
- create a UI projectView to keep track of time 
- How to debug the app 
# step 1 
---
- link Soft , medium , hard buttons to the IBAction in UI Kit 
# step 2 
---
- use either if else or switch statements as shown below, below used switch statements 
```swift 
import UIKit

class ViewController: UIViewController {
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle
        switch hardness {
        case "Soft":
            print(softTime)
        case "Medium":
            print(mediumTime)
        case "Hard":
            print(hardTime)
        default:
            print("Error")
        }   
    }
}

```
# step 3 
--- 
- another method to do the same thing using dictionary 
```swift 
import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft" : 5 , "Medium" : 7 ,"Hard" : 12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle
        switch hardness {
        case "Soft":
            print(eggTimes["Soft"]!)
        case "Medium":
            print(eggTimes["Medium"]!)
        case "Hard":
            print(eggTimes["Hard"]!) // ! operator is used cause we know
        default:
            print("Error")
        }
        
        
    }
    

}

```
or 
```swift 
import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft" : 300 , "Medium" : 420 ,"Hard" : 720]
    var secondsRemaining = 60
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        // let hardness = sender.currentTitle // current title is optional , we need to convert it to non optional dataType like shown below
        let hardness = sender.currentTitle!
        print(eggTimes[hardness])// when printed , we will get optional , because, thats how dictionaries are worked in swift
        print(eggTimes[hardness]!) // even this gives a normal integer , not optional
        let result = eggTimes[hardness]!
        print(result) // gives as normal integer, not with optional
        
        }
}

```
# step 4 
---
- shows the countdown of second when pressed 
```swift 
import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft" : 300 , "Medium" : 420 ,"Hard" : 720]
    var secondsRemaining = 60
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    @objc func updateCounter() {
        //example functionality
        if secondsRemaining > 0 {
            print("\(secondsRemaining) Seconds left.")
            secondsRemaining -= 1
        }
    }

}
```
- but the problem in the above code is , we are calling the function multiple times when we are typing the button, we need to restart the timer when the function restarts 
```swift 
import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft" : 300 , "Medium" : 420 ,"Hard" : 720]
    var secondsRemaining = 60
    var timer = Timer() // new
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate() //new , will make a new timer after collapsing the previous when the button is pressed again for new hardness
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true) //new
        } 
    @objc func updateCounter() {
        //example functionality
        if secondsRemaining > 0 {
            print("\(secondsRemaining) Seconds left.")
            secondsRemaining -= 1
        }
    }

}

```
- To make the titleLabel change to Done! 
```swift 
import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft" : 10 , "Medium" : 1 ,"Hard" : 1]
    var secondsRemaining = 60
    var timer = Timer()
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

        }
    @objc func updateCounter() {
        //example functionality
        if secondsRemaining > 0 {
            print("\(secondsRemaining) Seconds left.")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done!" // so here we will get secondsRemaining = 0 , then we need to change the label, so we will end the timer first then make the label change to "Done!"
        }
    }

}

```
# step 5 
---
- Make the progress view
- UIProgressView