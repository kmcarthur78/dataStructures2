//
//  RadixSortViewController.swift
//  Data Structures II
//
//  Created by Kelsey McArthur on 2/12/19.
//  Copyright © 2019 KMcArthur78. All rights reserved.
//

import UIKit

class RadixSortViewController: UIViewController {

    var list = [20,100,1,32,1212,45,3,65,2]
    
    @IBOutlet weak var unsortedList: UILabel!
    @IBOutlet weak var listResult: UILabel!
    @IBAction func sortButton(_ sender: Any) {
        let sortedList = selectionSort(list)
        listResult.text = "\(sortedList)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        unsortedList.text = "\(list)"
    }
    
    func radixSort1(_ arr: inout [Int]) {
        
        var temp = [[Int]](repeating: [], count: 10)
        
        for num in arr { temp[num % 10].append(num) }
        
        for i in 1...Int(arr.max()!.description.characters.count) {
            
            for index in 0..<temp.count {
                
                for num in temp[index] {
                    temp[index].remove(at: temp[index].index(of: num)!)
                    temp[(num / Int(pow(10, Double(i)))) % 10].append(num)
                }
            }
        }
        
        arr = temp[0]
    }
    
    func selectionSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }  // 1
        
        var a = array                    // 2
        
        for x in 0 ..< a.count - 1 {     // 3
            
            var lowest = x
            for y in x + 1 ..< a.count {   // 4
                if a[y] < a[lowest] {
                    lowest = y
                }
            }
            
            if x != lowest {               // 5
                a.swapAt(x, lowest)
            }
        }
        return a
    }
    

}
