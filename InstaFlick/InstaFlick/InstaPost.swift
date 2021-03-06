//
//  InstaPost.swift
//  InstaFlick
//
//  Created by Timothy Brandt on 1/30/17.
//  Copyright (c) 2015 BrandtApps. All rights reserved.
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
  dynamic var video_standard_resolution      : InstaVideo? = nil
  
  /**
   parse
   Takes a JSON object and pulls out the necessary values.\
   */
  class func parse(json:[String: Any]) -> InstaPost {
    let post : InstaPost = InstaPost()
    
    switch(json["type"] as! String) {
    case "video":
      post.insta_post_type = "video"
    case "image":
      post.insta_post_type = "image"
    default:
      return post
    }
    
    if let id = json["id"] as? String {
      post.id = id
    }
    
    if let caption = json["caption"] as? [String:Any] {
      post.title = caption["text"]! as! String
    }
    
    if let likes = json["likes"] as? [String:Any] {
      post.likes = likes["count"] as! Int
    }
    
    if let comments = json["comments"] as? [String:Any] {
      post.comments = comments["count"] as! Int
    }
    
    
    if let images = json["images"] as? [String:Any] {
      if images["standard_resolution"] != nil {
        post.image_standard_resolution = InstaImage.initWithJSON(json: images["standard_resolution"] as! [String : Any])
      }
    }
    
    if let videos = json["videos"] as? [String:Any] {
      if videos["standard_resolution"] != nil {
        post.video_standard_resolution = InstaVideo.initWithJSON(json: videos["standard_resolution"] as! [String : Any])
      }
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
  class func parseList(list:Array<Any>) -> [InstaPost] {
    return list.map( {
      if let json = $0 as? [String: Any] {
        return parse(json: json)
      } else {
        return InstaPost()
      }
    }).filter( { $0.image_standard_resolution != nil } )
  }
}
