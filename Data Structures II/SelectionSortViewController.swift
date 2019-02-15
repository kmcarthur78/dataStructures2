//
//  SelectionSortViewController.swift
//  Data Structures II
//
//  Created by Kelsey McArthur on 2/9/19.
//  Copyright © 2019 KMcArthur78. All rights reserved.
//

import UIKit

class SelectionSortViewController: UIViewController {

    let list = [2,6,3,10,55,1,20]
    
    @IBOutlet weak var unsortedButton: UILabel!
    @IBOutlet weak var listResult: UILabel!
    
    @IBAction func sortButton(_ sender: Any) {
        let sortedList = selectionSort(list)
        listResult.text = "\(sortedList)"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        unsortedButton.text = "\(list)"
        //GIF
        let gifURL : String = "https://i.imgur.com/OxisN67.gif"
        let imageURL = UIImage.gifImageWithURL(gifURL)
        let imageView3 = UIImageView(image: imageURL)
        imageView3.frame = CGRect(x: 20.0, y: 390.0, width: self.view.frame.size.width - 40, height: 150.0)
        view.addSubview(imageView3)
//        GIFImageView = imageView3
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
