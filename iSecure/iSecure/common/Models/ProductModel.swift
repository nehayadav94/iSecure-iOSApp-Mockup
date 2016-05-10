//
//  ProductModel.swift
//  iSecure
//
//  Created by Neha Yadav on 30/04/16.
//  Copyright © 2016 Neha Yadav. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductModel: NSObject, Mappable {
    
    var image: String?
    var price: String?
    var title: String?
    var category: String?
    var productDescription: String?
    
    override init() {
        super.init()
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        image       <- map["image"]
        price       <- map["price"]
        title       <- map["title"]
        category    <- map["category"]
        productDescription  <- map["description"]
        
    }
}
