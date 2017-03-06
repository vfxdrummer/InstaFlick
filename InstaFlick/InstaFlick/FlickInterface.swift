//
//  FlickInterface.swift
//  Earbits Radio
//
//  Created by Timothy Brandt on 1/30/17.
//  Copyright © 2016 Earbits. All rights reserved.
//

import UIKit
import SwiftyJSON

class FlickInterface: NSObject {

  /**
   getFlickPosts
   Fetches Flick
   */
  class func getFlickPosts(search:String, page:Int, photosPerPage:Int) {
    APIService.getFlickPosts(search:search, page:page, photosPerPage:photosPerPage, handler: { response in
      if let photoList = (response["photos"] as! [String:Any])["photo"] as? [Any] {
        CurrentFlickItems.sharedInstance.flickPosts = parseList(list:photoList)
      }
    })
  }
  
  
  /**
   parse
   Takes a JSON object and pulls out the necessary values.\
   */
  class func parse(json:[String: Any]) -> FlickPost {
    let post : FlickPost = FlickPost()
      
    if let id = json["id"] as? String {
      post.id = id
    }
    
    if let title = json["title"] as? String {
      post.title = title
    }
    
    if let farm = json["farm"] as? Int {
      post.farm = farm
    }
    
    if let server = json["server"] as? String {
      post.server = server
    }
    
    if let secret = json["secret"] as? String {
      post.secret = secret
    }
    
    return post
  }
  
  /**
   parseList
   Takes a JSON Array and parses channel objects, returns a parsed array of Channels
   - parameter json:   JSON [Array]
   - parameter usePNG: Bool
   - returns: [Channel]
   */
  class func parseList(list:Array<Any>) -> [FlickPost] {
    return list.map( {
      if let json = $0 as? [String: Any] {
        return parse(json: json)
      } else {
        return FlickPost()
      }
    })
  }
}
