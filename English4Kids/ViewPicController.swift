//
//  ViewPicController.swift
//  English4Kids
//
//  Created by iOS Student on 10/4/16.
//  Copyright © 2016 Duong. All rights reserved.
//

import UIKit

class ViewPicController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    var pic: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = pic
        
//        if let pic1 = pic {
//            if let pic2 = imgView {
//                pic2.image = pic1
//            }
//        }

        
    }

}
