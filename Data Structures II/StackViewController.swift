//
//  StackViewController.swift
//  Data Structures II
//
//  Created by Kelsey McArthur on 3/9/19.
//  Copyright © 2019 KMcArthur78. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    @IBOutlet weak var printList: UILabel!
    @IBOutlet weak var peekList: UILabel!
    @IBOutlet weak var poppedElement: UILabel!
    
    @IBOutlet weak var pushTextbox: UITextField!
    
    var count = 0
    
    @IBAction func pushElement(_ sender: Any) {
        let text: String = pushTextbox.text!
        horseBreedStack.push(text)
        count = count + 1
        self.viewDidLoad()
    }
    
    @IBAction func popElement(_ sender: Any) {
    
        horseBreedStack.pop()
        count = count - 1
        self.viewDidLoad()
    }
    
    
    var horseBreedStack = Stack<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        print(horseBreedStack.toString())
//        print(horseBreedStack.pop() as Any)
        
        printList.text = "\(horseBreedStack.toString())"
        
        if count > 0 {
            peekList.text = "\(horseBreedStack.peek() as Any)"
        }
        
    }
    

    
    struct Stack<Element> {
        fileprivate var array: [Element] = []
        
        mutating func push(_ element: Element) {
            array.append(element)
        }
        
        mutating func pop() -> Element? {
            return array.popLast()
        }
        
        func peek() -> Element? {
            return array.last
        }
        
        mutating func removeAll() {
            return array.removeAll()
        }
        
        public func toString() -> String {
            let topDivider = "---Stack---\n"
            let bottomDivider = "\n-----------\n"
            
            let stackElements = array.map { "\($0)" }.reversed().joined(separator: "\n")
            return topDivider + stackElements + bottomDivider
        }
    }
}
