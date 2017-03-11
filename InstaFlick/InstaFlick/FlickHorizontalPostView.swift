
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
//  private var flickRefreshControl : UIRefreshControl? = nil
  
  @IBOutlet weak var collectionDogs: UICollectionView!
  @IBOutlet weak var collectionCats: UICollectionView!
  @IBOutlet weak var collectionMonkeys: UICollectionView!
  @IBOutlet weak var collectionElephants: UICollectionView!
  
  //  MARK: UIView Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup the ViewModel
    flickHorizontalViewModel = FlickHorizontalViewModel(viewController: self)
    flickHorizontalViewModel?.setup()
    
    // Setup the Nibs
    let FlickImagePostNib = UINib(nibName: "FlickImageCell", bundle: nil)
    
    // Setup the Tables
    collectionDogs.register(FlickImagePostNib, forCellWithReuseIdentifier: "FlickImageCell")
    collectionCats.register(FlickImagePostNib, forCellWithReuseIdentifier: "FlickImageCell")
    collectionMonkeys.register(FlickImagePostNib, forCellWithReuseIdentifier: "FlickImageCell")
    collectionElephants.register(FlickImagePostNib, forCellWithReuseIdentifier: "FlickImageCell")
    
    // Setup the Delegates
    collectionDogs.delegate = self
    collectionDogs.dataSource = self
    collectionCats.delegate = self
    collectionCats.dataSource = self
    collectionMonkeys.delegate = self
    collectionMonkeys.dataSource = self
    collectionElephants.delegate = self
    collectionElephants.dataSource = self
    
    // Setup the Title
    self.restorationIdentifier = "FlickHorizontalPost"
    
//    // refreshControl
//    flickRefreshControl = UIRefreshControl()
//    if #available(iOS 10.0, *) {
//      collectionFlick.refreshControl = flickRefreshControl
//    } else {
//      collectionFlick.addSubview(flickRefreshControl!)
//    }
//    self.refreshControl!.addTarget(self, action: #selector(FlickHorizontalPostView.refresh(refreshControl:)), for: UIControlEvents.valueChanged)
//    self.flickRefreshControl!.addTarget(self, action: #selector(FlickHorizontalPostView.refresh(refreshControl:)), for: UIControlEvents.valueChanged)
//    
//    flickHorizontalViewModel?.loadFlickPosts()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    tableView.contentInset.bottom = 40.0
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func refresh(refreshControl: UIRefreshControl) {
//    flickHorizontalViewModel?.refreshFlickPosts()
  }
  
//  func endRefreshing() {
//    _ = [self.refreshControl!, self.flickRefreshControl!].map( {
//      if $0.isRefreshing
//      {
//        collectionFlick.setContentOffset(CGPoint(x: 0,y :0), animated: true)
//        $0.endRefreshing()
//      }
//    })
//  }
  
  /**
   reload
   */
  func reload() {
    //    self.endRefreshing()
    collectionDogs.reloadData()
    collectionCats.reloadData()
    collectionMonkeys.reloadData()
    collectionElephants.reloadData()
    tableView.reloadData()
  }
  
  //  MARK: UITableViewDelegate & UITableViewDataSource Methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
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
    switch collectionView.tag {
    case 0: // Dogs
      let flickPostObj = flickHorizontalViewModel!.dogPosts[indexPath.row]
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlickImageCell", for: indexPath as IndexPath) as! FlickImageCell
      cell.load(flickPost: flickPostObj)
      return cell
    case 1: // Cats
      let flickPostObj = flickHorizontalViewModel!.catPosts[indexPath.row]
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlickImageCell", for: indexPath as IndexPath) as! FlickImageCell
      cell.load(flickPost: flickPostObj)
      return cell
    case 2: // Monkeys
      let flickPostObj = flickHorizontalViewModel!.monkeyPosts[indexPath.row]
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlickImageCell", for: indexPath as IndexPath) as! FlickImageCell
      cell.load(flickPost: flickPostObj)
      return cell
    case 3: // Elephants
      let flickPostObj = flickHorizontalViewModel!.elephantPosts[indexPath.row]
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlickImageCell", for: indexPath as IndexPath) as! FlickImageCell
      cell.load(flickPost: flickPostObj)
      return cell
    default:
      let cell = UICollectionViewCell(frame: CGRect.zero)
      return cell
    }
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
    default:
      return 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    var height : CGFloat = 0.0
    var width : CGFloat = 0.0
    switch collectionView.tag {
    case 0: // Recommended
      width =  self.view.frame.width / 3.5 - 3
      height = width + self.view.frame.width / 3.5 / 2
    case 1: // Recent
      width =  self.view.frame.width / 3.5 - 3
      height = width + self.view.frame.width / 3.5 / 2
    case 2: // Mood
      width =  self.view.frame.width / 3.5 - 3
      height = width + self.view.frame.width / 3.5 / 2
    case 3: // Albums
      width =  self.view.frame.width / 3.5 - 3
      height = width + self.view.frame.width / 3.5 / 2
    case 4: // Genre
      width = (self.view.frame.width / 3) - 8
      height = width
    default:
      width = 0.0
      height = 0.0
    }
    return CGSize(width: width, height: height)
  }
  
  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
  }
  
}
