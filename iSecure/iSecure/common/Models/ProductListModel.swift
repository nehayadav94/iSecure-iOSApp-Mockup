//
//  ProductListModel.swift
//  iSecure
//
//  Created by Neha Yadav on 30/04/16.
//  Copyright © 2016 Neha Yadav. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductListModel: NSObject, Mappable {
    
    var products: [ProductModel]?
    var quote_max: String?
    var quote_available: String?
    
    override init() {
        super.init()
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        products    <- map["products"]
        quote_max   <- map["quote_max"]
        quote_available <- map["quote_available"]
    
    }
    
}
