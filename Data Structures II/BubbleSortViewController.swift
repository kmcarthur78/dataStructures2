//
//  BubbleSortViewController.swift
//  Data Structures II
//
//  Created by Kelsey McArthur on 2/9/19.
//  Copyright © 2019 KMcArthur78. All rights reserved.
//

import UIKit

class BubbleSortViewController: UIViewController {

    var list = [2,6,3,10,55,1,20]
    
    @IBOutlet weak var unsortedList: UILabel!
    @IBOutlet weak var listResult: UILabel!
    
    @IBAction func sortButton(_ sender: Any) {
        let sortedList = bubbleSort(arr: &list)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
