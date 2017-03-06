//
//  FlickViewModel.swift
//  Earbits Radio
//
//  Created by Timothy Brandt on 3/1/17.
//  Copyright © 2016 Earbits. All rights reserved.
//

import UIKit

class FlickViewModel: IFViewModel, CurrentFlickProtocol {
  
  func setup() {
    CurrentFlickItems.sharedInstance.delegate = self
  }
  
  var posts : [FlickPost] {
    get {
      return CurrentFlickItems.sharedInstance.flickPosts
    }
  }
  
  /**
   loadInsta
   Fetch Insta
   */
  func loadFlickPosts() {
    FlickInterface.getFlickPosts(search:"dogs", page:"1", photosPerPage:"25")
  }
  
  //  MARK: CurrentFlickProtocol Delegate Methods
  
  /**
   update
   Fired by the CurrentInstaItems when an update occurs for the posts
   - parameter posts: [FlickPost]
   */
  func update(posts:[FlickPost]) {
    if let view = self.vc as? FlickPostView {
      view.reload()
    }
  }
  
}
