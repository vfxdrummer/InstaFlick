//
//  APIService.swift
//  Earbits Radio
//
//  Created by Timothy Brandt on 7/9/15.
//  Copyright (c) 2015 Earbits. All rights reserved.
//
//  USAGE:  Handles interface with APICore and Streaming.
//  IMPORTANT:  The composeAPIURL method defines where and how the client_token gets added to the request URL for streaming
//  TODO: Should probably replace all these strings for keys with something less brittle
//  For more information, see: http://docs.earbitsapi.apiary.io/#reference/
//  For more information, see the PAW file included in this repo

import UIKit
import SwiftyJSON

class APIService: NSObject {
  
  class func getInstaPosts(handler: @escaping (_ json: [String: Any]) -> ()) {
    let urlInsta = "https://api.instagram.com/v1/users/self/media/recent/?access_token=1278143711.9f65e75.fdf706f15abb4635b91592a87dde1c7f"
    AFAdapter.GET(urlString:urlInsta, handler: handler)
  }
  
}
