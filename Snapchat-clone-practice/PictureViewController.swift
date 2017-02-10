//
//  PictureViewController.swift
//  Snapchat-clone-practice
//
//  Created by Dylan on 2/8/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
         imagePicker.delegate = self
    
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        
        imageView.backgroundColor = UIColor.clear
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        // change to .camera after testing 
        
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
        nextButton.isEnabled = false
        
        let  imagesFolder =
            FIRStorage.storage().reference().child("images")
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        
        
        
        imagesFolder.child("\(NSUUID().uuidString).jpeg").put(imageData, metadata: nil) { (metadata, error) in
            print("We tried to upload!")
            if error != nil {
                print("We Had an error:\(error)")
            } else {
                
                print(metadata?.downloadURL() as Any)
                
                
                self.performSegue(withIdentifier: "selectUserSegue", sender: nil)
            }
        }}
    
        
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        }

}
