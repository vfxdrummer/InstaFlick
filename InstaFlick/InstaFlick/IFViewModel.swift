//
//  IFViewModel.swift
//  Earbits Radio
//
//  Created by Tim Brandt on 3/1/17.
//  Copyright © 2016 Earbits. All rights reserved.
//

import UIKit

class IFViewModel : NSObject {
  weak var vc : UIViewController? = nil
  
  convenience override init() {
    self.init(viewController : nil)
  }
  
  init(viewController : UIViewController?) {
    self.vc = viewController
    super.init()
  }

  // Called on Accessory Views
  func dismiss() {
  }
}
