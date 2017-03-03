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


