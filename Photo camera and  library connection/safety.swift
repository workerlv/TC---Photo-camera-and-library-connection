//
//  safety.swift
//  Photo camera and  library connection
//
//  Created by Arturs Vitins on 24/04/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//

import UIKit
//
//extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//    
//    func addNewParticipan () {
//        
//        //SVProgressHUD.dismiss()
//        
//        let imgPicker = UIImagePickerController()
//        imgPicker.delegate = self
//        
//        if switchOutlet.isOn {
//            
//            if UIImagePickerController.isSourceTypeAvailable(.camera) {
//                
//                imgPicker.sourceType = .camera
//                
//            } else {
//                
//                let alert = UIAlertController(title: "Camera is not working", message: "Try to reopen application", preferredStyle: .alert)
//                let action = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
//                    self.dismiss(animated: true, completion: nil)
//                })
//                alert.addAction(action)
//                present(alert, animated: true, completion: nil)
//            }
//            
//        } else {
//            
//            imgPicker.sourceType = .photoLibrary
//        }
//        
//        imgPicker.allowsEditing = false
//        self.present(imgPicker, animated: true, completion: nil)
//    }
//    
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        
//        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            
//            let tempImg = self.resizeImage(image: image, targetSize: CGSize(width: 800.0, height: 600.0))
//            
//            testImgOutlet.image = tempImg
//        }
//        
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
//        
//        let size = image.size
//        let widthRatio  = targetSize.width  / image.size.width
//        let heightRatio = targetSize.height / image.size.height
//        
//        // Figure out what our orientation is, and use that to form the rectangle
//        var newSize: CGSize
//        if(widthRatio > heightRatio) {
//            
//            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
//        } else {
//            
//            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
//        }
//        
//        // This is the rect that we've calculated out and this is what is actually used below
//        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
//        // Actually do the resizing to the rect using the ImageContext stuff
//        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
//        image.draw(in: rect)
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        return newImage!
//    }
//    
//    
//}

