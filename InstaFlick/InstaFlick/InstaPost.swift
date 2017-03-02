//
//  InstaPost.swift
//  Earbits Radio
//
//  Created by Timothy Brandt on 1/30/17.
//  Copyright (c) 2015 Earbits. All rights reserved.
//
//  USAGE: Stored in Realm. PartialInstaPost appears in search results

import UIKit

public enum CommunityShareResourceType : String {
  case Album    = "album"
  case Playlist = "playlist"
  case Reply    = "reply"
  case Text     = "text"
  case Track    = "track"
}

class InstaPost : NSObject  {
  
  dynamic var id                  : String = ""
  dynamic var share_resource_id   : String = ""
  dynamic var parent_id           : String = ""
  dynamic var downvotes           : String = ""
  dynamic var created_at          : NSDate = NSDate()
  dynamic var image_url           : String = ""
  dynamic var user_id             : String = ""
  dynamic var username            : String = ""
  dynamic var upvotes             : String = ""
  dynamic var share_resource_type = CommunityShareResourceType.Text.rawValue
  var share_resource_type_enum : CommunityShareResourceType {
    get {
      let resourceType = CommunityShareResourceType(rawValue: share_resource_type)
      return (resourceType != nil) ? resourceType! : CommunityShareResourceType.Text
    }
    set {
      share_resource_type = newValue.rawValue
    }
    
  }
  dynamic var original_parent_id  : String = ""
  dynamic var updated_at          : String = ""
  dynamic var replies_count       : String = ""
  dynamic var content             : String = ""
  dynamic var title               : String = ""
  dynamic var subName             : String = ""
  dynamic var level               : String = ""

}
