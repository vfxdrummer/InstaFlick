//
//  InstaPost.swift
//  Earbits Radio
//
//  Created by Timothy Brandt on 1/30/17.
//  Copyright (c) 2015 Earbits. All rights reserved.
//
//  USAGE: Stored in Realm. PartialInstaPost appears in search results

import UIKit

public enum InstaPostType : String {
  case Image    = "image"
  case Video    = "video"
}

class InstaPost : NSObject  {
  
  dynamic var insta_post_type                = InstaPostType.Image.rawValue
  var insta_post_type_enum                   : InstaPostType {
    get {
      let resourceType = InstaPostType(rawValue: insta_post_type)
      return (resourceType != nil) ? resourceType! : InstaPostType.Image
    }
    set {
      insta_post_type                        = newValue.rawValue
    }
  }
  dynamic var id                             : String = ""
  dynamic var title                          : String = ""
  dynamic var likes                          : Int = 0
  dynamic var comments                       : Int = 0
  dynamic var image_standard_resolution      : InstaImage? = nil
}
