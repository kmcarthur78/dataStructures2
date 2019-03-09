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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        
//        hashTable["firstName"] = "Steve"   // insert
//        let x = hashTable["firstName"]
        print(hashTable.count)
    }
    

    public struct HashTable<Key: Hashable, Value> {
        private typealias Element = (key: Key, value: Value)
        private typealias Bucket = [Element]
        private var buckets: [Bucket]
        
        private(set) public var count = 0
        
        public var isEmpty: Bool { return count == 0 }
        
        public init(capacity: Int) {
            assert(capacity > 0)
            buckets = Array<Bucket>(repeatElement([], count: capacity))
        }
    }
    
    
//    private func index(forKey key: Key) -> Int {
//        return abs(key.hashValue) % buckets.count
//    }
//    
    
}
