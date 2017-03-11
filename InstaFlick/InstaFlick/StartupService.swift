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
  
//  //  MARK: Internet Connectivity Methods
//  
//  /**
//   connectivityChanges
//   Listen for changes with the connection type and adjust the offline views as necessary.
//   - parameter notif: NSNotification
//   */
//  func connectivityChanged(notif:NSNotification) {
//    if let o = notif.object as? Reachability {
//      if o.isReachableViaWiFi() {
//        // On Wifi
//        if wifi == ConnectionType.None && !didSetup {
//          start()
//        }
//        wifi = ConnectionType.Cellular
//        checkInternetSpeed()
//        EBTabView.shared?.hideOffline()
//      } else if o.isReachable() {
//        // On Cellular
//        if wifi == ConnectionType.None && !didSetup  {
//          start()
//        }
//        wifi = ConnectionType.Cellular
//        EBTabView.shared?.hideOffline()
//      } else {
//        // Not Connected
//        wifi = ConnectionType.None
//        EBTabView.shared?.showOffline()
//      }
//    }
//    // Reload the Playlists
//    CurrentLibraryItems.sharedInstance.favoriteChanged = true
//  }
//  
//  /**
//   checkInternet
//   Check whether the internet is connected and all and if so, start downloading the test image to guage connection speed.
//   - returns: Bool (true : connected, False : not connected)
//   */
//  func checkInternet() -> Bool {
//    // Determine Reachability on Connection Alone
//    do {
//      reachability = try Reachability.reachabilityForInternetConnection()
//      
//      try reachability?.startNotifier()
//      // Determine the Connection Type
//      if !reachability!.isReachable() {
//        wifi = ConnectionType.None
//        return false
//      } else {
//        wifi = ConnectionType.Cellular
//        return true
//      }
//    } catch {
//      print("Unable to create Reachability")
//      return false
//    }
//  }
//
//  /**
//   checkInternetSpeed
//   Determine the download speed of a 1 MB file - if it's 1MB/sec then use high quality assets.
//   */
//  func checkInternetSpeed() {
//    // Determine Download Speed and Adjust Accordingly
//    self.startTime = NSDate()
//    let url = NSURL(string:"http://cdn-0.earbits.com/assets/frontend/defaults/main/processing.jpg")
//    AFAdapter.GET_TEST(url!, trigger: { response in
//      let size = 997.0 //KB
//      self.finishedTime = NSDate()
//      let difference = self.finishedTime!.timeIntervalSinceDate(self.startTime!)
//      let rate = size/difference
//      self.downloadSpeed = rate
//      if rate > 1000.0 && self.reachability!.isReachableViaWiFi() {
//        self.wifi = ConnectionType.Wifi
//      } else {
//        self.wifi = ConnectionType.Cellular
//      }
//      }
//    )
//  }
}
