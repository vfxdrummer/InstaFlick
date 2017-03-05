//
//  InstaImageCell.swift
//  Earbits Radio
//
//  Created by Timothy Brandt on 1/30/17.
//  Copyright © 2016 Earbits. All rights reserved.
//
//  USAGE: Used with the SearchView and BrowseView

import UIKit

class InstaImageCell: UICollectionViewCell {
  
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
  func load(instaPost:InstaPost) {
    postTitle.text = instaPost.title
    postTitle2.text = instaPost.title
    likes.text = String(instaPost.likes)
    commentCount.text = String(instaPost.comments)
    if let image = (instaPost.image_standard_resolution?.url)! as? String {
      postImage.fadeIn(image)
    }
  }
}