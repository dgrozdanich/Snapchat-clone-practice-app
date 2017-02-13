//
//  ViewSnapsViewController.swift
//  Snapchat-clone-practice
//
//  Created by Dylan on 2/12/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit
import SDWebImage

class ViewSnapsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = snap.descrip
        
        imageView.sd_setImage(with: URL(string: snap.imageURL))
        // Do any additional setup after loading the view.
    }

}
