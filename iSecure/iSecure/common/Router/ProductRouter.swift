//
//  ProductRouter.swift
//  iSecure
//
//  Created by Neha Yadav on 30/04/16.
//  Copyright © 2016 Neha Yadav. All rights reserved.
//

import Foundation
import Alamofire

enum ProductRouter {
    
    case GetProductList
    
    var path: String {
        
        switch self {
        case .GetProductList:
            return "https://hackerearth.0x10.info/api/isecure"
        }
    }
    
    var method: Alamofire.Method {
        
        switch self {
        case .GetProductList:
            return .GET
        }
    }
    
    var parameters: [String: AnyObject]? {
        
        switch self {
        case .GetProductList:
            return ["type":"json", "query":"list_product"]
        }
    }
    
    var body: AnyObject? {
        switch self {
        default:
            return nil
        }
    }
}
