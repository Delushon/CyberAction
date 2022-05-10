//
//  AccountViewController.swift
//  CyberAction
//
//  Created by Александр Паньшин on 10.05.2022.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var pointsButton: UIButton!
    @IBOutlet weak var bookingsButton: UIButton!
    @IBOutlet weak var eventsButton: UIButton!
    @IBOutlet weak var authButton: UIButton!
    @IBOutlet /*weak */var qrCodeButton: UIBarButtonItem!
    @IBOutlet /*weak */var editButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkIsAuth()
        updateUserInfo()
        
    }
    
    func checkIsAuth() {
        if User.currentUser != nil {
            hideAuthButton()
            showUserInfo()
        } else {
            showAuthButton()
            hideUserInfo()
        }
    }
    
    func updateUserInfo() {
        updateAvatar()
        updateNickname()
        updatePoints()
    }
    
    func updatePoints() {
        pointsButton.setTitle("\(User.currentUser?.balance ?? 0) Б", for: .normal)
    }
    
    func updateNickname() {
        nicknameLabel.text = User.currentUser?.nickname
    }
    
    func updateAvatar() {
        avatarImageView.image = User.currentUser?.avatar
        if let imageForAvatar = avatarImageView.image {
            avatarImageView.maskCircle(anyImage: imageForAvatar)
        }
        avatarImageView.setNeedsDisplay()
    }

    func hideAuthButton() {
        authButton.isHidden = true
    }
    
    func showAuthButton() {
        authButton.isHidden = false
    }
    
    func hideUserInfo() {
        avatarImageView.isHidden = true
        nicknameLabel.isHidden = true
        pointsButton.isHidden = true
        bookingsButton.isHidden = true
        eventsButton.isHidden = true
        
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = nil
    }
    
    func showUserInfo() {
        avatarImageView.isHidden = false
        nicknameLabel.isHidden = false
        pointsButton.isHidden = false
        bookingsButton.isHidden = false
        eventsButton.isHidden = false
        
        navigationItem.leftBarButtonItem = qrCodeButton
        navigationItem.rightBarButtonItem = editButton
    }
    
}

extension UIImageView {
    public func maskCircle(anyImage: UIImage) {
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        
        // make square(* must to make circle),
        // resize(reduce the kilobyte) and
        // fix rotation.
        self.image = anyImage
    }
}
