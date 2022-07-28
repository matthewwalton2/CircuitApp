//
//  SoundManager.swift
//  Circuits App
//
//  Created by CSCI Account on 2/1/21.
//

import Foundation
import AVFoundation

class SoundManager {
    
    // Handles the playing of all sounds
    
    var audioPlayer:AVAudioPlayer?
    
    enum soundEffect {
        // For each value the soundEffect can be, use the case keyword to give a name to that value (then add to playSound switch cases)
        case ding
    }
    
    func playSound(effect:soundEffect) {
        // Set the sound file name
        var soundFileName = ""
        
        switch effect {
        
            case .ding:
                soundFileName = "Ding"
        }
        
        // Get the filepath to the .wav file in the audioFiles folder
        
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: ".wav", inDirectory: "audioFiles")
        
        // Check that it's not nil
        guard bundlePath != nil else {
            return
        }
        
        // Create the URL for the filename
        let url = URL(fileURLWithPath: bundlePath!)
        
        do {
            // Attempt to create the AVAudioPlayer
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            
            // Play the sound
            print("Playing sound!")
            audioPlayer?.play()
        }
        catch {
            return
        }
        
        
        
        
    }
}
