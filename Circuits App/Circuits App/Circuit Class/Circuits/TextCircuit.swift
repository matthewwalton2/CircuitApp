//
//  TextCircuit.swift
//  Circuits App
//
//  Created by CSCI Account on 1/29/21.
//

import Foundation
import UIKit


class TestCircuit: Circuit {
    
    func getCircuit() -> Circuit {
        // Returns a circuit object that has been configured for the Activation Series circuit
        
        // Create the circuit object and attributes
        let testCircuit = Circuit()
        
        testCircuit.name = "Test Circuit"
        
        testCircuit.color = "cyan" // Or something idk
        
        testCircuit.exerciseArray = getExerciseArray()
        
        return testCircuit
    }
    
    func getExerciseArray() -> [Exercise] {
        // Returns an array containing the exercises of the circuit in order

        var exerciseArray = [Exercise]()
        
        // Create the exercises of the circuit
        let exercise1 = Exercise()
        exercise1.setName(name: "Exercise 1")
        exercise1.setDuration(time: 10)
        
        let exercise2 = Exercise()
        exercise2.setName(name: "Exercise 2")
        exercise2.setReps(reps: 2)
        
        let exercise3 = Exercise()
        exercise3.setName(name: "Exercise 3")
        exercise3.setDuration(time: 30)
        
        let exercise4 = Exercise()
        exercise4.setName(name: "Exercise 4")
        exercise4.setReps(reps: 4)
        
        
        
        // Create the exercises of the circuit
        exerciseArray += [exercise1, exercise2, exercise3, exercise4]
        
        // Return the finished array
        return exerciseArray
    }
}


