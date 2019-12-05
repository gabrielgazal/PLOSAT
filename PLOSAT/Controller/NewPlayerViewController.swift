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

class NewPlayerViewController: UIViewController, UIImagePickerControllerDelegate,  UINavigationControllerDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var dashedBorder: UIView!
    @IBOutlet weak var seloImage: UIImageView!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var nameFiekd: UITextField!
    @IBOutlet weak var saveButton: DesignableButton!
    @IBOutlet weak var AddPhotoButtobn: UIButton!
    
    var fotodojos : UIImage!
    
    @IBAction func DismissModal(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .button)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addPhoto(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .button)
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
        
        if fotodojos != nil {
            if nameFiekd.text!.isEmpty{
                Model.instance.game.newPlayer(name: "Jogador \(Model.instance.game.players.count + 1)", foto: fotodojos)
                Model.instance.enoughPlayers += 1
                
                NotificationCenter.default.post(name: NSNotification.Name("atualizaJogadores"), object: nil)
                dismiss(animated: true, completion: nil)
            }else{
                Model.instance.game.newPlayer(name: nameFiekd.text!, foto: fotodojos)
                Model.instance.enoughPlayers += 1
                
                NotificationCenter.default.post(name: NSNotification.Name("atualizaJogadores"), object: nil)
                dismiss(animated: true, completion: nil)
            }
        }else{
            if nameFiekd.text!.isEmpty{
                Model.instance.game.newPlayer(name: "Jogador \(Model.instance.game.players.count + 1)", foto: UIImage(named: "player")!)
                Model.instance.enoughPlayers += 1
                NotificationCenter.default.post(name: NSNotification.Name("atualizaJogadores"), object: nil)
                dismiss(animated: true, completion: nil)
            }else{
                Model.instance.game.newPlayer(name: nameFiekd.text!, foto: UIImage(named: "player")!)
                Model.instance.enoughPlayers += 1
                
                NotificationCenter.default.post(name: NSNotification.Name("atualizaJogadores"), object: nil)
                dismiss(animated: true, completion: nil)
            }
            
        }
        AudioManager.shared.play(soundEffect: .button)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.nameFiekd.delegate = self
        seloImage.transform = CGAffineTransform(rotationAngle: -(.pi * 2)/45)
        AddPhotoButtobn.transform = CGAffineTransform(rotationAngle: -(.pi * 2)/45)
        let buttonColor = #colorLiteral(red: 0.9019607843, green: 0.8352941176, blue: 0.7882352941, alpha: 1)
        nameFiekd.attributedPlaceholder = NSAttributedString(string: "NOME DO JOGADOR",attributes:[NSAttributedString.Key.foregroundColor: buttonColor])
        nameFiekd.backgroundColor = .clear
        addDashedBorder(forma: nameFiekd)
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    func addDashedBorder(forma: UITextField) {
        
        let color = UIColor.init(cgColor: #colorLiteral(red: 0.2509803922, green: 0.2, blue: 0.3058823529, alpha: 1))
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = forma.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [5,5]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 6).cgPath
        
        forma.layer.addSublayer(shapeLayer)
    }
    
    
}
