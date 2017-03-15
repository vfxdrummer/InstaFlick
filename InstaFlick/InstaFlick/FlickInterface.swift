//
//  FlickInterface.swift
//  InstaFlick
//
//  Created by Timothy Brandt on 1/30/17.
//  Copyright © 2017 BrandtApps. All rights reserved.
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
        let returnedFlickPosts:[FlickPost] = parseList(list:photoList)
        switch (page) {
        case 1:
          DataStateItems.sharedInstance.flickPosts = returnedFlickPosts
        default :
          DataStateItems.sharedInstance.flickPosts += returnedFlickPosts
        }
      }
    })
  }
  
  class func getFlickPostsByType(type:FlickrPostType, page:Int, photosPerPage:Int) {
    APIService.getFlickPosts(search:type.rawValue, page:1, photosPerPage:photosPerPage, handler: { response in
      if let photoList = (response["photos"] as! [String:Any])["photo"] as? [Any] {
        let returnedFlickPosts:[FlickPost] = parseList(list:photoList)
        switch(type) {
        case FlickrPostType.Dogs:
          switch (page) {
          case 1:
            DataStateItems.sharedInstance.dogPosts = returnedFlickPosts
          default :
            DataStateItems.sharedInstance.dogPosts += returnedFlickPosts
          }
        case FlickrPostType.Cats:
          switch (page) {
          case 1:
            DataStateItems.sharedInstance.catPosts = returnedFlickPosts
          default :
            DataStateItems.sharedInstance.catPosts += returnedFlickPosts
          }
        case FlickrPostType.Monkeys:
          switch (page) {
          case 1:
            DataStateItems.sharedInstance.monkeyPosts = returnedFlickPosts
          default :
            DataStateItems.sharedInstance.monkeyPosts += returnedFlickPosts
          }
        case FlickrPostType.Elephants:
          switch (page) {
          case 1:
            DataStateItems.sharedInstance.elephantPosts = returnedFlickPosts
          default :
            DataStateItems.sharedInstance.elephantPosts += returnedFlickPosts
          }
        case FlickrPostType.Lions:
          switch (page) {
          case 1:
            DataStateItems.sharedInstance.lionPosts = returnedFlickPosts
          default :
            DataStateItems.sharedInstance.lionPosts += returnedFlickPosts
          }
        case FlickrPostType.Tigers:
          switch (page) {
          case 1:
            DataStateItems.sharedInstance.tigerPosts = returnedFlickPosts
          default :
            DataStateItems.sharedInstance.tigerPosts += returnedFlickPosts
          }
        case FlickrPostType.Bears:
          switch (page) {
          case 1:
            DataStateItems.sharedInstance.bearPosts = returnedFlickPosts
          default :
            DataStateItems.sharedInstance.bearPosts += returnedFlickPosts
          }
        case FlickrPostType.OhMy:
          switch (page) {
          case 1:
            DataStateItems.sharedInstance.ohmyPosts = returnedFlickPosts
          default :
            DataStateItems.sharedInstance.ohmyPosts += returnedFlickPosts
          }
        }
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
    }).filter( { $0.id != "" } )
  }
}
