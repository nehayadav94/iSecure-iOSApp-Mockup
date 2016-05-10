//
//  BaseRouter.swift
//  iSecure
//
//  Created by Neha Yadav on 30/04/16.
//  Copyright © 2016 Neha Yadav. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

enum BaseRouter: URLRequestConvertible {
    
    case ProductRouteManager(ProductRouter)
    
    var URLRequest: NSMutableURLRequest {
        
        switch self {
        case .ProductRouteManager(let request):
            return self.configureRequest(request)
        }
    }
    
    func configureRequest(request: ProductRouter) -> NSMutableURLRequest {
        
        let url = NSURL(string: request.path)!
        
        let mutableURLRequest = NSMutableURLRequest(URL: url)
        
        mutableURLRequest.HTTPMethod = request.method.rawValue
        
        if let parameters = request.parameters {
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        }
        
        return mutableURLRequest
    }
    
}
