//
//  ProductDescriptionCard.swift
//  iSecure
//
//  Created by Neha Yadav on 01/05/16.
//  Copyright © 2016 Neha Yadav. All rights reserved.
//

import Foundation
import UIKit

class ProductDescriptionCard: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .None
        
        
    }
}