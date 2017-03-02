//
//  InstaInterface.swift
//  Earbits Radio
//
//  Created by Timothy Brandt on 1/30/17.
//  Copyright © 2016 Earbits. All rights reserved.
//

import UIKit
import SwiftyJSON

class InstaInterface: NSObject {

  /**
   getInstaPosts
   Fetches Insta
   */
  class func getInstaPosts() {
//    APIService.sharedInstance.getInstaPosts({ response in
//      CurrentInstaItems.sharedInstance.InstaPosts = parseList(response["posts"]).filter({$0.level == "0"})
//    })
  }
  
//  /**
//   structureInstaPostHierarchy
//   organizes flat list of Insta posts into comment tree
//   */
//  class func structureInstaPostHierarchy(posts:[InstaPost]) -> [InstaPost] {
//    var postMap:[String:InstaPost] = [:]
//    var structuredPosts:[InstaPost] = []
//    var replies:[InstaPost] = []
//    
//    for post in posts {
//      // append root post nodes
//      postMap[post.id] = post
//      if (post.parent_id == "") {
//        structuredPosts.append(post)
//      } else if (post.parent_id != "") {
//        replies.append(post)
//      }
//    }
//    
//    // connect replies to parents
//    for childPost in replies {
//      if let parentPost = postMap[childPost.parent_id] {
//        parentPost.childPosts.append(childPost)
//      }
//    }
//    return structuredPosts
//  }
  
  
  /**
   parse
   Takes a JSON object and pulls out the necessary values.\
   */
  class func parse(json:JSON) -> InstaPost {
    let post : InstaPost = InstaPost()
//    post.id = json["id"].stringValue
//    post.share_resource_id = json["share_resource_id"].stringValue
//    post.parent_id = json["parent_id"].stringValue
//    post.downvotes = (json["downvotes"].stringValue != "") ? json["downvotes"].stringValue : "0"
//    post.created_at = json["created_at"].stringValue.toDate()
//    post.image_url = json["image_url"].stringValue
//    post.user_id = json["user_id"].stringValue
//    post.upvotes = (json["upvotes"].stringValue != "") ? json["upvotes"].stringValue : "0"
//    post.share_resource_type = json["share_resource_type"].stringValue
//    post.original_parent_id = json["original_parent_id"].stringValue
//    post.updated_at = json["updated_at"].stringValue
//    post.replies_count = (json["replies_count"].stringValue != "") ? json["replies_count"].stringValue : "0"
//    post.content = json["content"].stringValue
//    
//    // set title
//    switch post.share_resource_type {
//    case "playlist":
//      let share_resource = json["share_resource"]
//      post.title = share_resource["name"].stringValue
//    case "track":
//      let share_resource = json["share_resource"]
//      post.title = share_resource["title"].stringValue
//      post.subName = share_resource["artist"].stringValue
//    case "text":
//      post.title = InstaPost.titleFromContent(post.content)
//    default:
//      post.title = ""
//    }
//    
//    if json["user"] != nil {
//      let user = json["user"]
//      if user["info"] != nil {
//        let info = user["info"]
//        var name = ""
//        if info["first_name"] != nil {
//          name = "\(info["first_name"]) "
//        }
//        if info["last_name"] != nil {
//          name = "\(name)\(info["last_name"])"
//        }
//        post.username = name
//      }
//    }
//    
//    print(json)
//    
//    // fix blank resource types
//    post.share_resource_type = (post.share_resource_type != "") ? post.share_resource_type : InstaShareResourceType.Text.rawValue.strippedQuotes
//    
//    if (post.parent_id != "" || post.original_parent_id != "") {
//      post.share_resource_type = InstaShareResourceType.Reply.rawValue.strippedQuotes
//    }
    
    return post
  }
  
  /**
   parseList
   Takes a JSON Array and parses channel objects, returns a parsed array of Channels
   - parameter json:   JSON [Array]
   - parameter usePNG: Bool
   - returns: [Channel]
   */
  class func parseList(json:JSON) -> [InstaPost] {
//    if let list = json.array {
//      return assignPostLevel(list.map({
//        parse($0)
//      }))
//    }
    return []
  }
}
