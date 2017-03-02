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
  
  @IBOutlet weak var username: UILabel!
  @IBOutlet weak var postImage: UIImageView!
  @IBOutlet weak var postTitle: UILabel!
  @IBOutlet weak var subName: UILabel!
  @IBOutlet weak var postDate: UILabel!
  @IBOutlet weak var postContent: UILabel!
  
  @IBOutlet weak var upvoteCount: UILabel!
  @IBOutlet weak var downvoteCount: UILabel!
  @IBOutlet weak var commentCount: UILabel!
  
  
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  /**
   load
   Loads a Insta post object and sets the content
   - parameter InstaPost: InstaPost
   */
  func load(InstaPost:InstaPost) {
    username.text = InstaPost.username
    postTitle.text = InstaPost.title
    postImage.fadeIn(InstaPost.image_url)
    subName.text = InstaPost.subName
    postContent.text = InstaPost.content
    upvoteCount.text = InstaPost.upvotes
    downvoteCount.text = InstaPost.downvotes
    commentCount.text = InstaPost.replies_count
  }
}
