//
//  InstaVideo.swift
//  InstaFlick
//
//  Created by Timothy Brandt on 1/30/17.
//  Copyright (c) 2015 BrandtApps. All rights reserved.
//
//  USAGE: Stored in Realm. PartialInstaPost appears in search results

import UIKit

class InstaVideo : NSObject  {
  
  dynamic var url  : String = ""
  var width        : Int = 0
  var height       : Int = 0
  var ratio : CGFloat {
    return CGFloat(self.height) / CGFloat(self.width)
  }
  
  
  class func initWithJSON(json: [String:Any]) -> InstaVideo {
    let video = InstaVideo()
    
    if let url = json["url"] as? String {
      video.url = url
    }
    
    if let width = json["width"] as? Int {
      video.width = width
    }
    
    if let height = json["height"] as? Int {
      video.height = height
    }
    
    return video
  }
}
