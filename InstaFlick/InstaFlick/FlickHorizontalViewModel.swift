//
//  FlickHorizontalViewModel.swift
//  InstaFlick
//
//  Created by Timothy Brandt on 3/1/17.
//  Copyright © 2017 BrandtApps. All rights reserved.
//

import UIKit

class FlickHorizontalViewModel: IFViewModel, CurrentFlickHorizontalProtocol {
  
  func setup() {
    CurrentFlickHorizontalItems.sharedInstance.delegate = self
  }
  
  var dogPosts : [FlickPost] {
    get {
      return CurrentFlickHorizontalItems.sharedInstance.dogPosts
    }
  }
  var catPosts : [FlickPost] {
    get {
      return CurrentFlickHorizontalItems.sharedInstance.catPosts
    }
  }
  var monkeyPosts : [FlickPost] {
    get {
      return CurrentFlickHorizontalItems.sharedInstance.monkeyPosts
    }
  }
  var elephantPosts : [FlickPost] {
    get {
      return CurrentFlickHorizontalItems.sharedInstance.elephantPosts
    }
  }
  
  //  MARK: CurrentFlickProtocol Delegate Methods
  
  /**
   update
   Fired by the CurrentFlickHorizontalItems when an update occurs for the posts
   - parameter posts: [FlickPost]
   - parameter type: FlickrPostType
   */
  func update(posts:[FlickPost], type:FlickrPostType){
//    loading = false
//    if let view = self.vc as? FlickPostView {
//      if (page > 1) {
//        view.reloadCollection()
//      } else {
//        view.reload()
//      }
//    }
  }
  
}
