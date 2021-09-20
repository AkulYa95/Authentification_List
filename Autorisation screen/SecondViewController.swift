//
//  SecondViewController.swift
//  Autorisation screen
//
//  Created by Ярослав Акулов on 19.09.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    var text: String!
    override func viewDidLoad() {
        greetingLabel.text = text

        super.viewDidLoad()

    }
    
}
