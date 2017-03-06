//
//  .swift
//  InstaFlick
//
//  Created by Timothy Brandt on 11/23/15.
//  Copyright © 2015 BrandtApps. All rights reserved.
//
//  USAGE:  User information, cookies, and other constants that are retrieved for the application are stored here.

import UIKit

class DefaultManager: NSObject {
  
  /**
   storeOfRetrieveExistingDefault
   If the key exists, update it with the new value. If the key doesn't exist at all, go ahead and create it.
   - parameter key:   String
   - parameter value: AnyObject?
   - returns: AnyObject?
   */
  class func storeOrRetrieveExistingDefault(key:String, value:AnyObject?) -> AnyObject? {
    if defaultExistsForKey(key: key) {
      return defaultValue(key: key)
    }
    storeDefault(key: key, value: value)
    return value
  }
  
  /**
   defaultExistsForKey
   Return true if the key exists in NSUserDefaults, false if it doens't exist
   - parameter key: String
   - returns: Bool
   */
  class func defaultExistsForKey(key:String) -> Bool {
    let item = UserDefaults.standard.value(forKey: key)
    if item == nil { return false}
    return true
  }
  
  /**
   storeDefault
   Store a default to NSUserDefaults
   - parameter key:   String
   - parameter value: AnyObject?
   */
  class func storeDefault(key:String, value:AnyObject?) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
  }
  
  /**
   defaultValue
   Fetch a default for a given key
   - parameter key: String
   - returns: AnyObject?
   */
  class func defaultValue(key:String)-> AnyObject? {
    return UserDefaults.standard.value(forKey: key) as AnyObject?
  }
  
  /**
   removeDefaultWithKey
   Delete a default with a given key
   - parameter key: String
   */
  class func removeDefaultWithKey(key:String) {
    UserDefaults.standard.removeObject(forKey: key)
    UserDefaults.standard.synchronize()
  }

}
