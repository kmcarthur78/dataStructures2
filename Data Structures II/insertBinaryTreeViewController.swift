//
//  insertBinaryTreeViewController.swift
//  Data Structures II
//
//  Created by Kelsey McArthur on 4/22/19.
//  Copyright © 2019 KMcArthur78. All rights reserved.
//

import UIKit

class insertBinaryTreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var LR1: UITextField!
    @IBOutlet weak var node1: UITextField!
    @IBOutlet weak var answer1: UILabel!
    @IBAction func enter1(_ sender: Any) {
        if ((LR1.text == "Right") || (LR1.text == "right") && node1.text == "100"){
            answer1.text = "Correct"
        } else {
            answer1.text = "Wrong"
        }
    }
    
    @IBOutlet weak var LR2: UITextField!
    @IBOutlet weak var node2: UITextField!
    @IBOutlet weak var answer2: UILabel!
    @IBAction func enter2(_ sender: Any) {
        if ((LR2.text == "Right") || (LR2.text == "right") && node2.text == "145"){
            answer2.text = "Correct"
        } else {
            answer2.text = "Wrong"
        }
    }
    
    @IBOutlet weak var LR3: UITextField!
    @IBOutlet weak var node3: UITextField!
    @IBOutlet weak var answer3: UILabel!
    @IBAction func enter3(_ sender: Any) {
        if ((LR3.text == "Right") || (LR3.text == "right") && node3.text == "925"){
            answer3.text = "Correct"
        } else {
            answer3.text = "Wrong"
        }
    }
    
    @IBOutlet weak var LR4: UITextField!
    @IBOutlet weak var node4: UITextField!
    @IBOutlet weak var answer4: UILabel!
    @IBAction func enter4(_ sender: Any) {
        if ((LR4.text == "Left") || (LR4.text == "left") && node4.text == "925"){
            answer4.text = "Correct"
        } else {
            answer4.text = "Wrong"
        }
    }
    
    @IBOutlet weak var LR5: UITextField!
    @IBOutlet weak var node5: UITextField!
    @IBOutlet weak var answer5: UILabel!
    @IBAction func enter5(_ sender: Any) {
        if ((LR5.text == "Right") || (LR5.text == "right") && node5.text == "750"){
            answer5.text = "Correct"
        } else {
            answer5.text = "Wrong"
        }
    }
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
