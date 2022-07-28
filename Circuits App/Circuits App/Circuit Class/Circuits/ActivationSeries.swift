//
//  ActivationSeries.swift
//  CircuitsApp
//
//  Created by CSCI Account on 1/21/21.
//

import Foundation
import UIKit


class ActivationSeries: Circuit {
    
    func getCircuit() -> Circuit {
        // Returns a circuit object that has been configured for the Activation Series circuit
        
        // Create the circuit object and attributes
        let activationSeries = Circuit()
        
        activationSeries.name = "Activation Series"
        
        activationSeries.color = "cyan" // Or something idk
        
        activationSeries.exerciseArray = getExerciseArray()
        
        return activationSeries
    }
    
    func getExerciseArray() -> [Exercise] {
        // Returns an array containing the exercises of the circuit in order

        var exerciseArray = [Exercise]()
        
        // Create the exercises of the circuit
        let fishTailOblique = Exercise()
        fishTailOblique.setName(name: "Fish Tail Oblique")
        fishTailOblique.setReps(reps: 10)
        
        let outerHipActivation = Exercise()
        outerHipActivation.setName(name: "Outer Hip Activation")
        outerHipActivation.setReps(reps: 10)
        
        let gluteMaxActivation = Exercise()
        gluteMaxActivation.setName(name: "Glute Max Activation")
        gluteMaxActivation.setReps(reps: 10)
        
        let adductorActivation = Exercise()
        adductorActivation.setName(name: "Adductor Activation")
        adductorActivation.setReps(reps: 10)
        
        let groinActivation = Exercise()
        groinActivation.setName(name: "Groin Activation")
        groinActivation.setReps(reps: 10)
        
        // Create the exercises of the circuit
        exerciseArray += [fishTailOblique, outerHipActivation, gluteMaxActivation, adductorActivation, groinActivation]
        
        // Return the finished array
        return exerciseArray
    }
}

