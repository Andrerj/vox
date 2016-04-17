//
//  ViewController.swift
//  angelHack
//
//  Created by Bruno F. de Almeida on 16/04/16.
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BackgroundView: UIView!
    var qtdButton: Int = 8
    var btn: UIButton?
    var btnTag:Int = 0
    var colorBackground : UIColor?;
    
    func ScreenSize() -> (width:CGFloat,height:CGFloat,x:CGFloat, y:CGFloat){
        
        //Criar verificação do tamanho da tela
        let screenSize = BackgroundView.bounds
        let screenWidth = screenSize.size.width
        let screenHeight = screenSize.size.height
        let screenX = screenSize.origin.x
        let screenY = screenSize.origin.y
    
        return (screenWidth,screenHeight,screenX,screenY)
    }
    
    func createButton() {
        
        //Define o tamanho do botão
        let screenSize = ScreenSize()
        let widthButton = screenSize.width / 2
        let heigthButton = screenSize.height / 4
        let widthScreen = screenSize.width
        
        print(widthButton)
        print(heigthButton)
        
        //Define Posicionamento
        var posX: CGFloat = 0
        var posY: CGFloat = 0
    
        //Vetor de Cores
        var colors = [UIColor(red:0.19, green:0.43, blue:0.45, alpha:1.0),
                      UIColor(red:0.44, green:0.67, blue:0.70, alpha:1.0),
                      UIColor(red:0.58, green:0.66, blue:0.64, alpha:1.0),
                      UIColor(red:0.79, green:0.87, blue:0.78, alpha:1.0),
                      UIColor(red:0.67, green:0.77, blue:0.63, alpha:1.0),
                      UIColor(red:0.42, green:0.65, blue:0.71, alpha:1.0),
                      UIColor(red:0.85, green:0.87, blue:0.81, alpha:1.0),
                      UIColor(red:0.65, green:0.85, blue:0.80, alpha:1.0)]
        

        for cont in 0..<qtdButton
        {

        var images = [UIImage(named: "Ajuda"),
                      UIImage(named: "Ajuda"),
                      UIImage(named: "Ajuda"),
                      UIImage(named: "Ajuda"),
                      UIImage(named: "Ajuda"),
                      UIImage(named: "Ajuda"),
                      UIImage(named: "Ajuda"),
                      UIImage(named: "Trabalho"),]
            
            //Criando Imagem
            let imageView = UIImageView(image: images[cont])
            imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            
            //Criando o Botão
            btn = UIButton(type: UIButtonType.System) as UIButton
            btn!.frame = CGRectMake(posX, posY, widthButton, heigthButton)
            btn!.backgroundColor = colors[cont]
            btn!.tag = cont
            btn!.addTarget(self, action: #selector(btnAction), forControlEvents: UIControlEvents.TouchUpInside)
            self.BackgroundView.addSubview(btn!)
            btn!.addSubview(imageView)
            
            //Modifica o posicionamento dos buttons
            posX = posX + widthButton
            //posY = floor(CGFloat(cont / 2)) * heigthButton
            
            //print("Cont: \(cont)")
            //print("PosX: \(posX)")
            
            if posX == widthScreen {
                posY = posY + heigthButton
                posX = 0
            }
            
        }
        
        self.BackgroundView.backgroundColor = UIColor.brownColor()
    }
    
    func btnAction(sender:UIButton!)
    {
        btnTag = sender.tag
        self.colorBackground = sender.backgroundColor;
        
        //print(btnTag)
        
        self.performSegueWithIdentifier("PhraseCategory", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        print(self.btnTag)
        
        if segue.identifier == "PhraseCategory" {
            let segueToCategory = segue.destinationViewController as! phraseViewController
            segueToCategory.tagButton = self.btnTag
            segueToCategory.bgColor = self.colorBackground;
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

