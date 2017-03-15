
//
//  FlickHorizontalPostView.swift
//  InstaFlick
//
//  Created by Timothy Brandt on 3/1/17.
//  Copyright © 2017 BrandtApps. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class FlickHorizontalPostView: UITableViewController, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
  private var flickHorizontalViewModel : FlickHorizontalViewModel? = nil
  private var collections : [UICollectionView] = []
  private var animCount : Int = 0
  
  @IBOutlet weak var collectionDogs: UICollectionView!
  @IBOutlet weak var collectionCats: UICollectionView!
  @IBOutlet weak var collectionMonkeys: UICollectionView!
  @IBOutlet weak var collectionElephants: UICollectionView!
  @IBOutlet weak var collectionLions: UICollectionView!
  @IBOutlet weak var collectionTigers: UICollectionView!
  @IBOutlet weak var collectionBears: UICollectionView!
  @IBOutlet weak var collectionOhMy: UICollectionView!
  
  //  MARK: UIView Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup the ViewModel
    flickHorizontalViewModel = FlickHorizontalViewModel(viewController: self)
    flickHorizontalViewModel?.setup()
    
    // Setup the Nibs
    let FlickImagePostNib = UINib(nibName: "FlickImageCell", bundle: nil)
    
    self.collections = [collectionDogs, collectionCats, collectionMonkeys, collectionElephants, collectionLions, collectionTigers, collectionBears, collectionOhMy]
    
    // Setup the Nibs & Delegates
    _ = self.collections.map({
      $0.register(FlickImagePostNib, forCellWithReuseIdentifier: "FlickImageCell")
      $0.delegate = self
      $0.dataSource = self
    })
    
    // Setup the Title
    self.restorationIdentifier = "FlickHorizontalPost"
    
    // refreshControl
    self.refreshControl!.addTarget(self, action: #selector(FlickHorizontalPostView.refresh(refreshControl:)), for: UIControlEvents.valueChanged)
    
    flickHorizontalViewModel?.loadFlickPosts()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    // Setup the Title
    self.tabBarController?.title = Constants.flickHorizontalTitle
    tableView.contentInset.bottom = 40.0
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func refresh(refreshControl: UIRefreshControl) {
    flickHorizontalViewModel?.refreshFlickPosts()
  }
  
  func endRefreshing() {
    if self.refreshControl?.isRefreshing == true {
      self.refreshControl?.endRefreshing()
    }
  }
  
  /**
   reload
   */
  func reload() {
    self.endRefreshing()
    _ = self.collections.map({
      $0.reloadData()
    })
    tableView.reloadData()
  }
  
  //  MARK: UITableViewDelegate & UITableViewDataSource Methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 8
  }
  
  override func tableView(_ tableView: UITableView,
                          heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat(0.5)
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let width =  self.view.frame.width / 3.5 - 3
    let height = width + self.view.frame.width / 3.5 / 2
    return height + 50
  }

  
  //  MARK: UICollectionViewDelegate & UICollectionViewDataSource Methods
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // grab cell
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlickImageCell", for: indexPath as IndexPath) as! FlickImageCell
    
    let flickPostObj:FlickPost
    switch collectionView.tag {
    case 0: // Dogs
      flickPostObj = flickHorizontalViewModel!.dogPosts[indexPath.row]
    case 1: // Cats
      flickPostObj = flickHorizontalViewModel!.catPosts[indexPath.row]
    case 2: // Monkeys
      flickPostObj = flickHorizontalViewModel!.monkeyPosts[indexPath.row]
    case 3: // Elephants
      flickPostObj = flickHorizontalViewModel!.elephantPosts[indexPath.row]
    case 4: // Lions
      flickPostObj = flickHorizontalViewModel!.lionPosts[indexPath.row]
    case 5: // Tigers
      flickPostObj = flickHorizontalViewModel!.tigerPosts[indexPath.row]
    case 6: // Bears
      flickPostObj = flickHorizontalViewModel!.bearPosts[indexPath.row]
    case 7: // OhMy
      flickPostObj = flickHorizontalViewModel!.ohmyPosts[indexPath.row]
    default:
      flickPostObj = FlickPost()
      
    }
    cell.load(flickPost: flickPostObj)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch collectionView.tag {
    case 0: // Dogs
      return flickHorizontalViewModel!.dogPosts.count
    case 1: // Cats
      return flickHorizontalViewModel!.catPosts.count
    case 2: // Monkeys
      return flickHorizontalViewModel!.monkeyPosts.count
    case 3: // Elephants
      return flickHorizontalViewModel!.elephantPosts.count
    case 4: // Lions
      return flickHorizontalViewModel!.lionPosts.count
    case 5: // Tigers
      return flickHorizontalViewModel!.tigerPosts.count
    case 6: // Bears
      return flickHorizontalViewModel!.bearPosts.count
    case 7: // OhMy
      return flickHorizontalViewModel!.ohmyPosts.count
    default:
      return 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width : CGFloat = self.view.frame.width / 3.5 - 3
    let height : CGFloat = width + self.view.frame.width / 3.5 / 2
    return CGSize(width: width, height: height)
  }
  
  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
  }
  
  //  MARK: UIScrollViewDelegate Methods
  
  override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    animCount = 0
    self.view!.fireworks()
  }
  
  override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if (animCount > 1) { return }
    self.view!.fireworks()
    animCount += 1
  }
  
}
