//
//  CircuitViewController.swift
//  Circuits App
//
//  Created by CSCI Account on 1/24/21.
//

import UIKit

class CircuitViewController: UIViewController {

    // Declare some properties
    
    var circuit:Circuit?
    var exerciseArray:[Exercise]?
    
    var currentExerciseInt = -1
    var currentExercise:Exercise?
    
    var soundPlayer = SoundManager()
    
    let playImage = UIImage(named: "playFINAL")
    let pauseImage = UIImage(named: "pauseFINAL")
    
    // Create outlets for all variable-text items
    @IBOutlet weak var circuitNameLabel: UILabel!
    @IBOutlet weak var exerciseTitleLabel: UILabel!
    @IBOutlet weak var nextExerciseLabel: UILabel!
    
    // Initialize the Exercise Name Label/Help button
    // This is named a label, but only because it functions as a tappable label
    @IBOutlet weak var exerciseNameLabel: UIButton!
    
    // Initialize outlets for the controls
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var toggleTimerButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    // Declare Timer properties
    @IBOutlet weak var timerLabel: UILabel!
    var timer:Timer?
    var duration:Int!
    var reps:Int!
    var running = false
    var timerStarted = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update all labels for the circuit
        circuitNameLabel.text = circuit?.name
        getNext(current:currentExerciseInt)

        // Do any additional setup after loading the view.
        
        // Make the Exercise Title Label support long exercise titles by adding another line of text
        exerciseNameLabel.titleLabel?.lineBreakMode = .byWordWrapping
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: - Timer Methods
    
    func loadTimer() {
        // Creates the correct display for the timerLabel (Duration or reps). The timer object is configured in the toggleTimerButtonPressed method
        timer?.invalidate()
        running = false
        if currentExercise!.duration != nil {
            // Exercise is duration-based. Display the total time of the exercise
            timerLabel.text = String(currentExercise!.duration!)
            duration = currentExercise!.duration!
        }
        else if currentExercise!.reps == 0 {
            // The current exercise is the "Complete!" or "Repeat!" exercises. Do not display anything
            timerLabel.text = ""
        }
        else {
            // TODO: - Display the reps and remove the toggleTimerButton
            // If it is a "Repeat" exercise, do not display reps
            if currentExercise?.name == "Repeat!" {
                timerLabel.text = ""
            }
            else {
                timerLabel.text = String(currentExercise!.reps!)
            }
        }
    }
    
