//
//  ViewController.swift
//  CameraPicker
//
//  Created by Brian on 9/18/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Vars
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    @IBAction func pick(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            picker.sourceType = .Camera
        } else {
            picker.sourceType = .PhotoLibrary
            picker.modalPresentationStyle = .FullScreen
        }
        presentViewController(picker, animated: true, completion: nil)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] {
            imageView.image = image as? UIImage
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
