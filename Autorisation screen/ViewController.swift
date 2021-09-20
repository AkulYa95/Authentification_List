//
//  ViewController.swift
//  Autorisation screen
//
//  Created by Ярослав Акулов on 19.09.2021.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var forgotButtons: [UIButton]!
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let login = "Yaroslav"
    private let password = "Akulov"
    
    var textName: String!
    var textPassword: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        setupViewController()
        
    }
    
    @IBAction func logInButtonPressed() {
        if textName == login && textPassword == password {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        } else {
        wrongData()
        clearTF()
    }
    }
    @IBAction func forgotUserNameButtonPressed() {
        let alert = UIAlertController(title: "Oops", message: "Your name is \(login) 😉", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        let alert = UIAlertController(title: "Oops", message: "Your password is \(password) 😉", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    func clearTF() {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    func wrongData () {
        let wrongData = UIAlertController(title: "Invalid Login, and Password", message: "Please, enter correct login, and password", preferredStyle: .alert)

        wrongData.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(wrongData, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.text = "Welcome \(textName!)"
    }
    func setupViewController() {
        for button in forgotButtons {
            button.titleLabel?.adjustsFontSizeToFitWidth = true
        }
    }
    }
extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
        logInButtonPressed()
        textField.resignFirstResponder()
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text, text != "" else { return }
        if textField == userNameTF {
            textName = text
        } else if textField == passwordTF {
            textPassword = text
        }
    }
}

