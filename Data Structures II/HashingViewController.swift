//
//  HashingViewController.swift
//  Data Structures II
//
//  Created by Kelsey McArthur on 3/7/19.
//  Copyright © 2019 KMcArthur78. All rights reserved.
//

import UIKit

class HashingViewController: UIViewController {

    var hashTable = HashTable<String, String>(capacity: 5)
    
    @IBOutlet weak var addText: UITextField!
    @IBAction func addFirstName(_ sender: Any) {
        let text: String = addText.text!
        hashTable["firstName"] = text
        viewDidLoad()
    }
    
    @IBOutlet weak var pFirstName: UILabel!
    
    @IBOutlet weak var addFirstName: UITextField!
    @IBOutlet weak var DIR: UILabel!
    
    @IBAction func buttonFirstName(_ sender: Any) {
        let text: String = addFirstName.text!
        hashTable["firstName"] = text
        viewDidLoad()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hashTable["firstName"] = "Steve"   // insert
        let x = hashTable["firstName"]     // lookup
        hashTable["lastName"] = "Tim"     // update
//        hashTable["firstName"] = nil       // delete
        hashTable["hobbies"] = "Programming Swift"
        
        hashTable["firstName"] = "Timmy"
        
      print(x)
        
        
    }
    

    public struct HashTable<Key: Hashable, Value> {
        private typealias Element = (key: Key, value: Value)
        private typealias Bucket = [Element]
        private var buckets: [Bucket]
        
        public var count = 0
        
        public var isEmpty: Bool { return count == 0 }
        
        public init(capacity: Int) {
            assert(capacity > 0)
            buckets = Array<Bucket>(repeatElement([], count: capacity))
        }
        
        private func index(forKey key: Key) -> Int {
            return abs(key.hashValue) % buckets.count
        }
        
        public subscript(key: Key) -> Value? {
            get {
                return value(forKey: key)
            }
            set {
                if let value = newValue {
                    updateValue(value, forKey: key)
                } else {
                    removeValue(forKey: key)
                }
            }
        }
        
        public func value(forKey key: Key) -> Value? {
            let index = self.index(forKey: key)
            for element in buckets[index] {
                if element.key == key {
                    return element.value
                }
            }
            return nil  // key not in hash table
        }
        
        public mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
            let index = self.index(forKey: key)
            
            // Do we already have this key in the bucket?
            for (i, element) in buckets[index].enumerated() {
                if element.key == key {
                    let oldValue = element.value
                    buckets[index][i].value = value
                    return oldValue
                }
            }
            
            // This key isn't in the bucket yet; add it to the chain.
            buckets[index].append((key: key, value: value))
            count += 1
            return nil
        }
        
        public mutating func removeValue(forKey key: Key) -> Value? {
            let index = self.index(forKey: key)
            
            // Find the element in the bucket's chain and remove it.
            for (i, element) in buckets[index].enumerated() {
                if element.key == key {
                    buckets[index].remove(at: i)
                    count -= 1
                    return element.value
                }
            }
            return nil  // key not in hash table
        }
        
        
    }
    
    
//    private func index(forKey key: Key) -> Int {
//        return abs(key.hashValue) % buckets.count
//    }
//    
    
}
