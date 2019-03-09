//
//  LinkedListViewController.swift
//  Data Structures II
//
//  Created by Kelsey McArthur on 3/6/19.
//  Copyright © 2019 KMcArthur78. All rights reserved.
//

import UIKit

class LinkedListViewController: UIViewController {

    @IBOutlet weak var printList: UILabel!
    @IBAction func removeFromList(_ sender: Any) {
        dogBreeds.removeAll()
        dogBreeds.append(value: "French Bulldog")
        viewDidLoad()
    }
    @IBOutlet weak var IsEmpty: UILabel!
    
    @IBOutlet weak var firstNodePrint: UILabel!
    
    @IBAction func removeAllFromList(_ sender: Any) {
        dogBreeds.removeAll()
        viewDidLoad()
    }
    
    
    let dogBreeds = LinkedList<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogBreeds.append(value: "Labrador")
        dogBreeds.append(value: "Pug")
        dogBreeds.append(value: "Beagle")
        dogBreeds.append(value: "Husky")
        

        print(dogBreeds.toString())
        
        printList.text = "\(dogBreeds.toString())"
        IsEmpty.text = "\(dogBreeds.isEmpty)"
        firstNodePrint.text = "\(dogBreeds.nodeAt(index: 0))"
        
     
//        // Do any additional setup after loading the view.
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


