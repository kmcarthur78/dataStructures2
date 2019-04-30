//
//  QueueViewController.swift
//  Data Structures II
//
//  Created by Kelsey McArthur on 3/9/19.
//  Copyright © 2019 KMcArthur78. All rights reserved.
//

import UIKit
import Foundation


class QueueViewController: UIViewController {

    @IBOutlet weak var printList: UILabel!
    @IBOutlet weak var printCount: UILabel!
    
    var count = 0
    
    @IBOutlet weak var textEnq: UITextField!
    @IBAction func addEnqueue(_ sender: Any) {
        let text: String = textEnq.text!
        let stext = Int(text)
        
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
        if stext != 0  && text.rangeOfCharacter(from: numberCharacters) == nil {
            queue.enqueue(stext!)
            count = count + 1
        } else {
            Error.self
        }
        
        
        viewDidLoad()
    }
    
    @IBAction func dequeueElement(_ sender: Any) {
        queue.dequeue()
        viewDidLoad()
    }
    
    @IBOutlet weak var firstElement: UILabel!
    
    var queue = Queue<Int>()
    var queue2 = Queue<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(queue.toString())
//        print(queue.front)
        
        queue2.enqueue("mad")
        queue2.enqueue("lad")
        if let first = queue2.dequeue() {
            print(first)
        }
        
        printList.text = "\(queue.toString())"
        printCount.text = "\(queue.count)"
        
        if count > 0 {
            firstElement.text = "\(queue.front)"
        }
        
        
    }
    
    public struct Queue<T> {
        
        fileprivate var array = [T]()
        
        public var isEmpty: Bool {
            return array.isEmpty
        }
        
        public var count: Int {
            return array.count
        }
        
        public mutating func enqueue(_ element: T) {
            array.append(element)
        }
        
        public mutating func dequeue() -> T? {
            if isEmpty {
                return nil
            } else {
                return array.removeFirst()
            }
        }
        
        public var front: T? {
            return array.first
        }
        
        public func toString() -> String {
            return array.description
        }
        
        public mutating func removeAll(){
            return array.removeAll()
        }
    }
}


