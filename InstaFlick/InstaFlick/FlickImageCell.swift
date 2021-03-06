//
//  FlickImageCell.swift
//  InstaFlick
//
//  Created by Timothy Brandt on 1/30/17.
//  Copyright © 2017 BrandtApps. All rights reserved.
//
//  USAGE: Used with the Flick Views

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
  func load(flickPost:FlickPost, roundify:Bool=false) {
    // this is needed to update the cornerRadius
    self.layoutIfNeeded()
    
    // set values
    postTitle.text = flickPost.title
    postTitle2.text = flickPost.title
    postImage.fadeIn(flickPost.image)
    postImage.borderize()
    if (roundify) {
      postImage.roundify()
    }
  }
}
