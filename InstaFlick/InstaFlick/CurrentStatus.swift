//
//  CurrentStatus.swift
//  InstaFlick
//
//  Created by Tim Brandt on 3/1/17.
//  Copyright © 2017 Tim Brandt. All rights reserved.
//

import UIKit

//  MARK: CurrentInstaItems
protocol CurrentInstaProtocol {
  func update(posts:[InstaPost])
}
class CurrentInstaItems : NSObject {
  static let sharedInstance = CurrentInstaItems()
  private var delegates : [CurrentInstaProtocol] = []
  var delegate : CurrentInstaProtocol? = nil {
    didSet {
      delegates.append(delegate!)
    }
  }
  var instaPosts : [InstaPost] = [] {
    didSet {
      _ = delegates.flatMap({
        $0.update(posts: instaPosts)
      })
    }
  }
}

//  MARK: CurrentFlickItems
protocol CurrentFlickProtocol {
  func update(posts:[FlickPost])
  func updatedSearchTerm(searchTerm: String)
}
class CurrentFlickItems : NSObject {
  static let sharedInstance = CurrentFlickItems()
  private var delegates : [CurrentFlickProtocol] = []
  var delegate : CurrentFlickProtocol? = nil {
    didSet {
      delegates.append(delegate!)
    }
  }
  var searchTerm : String = "dogs" {
    didSet {
      self.page = 1
      _ = delegates.flatMap({
        $0.updatedSearchTerm(searchTerm: searchTerm)
      })
    }
  }
  var page : Int = 1
  var postsPerPage = 30
  var flickPosts : [FlickPost] = [] {
    didSet {
      _ = delegates.flatMap({
        $0.update(posts: flickPosts)
      })
    }
  }
}


