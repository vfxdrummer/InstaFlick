//
//  InstaPostView.swift
//  Earbits Radio
//
//  Created by Timothy Brandt on 3/1/17.
//  Copyright © 2016 Earbits. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class InstaPostView: UITableViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
  private var instaViewModel : InstaViewModel? = nil
  
  @IBOutlet weak var collectionInsta: UICollectionView!
  
  //  MARK: UIView Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup the ViewModel
    instaViewModel = InstaViewModel(viewController: self)
    instaViewModel?.setup()
    
    // Setup the Nibs
    let InstaImagePostNib = UINib(nibName: "InstaImageCell", bundle: nil)
    
    // Setup the Collection
    collectionInsta.register(InstaImagePostNib, forCellWithReuseIdentifier: "InstaImageCell")
    
    // Setup the Delegates
    collectionInsta.delegate = self
    collectionInsta.dataSource = self
//    if #available(iOS 10.0, *) {
//      collectionInsta.refreshControl = self.refreshControl!
//    } else {
//      collectionInsta.addSubview(self.refreshControl!)
//    }
    
    // Setup the Title
    self.restorationIdentifier = "InstaPost"
    
    self.refreshControl!.addTarget(self, action: #selector(InstaPostView.refresh(refreshControl:)), for: UIControlEvents.valueChanged)
    
    instaViewModel?.loadInstaPosts()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    // Setup the Title
    self.tabBarController?.title = Constants.instaTitle.rawValue
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func refresh(refreshControl: UIRefreshControl) {
    instaViewModel?.loadInstaPosts()
    
//    if #available(iOS 10.0, *) {
//      if collectionInsta.refreshControl!.isRefreshing
//      {
//        collectionInsta.refreshControl?.endRefreshing()
//      }
//    }
    
    if self.refreshControl!.isRefreshing
    {
      self.refreshControl!.endRefreshing()
    }
  }
  
  /**
   reload
   */
  func reload() {
    tableView.reloadData()
    collectionInsta.reloadData()
  }
  
  //  MARK: UITableViewDelegate & UITableViewDataSource Methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView,
                          heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat(0.5)
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UIScreen.main.bounds.height
  }

  
  //  MARK: UICollectionViewDelegate & UICollectionViewDataSource Methods
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let InstaPostObj = instaViewModel!.posts[indexPath.row]
    guard InstaPostObj.insta_post_type == "video" else { return }
    
    let videoURL = NSURL(string: (InstaPostObj.video_standard_resolution?.url)!)
    let player = AVPlayer(url: videoURL! as URL)
    let playerViewController = AVPlayerViewController()
    playerViewController.player = player
    self.present(playerViewController, animated: true) {
      playerViewController.player!.play()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let InstaPostObj = instaViewModel!.posts[indexPath.row]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InstaImageCell", for: indexPath as IndexPath) as! InstaImageCell
    cell.load(instaPost: InstaPostObj)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return instaViewModel!.posts.count
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let InstaPostObj = instaViewModel!.posts[indexPath.row]
    let ratio = InstaPostObj.image_standard_resolution?.ratio
    let height : CGFloat = ratio! * UIScreen.main.bounds.width
    let width : CGFloat = UIScreen.main.bounds.width
    return CGSize(width:width, height:height)
  }
  
}