//
//  SnapsViewController.swift
//  Snapchat-clone-practice
//
//  Created by Dylan on 2/7/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SnapsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var snaps : [Snap] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        FIRDatabase.database().reference().child("users").child((FIRAuth.auth()!.currentUser?.uid)!).child("snaps").observe(FIRDataEventType.childAdded, with: { (snapshot) in
            print(snapshot)
            
            
          let snap = Snap()
           
            
        snap.imageURL = (snapshot.value! as AnyObject)["imageURL"] as! String
         snap.from = (snapshot.value! as AnyObject)["from"] as! String
    snap.descrip = (snapshot.value! as AnyObject)["description"] as! String
       
            
            
         self.snaps.append(snap)
            
         self.tableView.reloadData()
            
        })
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snaps.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let snap = snaps[indexPath.row]
        
        cell.textLabel?.text = snap.from
        
        return cell
    }

    
    
    
    

    @IBAction func logoutTapped(_ sender: Any) { dismiss(animated: true, completion: nil)
        
    }
    
    
}
