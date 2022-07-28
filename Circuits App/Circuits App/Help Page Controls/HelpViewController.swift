//
//  HelpViewController.swift
//  Circuits App
//
//  Created by CSCI Account on 2/4/21.
//

import UIKit

class HelpViewController: UIViewController {

    // Create outlets for the labels that change text
    @IBOutlet weak var exerciseLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    
    // This is the exercise that will be passed from the segue that will be used to set all text.
    var exercise:Exercise?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Load the text
        exerciseLabel.text = exercise!.getName()
        descriptionLabel.text = exercise!.getDescription()
    }
    
    @IBAction func closeButton(_ sender: Any) {
        // When the close button is pressed, return to the circuit page view controller
        dismiss(animated: true)
    }
    
}
