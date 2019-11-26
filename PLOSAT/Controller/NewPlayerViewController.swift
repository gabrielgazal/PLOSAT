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
//    func filtroSepia(inputImage: UIImage) -> UIImage{
//        let context = CIContext(options: nil)
//
//        if let currentFilter = CIFilter(name: "CISepiaTone") {
//            let beginImage = CIImage(image: inputImage)
//            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
//            currentFilter.setValue(0.8, forKey: kCIInputIntensityKey)
//
//            if let output = currentFilter.outputImage {
//                if let cgimg = context.createCGImage(output, from: output.extent) {
//                    let processedImage = UIImage(cgImage: cgimg)
////                    AddPhotoButtobn.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
//                    return processedImage
//                    // do something interesting with the processed image
//                }
//            }
//        }
//        return inputImage
//    }
    
    func sepiaFilter(_ input: UIImage, intensity: Double) -> UIImage?
    {
        let image = CIImage(image: input)
        let sepiaFilter = CIFilter(name:"CISepiaTone")
        sepiaFilter?.setValue(image, forKey: kCIInputImageKey)
        sepiaFilter?.setValue(intensity, forKey: kCIInputIntensityKey)
        
        return UIImage(ciImage: sepiaFilter!.outputImage!)
        
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
