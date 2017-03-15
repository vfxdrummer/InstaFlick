//
//  FlickHorizontalViewModel.swift
//  InstaFlick
//
//  Created by Timothy Brandt on 3/1/17.
//  Copyright © 2017 BrandtApps. All rights reserved.
//

import UIKit

class FlickHorizontalViewModel: IFViewModel, DataStateProtocol {
  
  func setup() {
    DataStateItems.sharedInstance.delegate = self
  }
  var loading : Bool = false
  var postsPerPage : Int = DataStateItems.sharedInstance.flickPostsPerPage
  var dogPosts : [FlickPost] {
    get {
      return DataStateItems.sharedInstance.dogPosts
    }
  }
  var catPosts : [FlickPost] {
    get {
      return DataStateItems.sharedInstance.catPosts
    }
  }
  var monkeyPosts : [FlickPost] {
    get {
      return DataStateItems.sharedInstance.monkeyPosts
    }
  }
  var elephantPosts : [FlickPost] {
    get {
      return DataStateItems.sharedInstance.elephantPosts
    }
  }
  var lionPosts : [FlickPost] {
    get {
      return DataStateItems.sharedInstance.lionPosts
    }
  }
  var tigerPosts : [FlickPost] {
    get {
      return DataStateItems.sharedInstance.tigerPosts
    }
  }
  var bearPosts : [FlickPost] {
    get {
      return DataStateItems.sharedInstance.bearPosts
    }
  }
  var ohmyPosts : [FlickPost] {
    get {
      return DataStateItems.sharedInstance.ohmyPosts
    }
  }
  
  /**
   loadFlickPosts
   Fetch Flick
   */
  func loadFlickPosts() {
    if loading == true { return }
    loading = true
    for postType in iterateEnum(FlickrPostType.self) {
      FlickInterface.getFlickPostsByType(type: postType, page:1, photosPerPage:postsPerPage)
    }
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
   Fired by the DataStateItems when an update occurs for the posts
   - parameter posts: [FlickPost]
   - parameter type: FlickrPostType
   */
  func updateFlickHorizontal(posts:[FlickPost], type:FlickrPostType.RawValue) {
    if let view = self.vc as? FlickHorizontalPostView {
      view.reload()
    }
  }
  
}
