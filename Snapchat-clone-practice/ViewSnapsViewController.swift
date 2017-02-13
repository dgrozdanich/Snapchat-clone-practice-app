//
//  ViewSnapsViewController.swift
//  Snapchat-clone-practice
//
//  Created by Dylan on 2/12/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit

class ViewSnapsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = snap.descrip
        // Do any additional setup after loading the view.
    }

}
