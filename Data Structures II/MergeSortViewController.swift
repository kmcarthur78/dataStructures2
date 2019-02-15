//
//  MergeSortViewController.swift
//  Data Structures II
//
//  Created by Kelsey McArthur on 2/9/19.
//  Copyright © 2019 KMcArthur78. All rights reserved.
//

import UIKit

class MergeSortViewController: UIViewController {

    var list = [2,6,3,10,55,1,20]
    
    @IBOutlet weak var unsortedList: UILabel!
    @IBOutlet weak var listResult: UILabel!
    @IBAction func sortButton(_ sender: Any) {
        let sortedList = mergeSort(list)
        listResult.text = "\(sortedList)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       unsortedList.text = "\(list)"
        
        //GIF
        let gifURL : String = "https://i.imgur.com/usHoaOz.gif"
        let imageURL = UIImage.gifImageWithURL(gifURL)
        let imageView3 = UIImageView(image: imageURL)
        imageView3.frame = CGRect(x: 20.0, y: 390.0, width: self.view.frame.size.width - 40, height: 150.0)
        view.addSubview(imageView3)
        //        GIFImageView = imageView3
    }
    
    func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }    // 1
        
        let middleIndex = array.count / 2              // 2
        
        let leftArray = mergeSort(Array(array[0..<middleIndex]))             // 3
        
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))  // 4
        
        return merge(leftPile: leftArray, rightPile: rightArray)             // 5
    }
    
    func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
        // 1
        var leftIndex = 0
        var rightIndex = 0
        
        // 2
        var orderedPile = [Int]()
        orderedPile.reserveCapacity(leftPile.count + rightPile.count)
        
        // 3
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            } else {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            }
        }
        
        // 4
        while leftIndex < leftPile.count {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
        return orderedPile
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
