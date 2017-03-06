//
//  AFAdapter.swift
//  InstaFlick
//
//  Created by Timothy Brandt 3/1/17.
//  Copyright (c) 2015 BrandtApps. All rights reserved.
//
//  USAGE: AFAdapter is a wrapper for Alamofire calls

import UIKit
import Alamofire
import SwiftyJSON

class AFAdapter: NSObject {
  /**
   GET
   Process a GET request.
   - parameter url:          NSURL for the Endpoint
   - parameter handler:      (JSON) - SUCCESS Case
   - parameter errorHandler: (NSError) - FAIL Case
   */
  class func GET(urlString:String, handler: @escaping ([String: Any]) -> (), errorHandler:((NSError?) -> ())? = nil) {
    
    Alamofire.request(urlString).responseJSON { response in
      guard let json = response.result.value as? [String: Any] else {
        return
      }
      
      handler(json)
    }
  }
}
