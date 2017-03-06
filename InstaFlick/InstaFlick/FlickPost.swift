//
//  FlickPost.swift
//  InstaFlick
//
//  Created by Timothy Brandt on 1/30/17.
//  Copyright (c) 2015 BrandtApps. All rights reserved.
//
//  USAGE: Stored in Realm. PartialFlickPost appears in search results

import UIKit

class FlickPost : NSObject  {
  dynamic var id                             : String = ""
  dynamic var title                          : String = ""
  dynamic var farm                           : Int = 0
  dynamic var secret                         : String = ""
  dynamic var server                         : String = ""
  var image : String {
    get {
      return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg"
    }
  }
}
