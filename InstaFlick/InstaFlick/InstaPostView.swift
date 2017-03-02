//
//  InstaPostView.swift
//  Earbits Radio
//
//  Created by Timothy Brandt on 3/1/17.
//  Copyright © 2016 Earbits. All rights reserved.
//

import UIKit

class InstaPostView: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
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
    
    // Setup the Title
    self.restorationIdentifier = "InstaPost"
    
//    self.refreshControl!.addTarget(self, action: #selector(InstaPostView.refresh(_:)), for: UIControlEvents.ValueChanged)
    
    instaViewModel?.loadInstaPosts()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    // Setup the Title
    self.tabBarController?.title = "Insta Post"
  }
  
  func refresh(refreshControl: UIRefreshControl) {
    instaViewModel?.loadInstaPosts()
    
    if self.refreshControl!.isRefreshing
    {
      self.refreshControl!.endRefreshing()
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
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
  
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat(0.5)
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return UIScreen.main.bounds.height
  }
  
  //  MARK: UICollectionViewDelegate & UICollectionViewDataSource Methods
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
    // push to page for post
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let InstaPostObj = instaViewModel!.posts[indexPath.row]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InstaImageCell", for: indexPath as IndexPath) as! InstaImageCell
    cell.load(InstaPost: InstaPostObj)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return instaViewModel!.posts.count
  }
  
  func collectionView(collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                             sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    var height : CGFloat = 100
    let width : CGFloat = UIScreen.main.bounds.width
    if (indexPath.row == 0) {
      height = 175
    }
    return CGSize(width:width, height:height)
  }
  
}
