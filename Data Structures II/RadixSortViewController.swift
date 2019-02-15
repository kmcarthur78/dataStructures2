//
//  RadixSortViewController.swift
//  Data Structures II
//
//  Created by Kelsey McArthur on 2/12/19.
//  Copyright © 2019 KMcArthur78. All rights reserved.
//

import UIKit

class RadixSortViewController: UIViewController {

    var arr = [2,6,3,10,55,1,20]
    
    @IBOutlet weak var unsortedList: UILabel!
    @IBOutlet weak var listResult: UILabel!
    @IBAction func sortButton(_ sender: Any) {
        let sortedList = radixSort1(&arr)
        listResult.text = "\(sortedList)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        unsortedList.text = "\(arr)"
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
