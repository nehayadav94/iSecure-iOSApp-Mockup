//
//  ProductInfoCard.swift
//  iSecure
//
//  Created by Neha Yadav on 01/05/16.
//  Copyright © 2016 Neha Yadav. All rights reserved.
//

import Foundation
import UIKit

class ProductInfoCard: UITableViewCell {
    
    @IBOutlet weak var productImage : UIImageView!
    @IBOutlet weak var productTitle : UILabel!
    @IBOutlet weak var productCategory : UILabel!
    @IBOutlet weak var productPrice : UILabel!
    
    override func awakeFromNib() {
        
        self.selectionStyle = .None
        setUpInitialView()
    }
    
    func setUpInitialView() {
        
        productImage.clipsToBounds = true
        
        productPrice.layer.borderWidth = 2.0
        productPrice.layer.cornerRadius = CGFloat(5.0)
        productPrice.layer.borderColor = UIColor.whiteColor().CGColor
        productPrice.clipsToBounds = true
        
    }
}
