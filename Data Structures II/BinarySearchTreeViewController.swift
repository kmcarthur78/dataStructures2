//
//  BinarySearchTreeViewController.swift
//  Data Structures II
//
//  Created by Kelsey McArthur on 4/16/19.
//  Copyright © 2019 KMcArthur78. All rights reserved.
//

import UIKit

class BinarySearchTreeViewController: UIViewController {

    @IBOutlet weak var node: UITextField!
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var node1: UITextField!
    @IBOutlet weak var result1: UILabel!
    @IBAction func enterNode1(_ sender: Any) {
        if node1.text == "900" {
            result1.text = "Correct"
        }
        else {
            result1.text = "Wrong"
        }
    }
    
    
    @IBAction func enterNode(_ sender: Any) {
        if node.text == "100" {
            result.text = "Correct"
        }
        else {
            result.text = "Wrong"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    

}
