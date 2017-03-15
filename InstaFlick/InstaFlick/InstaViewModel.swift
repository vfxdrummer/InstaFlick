//
//  InstaViewModel.swift
//  InstaFlick
//
//  Created by Timothy Brandt on 3/1/17.
//  Copyright © 2017 BrandtApps. All rights reserved.
//

import UIKit

class InstaViewModel: IFViewModel, DataStateProtocol {
  
  func setup() {
    DataStateItems.sharedInstance.delegate = self
  }
  
  var posts : [InstaPost] {
    get {
      return DataStateItems.sharedInstance.instaPosts
    }
  }
  
  /**
   loadInsta
   Fetch Insta
   */
  func loadInstaPosts() {
    InstaInterface.getInstaPosts()
  }
  
  //  MARK: CurrentInstaProtocol Delegate Methods
  
  /**
   update
   Fired by the DataStateItems when an update occurs for the posts
   - parameter posts: [InstaPost]
   */
  func updateInsta(posts:[InstaPost]) {
    if let view = self.vc as? InstaPostView {
      view.reload()
    }
  }
  
}
