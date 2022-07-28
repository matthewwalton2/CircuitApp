//
//  Exercise.swift
//  CircuitsApp
//
//  Created by CSCI Account on 1/20/21.
//

import Foundation

// Creates a class of which each exercise will be an instance
// Each exercise has a name and possible duration, reps, and visual, as well as getters and setters for each

class Exercise {
    
    var name = ""
    var duration:Int?
    var reps:Int?
    var title:String?
    var description:String?
    
    func setName(name:String) {
        // Set the name of the exercise
        self.name = name
    }
    func getName() -> String {
        // Return the name of the exercise
        return self.name
    }
    
    func setTitle(title:String) {
        // Set the title (On toes, on side, etc) of the exercise
        self.title = title
    }
    func getTitle() -> String? {
        // Return the WRAPPED title of the exercise
        return self.title
    }


    func setDuration(time:Int) {
        // Set the duration of the exercise
        self.duration = time
    }
    func getDuration() -> Int? {
        // Return the WRAPPED timer of the exercise
        return self.duration
    }


    func setReps(reps:Int) {
        // Set the reps of the exercise
        self.reps = reps
    }
    func getReps() -> Int? {
        // Return the WRAPPED reps of the exercise
        return self.reps
    }
    
    func setDescription(description:String) {
        // Set the description of the exercise
        self.description = description
    }
    func getDescription() -> String? {
        // Return the WRAPPED description of the exercise
        return self.description
    }
}

