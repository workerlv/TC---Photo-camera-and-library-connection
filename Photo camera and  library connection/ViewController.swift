//
//  ViewController.swift
//  Photo camera and  library connection
//
//  Created by Arturs Vitins on 24/04/2018.
//  Copyright © 2018 Arturs Vitins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var necessaryResizing = false
    var newWidth = CGFloat()
    var newHeigth = CGFloat()
    
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var mainImgOutlet: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func goBtnAction(_ sender: UIButton) {
        
        if switchOutlet.isOn {
            
            takePictureWithCameraOrFromPhotoLibrary(photoLibraryOrCamera: .camera, ifResizingImgAddWidthHeight: (20, 20))
            
        } else {
            
            takePictureWithCameraOrFromPhotoLibrary(photoLibraryOrCamera: .camera)

        }
    }
    

}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    /// Calls photo library on camera
    /// - parameter photoLibraryOrCamera: Choose camera with .camera or choose photo library with .photoLibrary
    /// - parameter ifResizingImgAddWidthHeight: Optional value - if not needed than can be deleted
    func takePictureWithCameraOrFromPhotoLibrary (photoLibraryOrCamera: UIImagePickerControllerSourceType, ifResizingImgAddWidthHeight newDimensions: (CGFloat?, CGFloat?)=(nil, nil)) {

        if let newDim = newDimensions as? (CGFloat, CGFloat) {
            
            necessaryResizing = true
            newWidth = newDim.0
            newHeigth = newDim.1
            print("newDimensions workered = \(newDim)")
            
        }

        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(photoLibraryOrCamera) {
            
            imgPicker.sourceType = photoLibraryOrCamera
            
        } else {
            
            let alert = UIAlertController(title: "Something is not working", message: "Try to reopen application", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    
        imgPicker.allowsEditing = false
        self.present(imgPicker, animated: true, completion: nil)
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            if necessaryResizing == true {
                
                let resizedImg = self.resizeImage(image: image, targetSize: CGSize(width: newWidth, height: newHeigth))
                
                
                mainImgOutlet.image = resizedImg
                
            } else {
                
                mainImgOutlet.image = image
                
            }
            
            
        }
        
        necessaryResizing = false
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        
        let size = image.size
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
}
