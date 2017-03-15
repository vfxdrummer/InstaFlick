//
//  StartupService.swift
//  Earbits Radio
//
//  Created by James Tan on 5/17/16.
//  Copyright © 2016 Earbits. All rights reserved.
//

import UIKit
//import ReachabilitySwift

class StartupService: NSObject {
  
  static let sharedInstance : StartupService = StartupService()
  
  //  MARK: Startup Methods
  
  /**
   start
   Setup the various services and make various calls necessary to run the application
   */
  func start() {
      
    // Load Channels
    DispatchQueue.main.async(execute: { // Fetch Initial Images
      FlickInterface.getFlickPosts(search: Constants.defaultFlickSearchTerm, page: 1, photosPerPage: 30)
      FlickInterface.getFlickPostsByType(type: FlickrPostType.Dogs, page:1, photosPerPage:25)
      FlickInterface.getFlickPostsByType(type: FlickrPostType.Cats, page:1, photosPerPage:25)
      FlickInterface.getFlickPostsByType(type: FlickrPostType.Monkeys, page:1, photosPerPage:25)
      FlickInterface.getFlickPostsByType(type: FlickrPostType.Elephants, page:1, photosPerPage:25)
      InstaInterface.getInstaPosts()
    })
  }
}
