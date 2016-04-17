//
//  resultViewController.swift
//  angelHack
//
//  Created by Bruno F. de Almeida on 16/04/16.
//
//

import UIKit
import AVFoundation

class resultViewController: UIViewController {
    
    @IBOutlet weak var txtPhrase: UILabel!
    @IBOutlet weak var btnFalar: UIButton!
    var frase = ""
    @IBOutlet weak var imgVox: UIImageView!
    
    override func viewDidLoad() {
        self.navigationItem.title = "Frase"
        txtPhrase.text = self.frase
    }
    
    @IBAction func btnFala(sender: AnyObject) {
        imgVox.alpha = 0.5
        falafrase()
    }
    
    @IBAction func btnFalaOut(sender: AnyObject) {
        imgVox.alpha = 1.0
    }
    
    @IBAction func btnFalaDrag(sender: AnyObject) {
        imgVox.alpha = 1.0
    }
    
    func falafrase(){
        let synt: AVSpeechSynthesizer = AVSpeechSynthesizer()
        
        let nextSpeach:AVSpeechUtterance = AVSpeechUtterance(string: self.frase)
        nextSpeach.voice = AVSpeechSynthesisVoice(language: "pt-BR")
        
        let os = NSProcessInfo().operatingSystemVersion
        switch (os.majorVersion){
        case 8:
            nextSpeach.rate = 0
            break
        default:
            nextSpeach.rate = 0.42
            break
        }
        
        synt.speakUtterance(nextSpeach)
    }
}