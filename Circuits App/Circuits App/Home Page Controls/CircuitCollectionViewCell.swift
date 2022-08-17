//
//  CircuitCollectionViewCell.swift
//  Circuits App
//
//  Created by CSCI Account on 1/23/21.
//

import UIKit

class CircuitCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var circuitLabel: UILabel!
    
    var circuit:Circuit?
    
    func configureCell(circuit: Circuit) {
        // This is where the properties of each cell can be set before they are displayed (Label text, color, exerciseArray, etc)
        
        // Keep track of the circuit this cell represets
        self.circuit = circuit
        
        // Set the UILabel to display the circuit name
        circuitLabel.text = circuit.name
        circuitLabel.adjustsFontSizeToFitWidth = true
    }


}
