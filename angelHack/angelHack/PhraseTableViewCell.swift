//
//  PhraseTableViewCell.swift
//  angelHack
//
//  Created by Bruno de Paula Munhoz on 17/04/16.
//
//

import UIKit

class PhraseTableViewCell: UITableViewCell, UIScrollViewDelegate {
    
    @IBOutlet weak var signImage: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        scroll.delegate = self;
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("Scrolado")
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
