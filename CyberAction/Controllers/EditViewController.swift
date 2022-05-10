//
//  EditViewController.swift
//  CyberAction
//
//  Created by Александр Паньшин on 10.05.2022.
//

import UIKit

class EditViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nicknameTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        avatarImageView.image = User.currentUser?.avatar
        if let avatarImage = avatarImageView.image {
            avatarImageView.maskCircle(anyImage: avatarImage)
        }
        nicknameTextField.text = User.currentUser?.nickname
    }
    
    @IBAction func changeAvatarButtonAction(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let imageFromGallery = info[.originalImage] as? UIImage else {
            return
        }
        avatarImageView.image = imageFromGallery
        avatarImageView.image = imageFromGallery
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        if let newNickname = nicknameTextField.text {
            User.currentUser?.nickname = newNickname
        }
        if let newAvatar = avatarImageView.image {
            User.currentUser?.avatar = newAvatar
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func logoutButtonAction(_ sender: UIButton) {
        User.currentUser = nil
        navigationController?.popToRootViewController(animated: true)
    }

}
