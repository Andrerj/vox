//
//  resultViewController.swift
//  angelHack
//
//  Created by Bruno F. de Almeida on 16/04/16.
//
//

import UIKit

class resultViewController: UIViewController {
    
    @IBOutlet weak var txtPhrase: UILabel!
    var frase = ""
    
    override func viewDidLoad() {
        self.navigationItem.title = "Frase"
        txtPhrase.text = self.frase
        
    }
}