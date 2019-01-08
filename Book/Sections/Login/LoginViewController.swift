//
//  LoginViewController.swift
//  Book
//
//  Created by Javier Cruz Santiago on 1/5/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: BaseViewController {
    //MARK: UI Elements
    var imageLogo: UIImageView!
    var textFieldUser: UITextField!
    var textFieldPassword: UITextField!
    var imageLetters: UIImageView!
    var imageBook: UIImageView!
    var buttonLogin: UIButton!
    var buttonRegister: UIButton!
    
    //MARK: Creating View
    override func createView() {
        navigationController?.navigationBar.isHidden = true
        
        view.backgroundColor = .PRIMARY_COLOR
        
        imageLogo = UIImageView(image: UIImage(named: "logoBook"))
        imageLogo.contentMode = .scaleAspectFit
        
        textFieldUser = UITextField()
        textFieldUser.background = UIImage(named: "inputField")
        textFieldUser.frame.size = CGSize(width: view.frame.width - 120, height: 40)
        textFieldUser.textColor = .white
        textFieldUser.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        textFieldUser.leftViewMode = .always
        textFieldUser.placeholder = "Username"
        textFieldUser.delegate = self
        
        textFieldPassword = UITextField()
        textFieldPassword.background = UIImage(named: "inputField")
        textFieldPassword.frame.size = CGSize(width: view.frame.width - 120, height: 40)
        textFieldPassword.textColor = .white
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        textFieldPassword.leftViewMode = .always
        textFieldPassword.placeholder = "Password"
        textFieldPassword.delegate = self
        
        imageLetters = UIImageView(image: UIImage(named: "randomLetter"))
        imageLetters.contentMode = .scaleAspectFit
        
        imageBook = UIImageView(image: UIImage(named: "imgBook"))
        imageBook.contentMode = .scaleAspectFit
        
        buttonLogin = UIButton.getCustomButton(text: "LOGIN", textColor: .PRIMARY_COLOR, backgroundColor: .CREAME, borderColor: .CREAME)
        buttonLogin.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        buttonRegister = UIButton.getCustomButton(text: "SIGN UP", textColor: .PRIMARY_COLOR, backgroundColor: .CREAME, borderColor: .CREAME)
    }
    
    override func addViews() {
        view.addSubview(imageLogo)
        view.addSubview(imageLetters)
        view.addSubview(imageBook)
        
        view.addSubview(textFieldUser)
        view.addSubview(textFieldPassword)
        view.addSubview(buttonLogin)
        view.addSubview(buttonRegister)
    }
    
    override func setupLayout() {
        imageLogo.frame = CGRect(x: 70, y: view.frame.height / 6, width: view.frame.width - 140, height: 80)
        
        textFieldUser.frame = CGRect(x: 60, y: view.frame.height / 3, width: view.frame.width - 120, height: 40)
        
        textFieldPassword.frame = CGRect(x: 60, y: view.frame.height / 3 + 70, width: view.frame.width - 120, height: 40)
        
        buttonLogin.frame = CGRect(x: 60, y: view.frame.height / 1.7, width: view.frame.width - 120, height: 40)
        buttonLogin.layer.cornerRadius = buttonLogin.frame.height / 2
        
        view.addConstraintsWithFormat(format: "V:[v0(\(view.frame.height / 2))]|", views: imageLetters)
        view.addConstraintsWithFormat(format: "H:|[v0(\(view.frame.width / 2))]", views: imageLetters)
        
        view.addConstraintsWithFormat(format: "V:[v0(\(view.frame.height / 10))]|", views: imageBook)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: imageBook)
    }
    
    //MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareForAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
}

//MARK: Animations Management
extension LoginViewController {
    func prepareForAnimation () {
        textFieldUser.center.x -= view.frame.width
        textFieldPassword.center.x += view.frame.width
        buttonLogin.center.x -= view.frame.width
    }
    
    func animate () {
        UIView.animate(withDuration: 0.5) {
            self.textFieldUser.center.x = self.view.center.x
            self.textFieldPassword.center.x = self.view.center.x
            self.buttonLogin.center.x = self.view.center.x
        }
    }
}

//MARK: UI Elements Actions
extension LoginViewController {
    @objc func login() {
        self.navigationController?.pushViewController(PrincipalPageViewController(), animated: true)
    }
}

//MARK: TextFieldDelegate Management
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
