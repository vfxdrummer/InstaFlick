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
  
  class func getFlickPosts(search:String, page:Int, photosPerPage:Int, handler: @escaping (_ json: [String: Any]) -> ()) {
    let urlFlick = String(format:Constants.flickPostsURL.rawValue, search, String(page), String(photosPerPage))
    AFAdapter.GET(urlString:urlFlick, handler: handler)
  }
  
  class func getInstaPosts(handler: @escaping (_ json: [String: Any]) -> ()) {
    let urlInsta = Constants.instaPostsURL.rawValue
    AFAdapter.GET(urlString:urlInsta, handler: handler)
  }
  
//  /**
//   composeAPIURL
//   Recursively compose the URL GET params and then return a finished URL for loading
//   - parameter key:    String (see Constants for definition)
//   - parameter values: values
//   - returns: NSURL
//   */
//  private func composeAPIURL(key:String, values:NSArray) -> NSURL {
//    let path = Constants.endPoints[key]
//    let completed = String.withFormat(path!, list: values.toMutableArray())
//    
//    // For the streamID and the stream endpoint we need to pass back a client_token if it's available (which may not be)
//    // IMPORTANT: This snippet is required for consistent playback
//    if key == "streamID" || key == "stream" || key == "search" {
//      if let param = AFAdapter.serverTokenParam {
//        return (completed + param).toURL()
//      }
//    }
//    
//    return completed.toURL()
//  }
}
