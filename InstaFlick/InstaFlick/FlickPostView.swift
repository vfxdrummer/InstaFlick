
//
//  FlickPostView.swift
//  Earbits Radio
//
//  Created by Timothy Brandt on 3/1/17.
//  Copyright © 2016 Earbits. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class FlickPostView: UITableViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
  private var flickViewModel : FlickViewModel? = nil
  
  @IBOutlet weak var collectionFlick: UICollectionView!
  
  //  MARK: UIView Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup the ViewModel
    flickViewModel = FlickViewModel(viewController: self)
    flickViewModel?.setup()
    
    // Setup the Nibs
    let FlickImagePostNib = UINib(nibName: "FlickImageCell", bundle: nil)
    
    // Setup the Collection
    collectionFlick.register(FlickImagePostNib, forCellWithReuseIdentifier: "FlickImageCell")
    
    // Setup the Delegates
    collectionFlick.delegate = self
    collectionFlick.dataSource = self
//    if #available(iOS 10.0, *) {
//      collectionFlick.refreshControl = self.refreshControl!
//    } else {
//      collectionFlick.addSubview(self.refreshControl!)
//    }
    
    // Setup the Title
    self.restorationIdentifier = "FlickPost"
    
    self.refreshControl!.addTarget(self, action: #selector(FlickPostView.refresh(refreshControl:)), for: UIControlEvents.valueChanged)
    
    flickViewModel?.loadFlickPosts()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    // Setup the Title
    self.tabBarController?.title = Constants.flickTitle.rawValue
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func refresh(refreshControl: UIRefreshControl) {
    flickViewModel?.loadFlickPosts()
    
//    if #available(iOS 10.0, *) {
//      if collectionFlick.refreshControl!.isRefreshing
//      {
//        collectionFlick.refreshControl?.endRefreshing()
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
    collectionFlick.reloadData()
  }
  
  //  MARK: UITableViewDelegate & UITableViewDataSource Methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  override func tableView(_ tableView: UITableView,
                          heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat(0.5)
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch (indexPath.row) {
    case 0:
      return 100
    default:
      return UIScreen.main.bounds.height - 100
    }
  }

  
  //  MARK: UICollectionViewDelegate & UICollectionViewDataSource Methods
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let flickPostObj = flickViewModel!.posts[indexPath.row]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlickImageCell", for: indexPath as IndexPath) as! FlickImageCell
    cell.load(flickPost: flickPostObj)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return flickViewModel!.posts.count
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let FlickPostObj = flickViewModel!.posts[indexPath.row]
//    let ratio = FlickPostObj.image_standard_resolution?.ratio
    let height : CGFloat = UIScreen.main.bounds.width
    let width : CGFloat = UIScreen.main.bounds.width
    return CGSize(width:width, height:height)
  }
  
  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    let yOffset = collectionFlick.contentOffset.y / CGFloat(flickViewModel!.page)
    let height = collectionFlick.contentSize.height / CGFloat(flickViewModel!.page)
    let scrolledPercentage = yOffset / height
    print("!!!!!!!!!!!!!!!!!!!!!! \(scrolledPercentage) \(flickViewModel!.page) \(yOffset) \(height)")
    if (scrolledPercentage > 0.6) {
      flickViewModel!.loadNextPage()
    }
  }
  
}
