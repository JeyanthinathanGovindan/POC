//
//  LoginViewController.swift
//  VajroCodeTask_Jeyanthinathan
//
//  Created by AMBINO4526 on 06/08/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var uploadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveImage()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if isValidationSuccessful() {
            saveImage(image: profilePictureImageView.image)
            let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
            let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
            self.navigationController?.pushViewController(tabBarController, animated: false)
        } else {
            showAlert(message: "Invalid email/password or missing profile picture")
        }
    }
    
    @IBAction func uploadTapped(_ sender: Any) {
        ImageUploadHelper().pickImage(self){ image in
            DispatchQueue.main.async {
                self.profilePictureImageView.image = image
                self.uploadButton.titleLabel?.text = "Edit"
            }
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            print("Invalid email or password")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveImage(image: UIImage?) {
        guard let data = image?.jpegData(compressionQuality: 0.5) else { return
        }
        let encoded = try? PropertyListEncoder().encode(data)
        UserDefaults.standard.set(encoded, forKey: "PROFILE_PIC")
    }
    
    func retrieveImage() {
        guard let data = UserDefaults.standard.data(forKey: "PROFILE_PIC") else { return }
        if let decoded = try? PropertyListDecoder().decode(Data.self, from: data) {
            profilePictureImageView.image = UIImage(data: decoded)
            self.uploadButton.titleLabel?.text = "Edit"
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            let email = textField.text ?? ""
            if !email.isValidEmail() {
                showAlert(message: "Invalid email")
            }
        case passwordTextField:
            let password = textField.text ?? ""
            if !password.isValidPassword() {
                showAlert(message: "Invalid password")
            }
        default:
            break
        }
    }
    
    func isValidationSuccessful() -> Bool {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        return email.isValidEmail() && password.isValidPassword() && self.profilePictureImageView.image != nil
    }
}
