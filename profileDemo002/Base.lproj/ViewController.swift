//
//  ViewController.swift
//  profileDemo002
//
//  Created by José Cadena on 10/01/21.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    @IBOutlet weak var imageProfile: CircularImageView!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    imageProfile.image = UIImage (named: "imageProfile" )
    }
    @IBAction func buttonRec(_ sender: UITapGestureRecognizer) {
    let alertController = UIAlertController(title: "Selecciona ", message: "Desde:", preferredStyle: .alert)
            // Create the actions
        let camaraAction = UIAlertAction(title: "Camara", style: UIAlertAction.Style.default){ [self]
            UIAlertAction in
            takePhoto("Toma una foto")
        }
        let galleryAction = UIAlertAction(title: "Galeria", style: UIAlertAction.Style.default){ [self]
            UIAlertAction in loadImageButtonTapped("Selecciona una foto")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
                UIAlertAction in
                NSLog("Cancelado")
            }
 
            // Add the actions
        alertController.addAction(camaraAction)
        alertController.addAction(galleryAction)
        alertController.addAction(cancelAction)

            // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    func takePhoto(_ sender: Any){
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                imagePicker.dismiss(animated: true, completion: nil)
            imageProfile.image = info[.originalImage] as? UIImage
            }
    func loadImageButtonTapped(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
            
        present(imagePicker, animated: true, completion: nil)
    }
}
 @IBDesignable
class CircularImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
}




