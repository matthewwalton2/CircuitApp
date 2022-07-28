//
//  ActivationSeries.swift
//  CircuitsApp
//
//  Created by CSCI Account on 1/21/21.
//

import Foundation
import UIKit


class PelvicGirdle: Circuit {
    
    func getCircuit() -> Circuit {
        // Returns a circuit object that has been configured for the Activation Series circuit
        
        // Create the circuit object and attributes (name, color, exercise array)
        let pelvicGirdle = Circuit()
        
        pelvicGirdle.name = "Pelvic Girdle Routine"
        
        pelvicGirdle.color = "purple"
        
        pelvicGirdle.exerciseArray = getExerciseArray()
        
        return pelvicGirdle
    }
    
    func getExerciseArray() -> [Exercise] {
        // Returns an array containing the exercises of the circuit in order

        var exerciseArray = [Exercise]()
        
        // Create the exercises of the circuit
        // In this circuit, each needs a name, reps, and title
        let legRaiseStraight = Exercise()
        legRaiseStraight.name = "Leg Raise Straight"
        legRaiseStraight.reps = 15
        legRaiseStraight.title = "Lying on Side"
        
        let legRaiseFootIn = Exercise()
        legRaiseFootIn.name = "Leg Raise Foot In"
        legRaiseFootIn.reps = 15
        legRaiseFootIn.title = "Lying on Side"
        
        let legRaiseFootOut = Exercise()
        legRaiseFootOut.name = "Leg Raise Foot Out"
        legRaiseFootOut.reps = 15
        legRaiseFootOut.title = "Lying on Side"
        // Pretend this is the whole circuit
        
        
        // Create the exercises of the circuit
        exerciseArray += [legRaiseStraight, legRaiseFootOut, legRaiseFootIn]
        
        // Return the finished array
        return exerciseArray
    }
}

