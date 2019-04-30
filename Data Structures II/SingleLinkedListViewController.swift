//
//  SingleLinkedListViewController.swift
//  Data Structures II
//
//  Created by Kelsey McArthur on 3/29/19.
//  Copyright © 2019 KMcArthur78. All rights reserved.
//

import UIKit

class SingleLinkedListViewController: UIViewController {
    
    let farmAnimals = LinkedList<String>()
    var count = 0
    
    @IBOutlet weak var userAppendValue: UITextField!
    @IBAction func buttonAppend(_ sender: Any) {
        let text: String = userAppendValue.text!
        farmAnimals.append(value: text)
        count = count + 1
        print(count)
        viewDidLoad()
    }
    
    @IBAction func buttonDelete(_ sender: Any) {
        farmAnimals.remove(node: farmAnimals.nodeAt(index: 0)!)
        count = count - 1
        viewDidLoad()
    }
    
    @IBOutlet weak var userDeleteValue: UITextField!
    @IBAction func buttonDeleteNthValue(_ sender: Any) {
        let text: String = userDeleteValue.text!
        
    }
    
    
    
    @IBOutlet weak var printList: UILabel!
    
    
    @IBAction func removeAllFromList(_ sender: Any) {
        farmAnimals.removeAll()
        viewDidLoad()
        
    }
    
    @IBOutlet weak var firstNode: UILabel!
    @IBOutlet weak var fourthNode: UILabel!
   
    override func viewDidLoad() {
        if count > 0 {
            firstNode.text = "\(farmAnimals.nodeAt(index: 0)!.value)"
        }
        if count > 3 {
            fourthNode.text = "\(farmAnimals.nodeAt(index: 3)!.value)"
        }

        printList.text = "\(farmAnimals.toString())"
    }
    
    
    
    public class Node<T> {
        var value: T
        var next: Node<T>?
        weak var previous: Node<T>?
        
        init(value: T) {
            self.value = value
        }
    }
    
    
    public class LinkedList<T> {
        fileprivate var head: Node<T>?
        private var tail: Node<T>?
        
        public var isEmpty: Bool {
            return head == nil
        }
        
        public var first: Node<T>? {
            return head
        }
        
        public var last: Node<T>? {
            return tail
        }
        
        
        
        public func append(value: T) {
            let newNode = Node(value: value)
            if let tailNode = tail {
                newNode.previous = tailNode
                tailNode.next = newNode
            } else {
                head = newNode
            }
            tail = newNode
        }
        
        public func nodeAt(index: Int) -> Node<T>? {
            if index >= 0 {
                var node = head
                var i = index
                while node != nil {
                    if i == 0 { return node }
                    i -= 1
                    node = node!.next
                }
            }
            return nil
        }
        
        public func removeAll() {
            head = nil
            tail = nil
        }
        
        public func remove(node: Node<T>) -> T {
            let prev = node.previous
            let next = node.next
            
            if let prev = prev {
                prev.next = next
            } else {
                head = next
            }
            next?.previous = prev
            
            if next == nil {
                tail = prev
            }
            
            node.previous = nil
            node.next = nil
            
            return node.value
        }
        
        public func toString() -> String {
            var text = "["
            var node = head
            
            while node != nil {
                text += "\(node!.value)"
                node = node!.next
                if node != nil { text += ", " }
            }
            return text + "]"
        }
        
        
        
    }
}
