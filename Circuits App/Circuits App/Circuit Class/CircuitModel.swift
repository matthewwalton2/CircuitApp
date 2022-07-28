//
//  CircuitModel.swift
//  Circuits App
//
//  Created by CSCI Account on 1/23/21.
//

import Foundation
import UIKit

class CircuitModel {
    
    var row = 1
    
    func getCircuits() -> [Circuit]{
        // Create an array of circuits and return it at the end
        var generatedCircuits = [Circuit]()
        
        // Create a boolean to know when to stop reading in circuits
        var moreCircuits = true
        
        // To read in circuit data from spreadsheet file, create a 2-d array and pass the information from each spreadsheet cell into the proper array index
        if let fileData = readDataFromCSV(fileName: "circuitSpreadsheet", fileType: "csv") {
            // fileData is one large string. This method prints out the first cell of the array
            var data = fileData
            data = cleanRows(file: data)
            let csvArray = csv(data: data)
            print("readDataFromCSV: Reading data")
            
            // Loop through each circuit in the spreadsheet, creating and adding each exercise to the circuit until all circuits have been added.
            while moreCircuits {
                
                // Create a boolean to know when to stop reading in exercises
                var moreExercises = true
                
                // Create a circuit object
                let currentCircuit = Circuit()
                
                // Name the circuit object
                currentCircuit.name = csvArray[row][1]
                print("Working on " + currentCircuit.name)
                
                // TODO: - Get the color for the circuit object. If it doesn't have one, give it a random one
                
                // Create a while loop moreExercises to loop through each exercise in the circuit, stopping after the complete exercise
                while moreExercises {
                    row += 1
                    // Keep track of the current exercise
                    var currentExercise = Exercise()
                    
                    currentExercise.setName(name: csvArray[row][1])
                    print("Working on adding " + currentExercise.getName() + " to " + currentCircuit.name)
                    
                    if currentExercise.getName() == "Repeat" {
                        // If the exercise name is repeat, create the "repeat" exercise and add it to the Circuit's exercise array
                        currentExercise = repeatExercise()
                        currentCircuit.exerciseArray += [currentExercise]
                    }
                    else if currentExercise.getName() == "Complete" {
                        // If the exercise name is complete, create the "complete" exercise and then break out of the while loop
                        currentExercise = endExercise()
                        currentCircuit.exerciseArray += [currentExercise]
                        moreExercises = false
                        row += 1
                        row += 1
                    }
                    else {
                        // Obtain the title of the exercise
                        currentExercise.setTitle(title: csvArray[row][0])
                        
                        // Obtain the description of the exercise
                        currentExercise.setDescription(description: csvArray[row][4])
                        
                        // Attempt to obtain the reps of the exercise
                        if csvArray[row][2] != "" {
                            // The current exercise is rep-based
                            currentExercise.setReps(reps: Int(csvArray[row][2])!)
                        }
                        else if csvArray[row][3] != "" {
                            // The current exercise is duration-based
                            currentExercise.setDuration(time: Int(csvArray[row][3])!)
                        }
                        else {
                            // Something is wrong - the current exercise has no reps or duration on the spreadsheet
                            print("No reps or duration could be found for " + currentExercise.getName())
                        }
                        
                        // Add the exercise to the circuit
                        currentCircuit.exerciseArray += [currentExercise]
                    }
                }
                // Add the circuit to the array
                generatedCircuits += [currentCircuit]
                
                // Check to see if there are more circuits
                let isIndexValid = csvArray.indices.contains([row + 5][0])
                if isIndexValid == false {
                    moreCircuits = false
                }
            }
        }
        else {
            print("readDataFromCSV: Could not read from csvSpreadsheet using some random code from the internet")
            moreCircuits = false
        }
        return generatedCircuits
    }
    
    
    // MARK: - Special Exercises Methods
    func endExercise() -> Exercise {
        // Create an exercise for display purposes when the circuit is complete
        let complete = Exercise()
        complete.setName(name: "Complete!")
        complete.setReps(reps: 0)
        return complete
    }
    
    func repeatExercise() -> Exercise {
        // Create an exercise for display purposes when the circuit is to be repeated
        let repeatCircuit = Exercise()
        repeatCircuit.setName(name: "Repeat!")
        repeatCircuit.setReps(reps: 0)
        return repeatCircuit
    }
    
    // MARK: - Spreadsheet Methods
    func csv(data: String) -> [[String]] {
        // Returns an array of the csv file as an array[row][column]
            var result: [[String]] = []
            let rows = data.components(separatedBy: "\n")
            for row in rows {
                let columns = row.components(separatedBy: ";")
                result.append(columns)
            }
            return result
        }
    
    
    func readDataFromCSV(fileName:String, fileType: String)-> String!{
        // Input a csv Filename and Filetype. Returns one large string of the file.
        
        if let file = NSDataAsset(name: fileName)?.data {
            if let text = String(data: file, encoding: .utf8) {
                return text
            }
            else {
                print("readDataFromCSV: Could not return the text")
                return ""
            }
        }
        else {
            print("readDataFromCSV: Could not find the file")
            return ""
        }
    }

    func cleanRows(file:String)->String{
        // Cleans up the CSV string so it can be read by the csv function.
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        // Not sure what these lines do but they came commented out and make no noticeable difference when enabled
//                cleanFile = cleanFile.replacingOccurrences(of: ";;", with: "")
//                cleanFile = cleanFile.replacingOccurrences(of: ";\n", with: "")
        return cleanFile
    }
    
    
}
