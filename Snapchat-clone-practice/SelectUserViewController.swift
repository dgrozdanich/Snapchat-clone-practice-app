//
//  SelectUserViewController.swift
//  Snapchat-clone-practice
//
//  Created by Dylan on 2/10/17.
//  Copyright © 2017 Dylan. All rights reserved.
//


import UIKit
import Firebase
import FirebaseDatabase

class SelectUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users : [User] = []
    
    var imageURL = ""
    var descrip = ""
    var uuid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded, with: { (snapshot) in
            print(snapshot)
            
    
            let user = User()
            
            user.email = (snapshot.value! as AnyObject)["email"] as! String
            user.uid = snapshot.key
            
            self.users.append(user)
            
            self.tableView.reloadData()
        
        })
        
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return users.count
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            
            let user = users[indexPath.row]
            
            cell.textLabel?.text = user.email
            
            return cell
        }
       
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let user = users[indexPath.row]
            
            let snap = ["from":user.email, "description": descrip, "imageURL": imageURL, "uuid":uuid]
            
            
            FIRDatabase.database().reference().child("users").child(user.uid).child("snaps").childByAutoId().setValue(snap)
            
            navigationController!.popToRootViewController(animated: true)
            
        }
    
}
