//
//  NewPlayerViewController.swift
//  PLOSAT
//
//  Created by Gabriel Gazal on 26/11/19.
//  Copyright © 2019 OGrupoMaisBonitoDaCidade. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class NewPlayerViewController: UIViewController, UIImagePickerControllerDelegate,  UINavigationControllerDelegate {

    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var nameFiekd: UITextField!
    @IBOutlet weak var saveButton: DesignableButton!
    @IBOutlet weak var AddPhotoButtobn: UIButton!
    
    var fotodojos : UIImage!
    
    @IBAction func DismissModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addPhoto(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        fotodojos = sepiaFilter(image, intensity: 0.8)
        
        
        
        AddPhotoButtobn.setImage(fotodojos, for: .normal)
        AddPhotoButtobn.imageView?.contentMode = .scaleAspectFill
        dismiss(animated:true, completion: nil)
        
    }

//                    AddPhotoButtobn.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))

    
    func sepiaFilter(_ input: UIImage, intensity: Double) -> UIImage?
    {
//        let rotation = CIImage(image: input)?.imageByApplyingOrientation(imageOrientationToTiffOrientation(value: input.imageOrientation))

        let image = CIImage(image: input)?.oriented(forExifOrientation: imageOrientationToTiffOrientation(value: input.imageOrientation))
//        let transform = CGAffineTransform(rotationAngle: .pi/2)
//        image?.transformed(by: transform)
        let sepiaFilter = CIFilter(name:"CISepiaTone")
        sepiaFilter?.setValue(image, forKey: kCIInputImageKey)
        sepiaFilter?.setValue(intensity, forKey: kCIInputIntensityKey)
        

                
        return UIImage(ciImage: sepiaFilter!.outputImage!)

    }
    func imageOrientationToTiffOrientation(value: UIImage.Orientation) -> Int32
    {
        switch (value)
        {
        case UIImageOrientation.up:
            return 1
        case UIImageOrientation.down:
            return 3
        case UIImageOrientation.left:
            return 8
        case UIImageOrientation.right:
            return 6
        case UIImageOrientation.upMirrored:
            return 2
        case UIImageOrientation.downMirrored:
            return 4
        case UIImageOrientation.leftMirrored:
            return 5
        case UIImageOrientation.rightMirrored:
            return 7
        }
    }

  
    
    @IBAction func SavePlayer(_ sender: Any) {
        Model.instance.game.newPlayer(name: nameFiekd.text!, foto: fotodojos)
//        print(Model.instance.game.players.count)
        NotificationCenter.default.post(name: NSNotification.Name("atualizaJogadores"), object: nil)
        dismiss(animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    

}
