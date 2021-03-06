//
//  Contest.swift
//  InstaFlick
//
//  Created by Tim Brandt on 3/1/17.
//  Copyright © 2017 Tim Brandt. All rights reserved.
//

import UIKit

enum StoryboardName : String {
  case Main = "Main"
  case Onboarding = "Onboarding"
}

struct Constants {
  static let defaultFlickSearchTerm = "dogs"
  static let flickTitle = "Flick"
  static let flickPostsURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3f93cfcb6cb49b3f167bf7282c469607&tags=%@&page=%@&per_page=%@&format=json&nojsoncallback=1"
  static let flickHorizontalTitle = "Animals"
  static let instaTitle = "Insta"
  static let instaPostsURL = "https://api.instagram.com/v1/users/self/media/recent/?access_token=1278143711.9f65e75.fdf706f15abb4635b91592a87dde1c7f"
  static let instaPostsPerPage = 30
  static let flickPostsPerPage = 25
}

enum FlickrPostType : String {
  case Dogs = "Dogs"
  case Cats = "Cats"
  case Monkeys = "Monkeys"
  case Elephants = "Elephants"
  case Lions = "Lions"
  case Tigers = "Tigers"
  case Bears = "Bears"
  case OhMy = "Oh"
}
