//
//  FlickImageCell.swift
//  InstaFlick
//
//  Created by Timothy Brandt on 1/30/17.
//  Copyright © 2017 BrandtApps. All rights reserved.
//
//  USAGE: Used with the SearchView and BrowseView

import UIKit

class FlickImageCell: UICollectionViewCell {
  
  @IBOutlet weak var postImage: UIImageView!
  @IBOutlet weak var postTitle: UILabel!
  @IBOutlet weak var postTitle2: UILabel!
  
  @IBOutlet weak var likes: UILabel!
  @IBOutlet weak var commentCount: UILabel!
  
  
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  /**
   load
   Loads a Insta post object and sets the content
   - parameter InstaPost: InstaPost
   */
  func load(flickPost:FlickPost) {
    postTitle.text = flickPost.title
    postTitle2.text = flickPost.title
    if let image = (flickPost.image) as? String {
      postImage.fadeIn(image)
    }
  }
}
