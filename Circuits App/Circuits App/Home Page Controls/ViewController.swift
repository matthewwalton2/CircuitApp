//
//  ViewController.swift
//  Circuits App
//
//  Created by CSCI Account on 1/23/21.
//

import UIKit
import CoreMedia

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Connect the collection view to be able to manipulate it through code
    @IBOutlet weak var collectionView: UICollectionView!
    
    let model = CircuitModel()
    var circuitsArray = [Circuit]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set the view controller as the data source and delegate of the collection view
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Load the circuits into an array to be used as the data source
        circuitsArray = model.getCircuits()
    }

    // MARK: - Collection View Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Collection view asking the view controller "how many items should I display?"
        // Return the number of circuits
        return circuitsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // the collection view asking the data source (collection view) for each cell, what to display
        // Here is where you configure each cell and return it
        
        // Get a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CircuitCell", for: indexPath) as! CircuitCollectionViewCell
        
        // Configure the cell, passing in the same circuit as the cell (from above) is keeping track of
        cell.configureCell(circuit: circuitsArray[indexPath.row])
        
        // Return the cell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // This method is called whenever the user taps on a circuit cell
        // Create a new view controller to move to
        let circuitViewController = storyboard?.instantiateViewController(identifier: "CircuitViewController") as? CircuitViewController
        // Pass the data to the new controller. Properties of the new controller can be accessed here
        circuitViewController?.circuit = circuitsArray[indexPath.row]
        
        // Push the new view controller to the navigation controller
        self.navigationController?.pushViewController(circuitViewController!, animated: true)
        
        // Change the title of the Navigation Controller to be the name of the selected circuit
        let selectedCircuitName = circuitsArray[indexPath.row].name
        self.navigationController?.topViewController?.title = selectedCircuitName
        
        // TODO: Delete this bit - FOR TESTING: Print the name of the circuit the user has selected
        let selectedCell = circuitsArray[indexPath.row]
        let selectedCircuit = selectedCell.name
        print(selectedCircuit)
    }
    
    // Mark: - Collection View Sizing Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Sets the size of each cell so that three cells are always displayed in each row
        let test = CGSize.init(width: collectionView.visibleSize.width/3 - 10, height: collectionView.visibleSize.width/3 - 10)
        return test
    }
}

