//
//  InstaInterface.swift
//  InstaFlick
//
//  Created by Timothy Brandt on 1/30/17.
//  Copyright © 2017 BrandtApps. All rights reserved.
//

import UIKit
import SwiftyJSON

class InstaInterface: NSObject {

  /**
   getInstaPosts
   Fetches Insta
   */
  class func getInstaPosts() {
    APIService.getInstaPosts(handler: { response in
      if (response["data"] != nil) {
        DataStateItems.sharedInstance.instaPosts = InstaPost.parseList(list: response["data"] as! [Any])
      }
    })
  } 
}
