//
//  CurrentStatus.swift
//  InstaFlick
//
//  Created by Tim Brandt on 3/1/17.
//  Copyright © 2017 Tim Brandt. All rights reserved.
//

import UIKit

//
// This is a collection of singletons that comprise app state
//

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


//  MARK: CurrentFlickHorizontalItems
protocol CurrentFlickHorizontalProtocol {
  func update(posts:[FlickPost], type:FlickrPostType)
}
class CurrentFlickHorizontalItems : NSObject {
  static let sharedInstance = CurrentFlickHorizontalItems()
  private var delegates : [CurrentFlickHorizontalProtocol] = []
  var delegate : CurrentFlickHorizontalProtocol? = nil {
    didSet {
      delegates.append(delegate!)
    }
  }
  var dogPosts : [FlickPost] = [] {
    didSet {
      _ = delegates.flatMap({
        $0.update(posts: dogPosts, type: FlickrPostType.Dogs)
      })
    }
  }
  var catPosts : [FlickPost] = [] {
    didSet {
      _ = delegates.flatMap({
        $0.update(posts: catPosts, type: FlickrPostType.Cats)
      })
    }
  }
  var monkeyPosts : [FlickPost] = [] {
    didSet {
      _ = delegates.flatMap({
        $0.update(posts: monkeyPosts, type: FlickrPostType.Monkeys)
      })
    }
  }
  var elephantPosts : [FlickPost] = [] {
    didSet {
      _ = delegates.flatMap({
        $0.update(posts: elephantPosts, type: FlickrPostType.Elephants)
      })
    }
  }
}