    @IBAction func toggleTimerButtonPressed() {
        timerStarted = true
        
        // If running, now show the play icon and pause the timer where it is at
        if running == false {
            // Start the timer. Use the duration! var for the current duration, and the exercise.duration! for the total duration. Change the running boolean to true
            toggleTimerButton.setBackgroundImage(pauseImage, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
            RunLoop.main.add(timer!, forMode: .common)
            running = true
        }
        else {
            // Pause the timer. Store the remaining duration in the duration! var and display that. Change the running boolean to false.
            toggleTimerButton.setBackgroundImage(playImage, for: .normal)
            timer?.invalidate()
            timerLabel.text = String(duration!)
            running = false
        }
        
        // If not running, now show the pause icon and begin the timer from where it left off
        
    }
    
    @objc func timerFired() {
        // This method is called every second when the timer is running
        if duration! == 0 {
            // If the timer is at zero, call the getNext() exercise
            
            // Play the sound at the end of the timer
            soundPlayer.playSound(effect: .ding)
            
            // TODO: Insert timer end SOUND here
            
            
            
            running = false
            timer?.invalidate()
            getNext(current: currentExerciseInt)
        }
        else {
            // Otherwise decrement the counter for the timer and update the label
            duration! -= 1
            timerLabel.text = String(duration!)
        }
    }
    
    
    
    // MARK: - Controls Methods
    
    func loadControls() {
        // Configures the three buttons on the bottom of the screen for the current exercise

        backButton.isEnabled = true
        backButton.alpha = 1
        
        nextButton.isEnabled = true
        nextButton.alpha = 1
        
        // If current exercise is "Completed" exercise, do not show the nextButton
        if currentExerciseInt + 1 == circuit?.exerciseArray.count {
            nextButton.isEnabled = false
            nextButton.alpha = 0
        }
        
        // Displays the correct image - play, pause, or neither
        toggleTimerButton.isEnabled = true
        toggleTimerButton.alpha = 1
        
        if currentExercise?.duration != nil {
            // If the current exercise is duration based, attempts to set the image to a play button
            toggleTimerButton.setBackgroundImage(playImage, for: .normal)
        }
        else {
            // The current exercise is rep-based or is the "completed" or "repeat" exercises, so there should be no play or pause button
            toggleTimerButton.isEnabled = false
            toggleTimerButton.alpha = 0
        }
        
        //
    }
    
    // MARK: - Citcuit Navigation Methods
    
    // Create Action outlets for the control buttons
    @IBAction func backButtonTapped() {
        goBack(current: currentExerciseInt)
    }
    
    @IBAction func nextButtonTapped() {
        getNext(current: currentExerciseInt)
    }
    
    func getNext(current:Int) {
        //  Input the index of the current exercise, changes screen for the exercise at the next index
        // Update exercise properties
        currentExerciseInt += 1
        currentExercise = circuit?.exerciseArray[currentExerciseInt]
        
        // Update timer properties
        duration = nil
        timerStarted = false
        
        
        // TODO: Also update the 'Help' button for the exercise
        // Update the labels, configure the timer and controls
        exerciseNameLabel.setTitle(circuit?.exerciseArray[currentExerciseInt].getName(), for: .normal)
        exerciseTitleLabel.text = circuit?.exerciseArray[currentExerciseInt].title
        loadTimer()
        loadControls()
        
        // Check if this is the "Completed" exercise and change the screen accordingly
        if currentExerciseInt + 1 != circuit?.exerciseArray.count {
            // If there is a next exercise, update the nextExerciseLabel accordingly
            let nextExercise = circuit?.exerciseArray[currentExerciseInt + 1].getName()
            let next = "Next: "
            nextExerciseLabel.text = next + nextExercise!
            
        }
        else {
            // The current exercise is the "Completed" exercise - Do not display the exercise title, timer, next exercise, play/pause, or next button.
            exerciseTitleLabel.text = ""
            timerLabel.text = ""
            nextExerciseLabel.text = ""
        }
    }
    
    func goBack(current:Int) {
        // This method is fired when the back button is tapped. It changes the labels to display the current exercise and loads the controls and timer
        
        
        // TODO: Set up the if statements below
        // If the timer has been started, reset it and the toggleTimerButton.
        if timerStarted == false {
            // Assume the timer has not yet been started or current exercise is rep-based and move to the previous exercise
            currentExerciseInt -= 1
            nextButton.isEnabled = true
            nextButton.alpha = 1
            
            duration = nil
            timerStarted = false
            
            if currentExerciseInt >= 0 {
                // The current exercise int is in range for a valid exercise (Previous exercise exists)
                currentExercise = circuit?.exerciseArray[currentExerciseInt]
                // TODO: Also update the 'Help' button for the exercise
                // Update the labels, configure the timer and controls
                exerciseNameLabel.setTitle(circuit?.exerciseArray[currentExerciseInt].getName(), for: .normal)
                exerciseTitleLabel.text = circuit?.exerciseArray[currentExerciseInt].title
                let nextExercise = circuit?.exerciseArray[currentExerciseInt + 1].getName()
                let next = "Next: "
                nextExerciseLabel.text = next + nextExercise!
            }
            else {
                // The current exercise is the first one. Reset the timer.
                currentExerciseInt += 1
                let nextExercise = circuit?.exerciseArray[currentExerciseInt + 1].getName()
                let next = "Next: "
                nextExerciseLabel.text = next + nextExercise!
            }
            
            loadTimer()
            loadControls()
        }
        else {
            
            print("Timer started")
            
            // The timer has been started. Reset the timer, toggleTimerButton, and the timerLabel
            loadTimer()
            loadControls()
            timerStarted = false
        }
    }
    
    // MARK: - 'Help' Button Methods
    // TODO: Create 'help' button methods
    
    
    @IBAction func helpButtonPressed(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Ensure that we are segueing to the "help" view controller. If so, pass the exercise to the help view controller
        if segue.identifier == "toHelp" {
            // This is the correct segue. Pass the exercise.
            let helpPopup = segue.destination as! HelpViewController
            helpPopup.exercise = currentExercise!
        }
    }
}
