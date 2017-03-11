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
  var loading : Bool = false
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
  
  /**
   loadFlickPosts
   Fetch Flick
   */
  func loadFlickPosts() {
    if loading == true { return }
    loading = true
    FlickInterface.getFlickPostsByType(type: FlickrPostType.Dogs, page:1, photosPerPage:25)
    FlickInterface.getFlickPostsByType(type: FlickrPostType.Cats, page:1, photosPerPage:25)
    FlickInterface.getFlickPostsByType(type: FlickrPostType.Monkeys, page:1, photosPerPage:25)
    FlickInterface.getFlickPostsByType(type: FlickrPostType.Elephants, page:1, photosPerPage:25)
    
  }
  
  /**
   refreshFlickPosts
   */
  func refreshFlickPosts() {
    loading = false
    self.loadFlickPosts()
  }
  
  //  MARK: CurrentFlickHorizontalProtocol Delegate Methods
  
  /**
   update
   Fired by the CurrentFlickHorizontalItems when an update occurs for the posts
   - parameter posts: [FlickPost]
   - parameter type: FlickrPostType
   */
  func update(posts:[FlickPost], type:FlickrPostType){
    if let view = self.vc as? FlickHorizontalPostView {
      view.reload()
    }
  }
  
}
