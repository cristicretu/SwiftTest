//
//  ViewController.swift
//  Fiftygram
//
//  Created by Cristi Cretu on 25.05.2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    let context = CIContext()
    var original: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func choosePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            navigationController?.present(picker, animated: true, completion: nil)
        }
    }

    @IBAction func applySepia() {
            if original == nil {
                return
            }

            let filter = CIFilter(name: "CISepiaTone")
            filter?.setValue(CIImage(image: original), forKey: kCIInputImageKey)
            filter?.setValue(1.0, forKey: kCIInputIntensityKey)
            display(filter: filter!)
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        navigationController?.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            original = image
        }
    }
    
    func display(filter: CIFilter) {
            let output = filter.outputImage!
            imageView.image = UIImage(cgImage: self.context.createCGImage(output, from: output.extent)!)
        }
}

