//
//  BubbleSortViewController.swift
//  Data Structures II
//
//  Created by Kelsey McArthur on 2/9/19.
//  Copyright © 2019 KMcArthur78. All rights reserved.
//

import UIKit

class BubbleSortViewController: UIViewController {

    var list = [2,26,3,10,55,1,20]
    
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
        //GIF
        let gifURL : String = "https://i.imgur.com/REYuUIW.gif"
        let imageURL = UIImage.gifImageWithURL(gifURL)
        let imageView3 = UIImageView(image: imageURL)
        imageView3.frame = CGRect(x: 20.0, y: 390.0, width: self.view.frame.size.width - 40, height: 150.0)
        view.addSubview(imageView3)
        //        GIFImageView = imageView3
    }
    
    func bubbleSort(arr: inout [Int]) {
        for i in (1..<arr.count).reversed() {
            for j in 0..<i where arr[j] > arr[j + 1] {
                arr.swapAt(j, j + 1)
            }
        }
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
