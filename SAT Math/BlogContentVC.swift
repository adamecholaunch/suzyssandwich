//
//  BlogContentVC.swift
//  SAT Math
//
//  Created by Adam Buys on 7/9/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit

class BlogContentVC: UIViewController {
    
    var pageIndex = -1000 // for now
    var image : UIImage?

    @IBOutlet weak var blogImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if blogImage != nil {
        
            self.blogImage.contentMode = .scaleToFill
            
            if image != nil {
                self.blogImage.image = image
            }
        }
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
