//
//  APIService.swift
//  InstaFlick
//
//  Created by Timothy Brandt on 7/9/15.
//  Copyright (c) 2015 BrandtApps. All rights reserved.
//
//  USAGE:  Handles interface with APICore and Streaming.
//  IMPORTANT:  The composeAPIURL method defines where and how the client_token gets added to the request URL for streaming
//  TODO: Should probably replace all these strings for keys with something less brittle
//  For more information, see: http://docs.BrandtAppsapi.apiary.io/#reference/
//  For more information, see the PAW file included in this repo

import UIKit
import SwiftyJSON

class APIService: NSObject {
  
  class func getFlickPosts(search:String, page:Int, photosPerPage:Int, handler: @escaping (_ json: [String: Any]) -> ()) {
    let urlFlick = String(format:Constants.flickPostsURL.rawValue, search, String(page), String(photosPerPage))
    AFAdapter.GET(urlString:urlFlick, handler: handler)
  }
  
  class func getInstaPosts(handler: @escaping (_ json: [String: Any]) -> ()) {
    let urlInsta = Constants.instaPostsURL.rawValue
    AFAdapter.GET(urlString:urlInsta, handler: handler)
  }
}
