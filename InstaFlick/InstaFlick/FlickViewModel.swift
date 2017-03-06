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
  var searchTerm : String {
    get {
      return CurrentFlickItems.sharedInstance.searchTerm
    }
  }
  var page : Int  {
    get {
      return CurrentFlickItems.sharedInstance.page
    }
  }
  var postsPerPage : Int  {
    get {
      return CurrentFlickItems.sharedInstance.postsPerPage
    }
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
    FlickInterface.getFlickPosts(search:self.searchTerm, page:self.page, photosPerPage:self.postsPerPage)
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
  /**
   updatedSearchTerm
   Fired by the CurrentInstaItems when an update occurs for the searchTerm
   - parameter searchTerm: String
   */
  func updatedSearchTerm(searchTerm: String) {
    
  }
  
}
