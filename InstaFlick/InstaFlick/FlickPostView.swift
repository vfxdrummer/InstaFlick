
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

class FlickPostView: UITableViewController, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
  private var flickViewModel : FlickViewModel? = nil
  private var flickRefreshControl : UIRefreshControl? = nil
  
  @IBOutlet weak var collectionFlick: UICollectionView!
  @IBOutlet weak var searchTextField: UITextField!
  
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
    searchTextField.delegate = self
    collectionFlick.delegate = self
    collectionFlick.dataSource = self
    
    // Setup the Title
    self.restorationIdentifier = "FlickPost"
    
    // refreshControl
    flickRefreshControl = UIRefreshControl()
    if #available(iOS 10.0, *) {
      collectionFlick.refreshControl = flickRefreshControl
    } else {
      collectionFlick.addSubview(flickRefreshControl!)
    }
    self.refreshControl!.addTarget(self, action: #selector(FlickPostView.refresh(refreshControl:)), for: UIControlEvents.valueChanged)
    self.flickRefreshControl!.addTarget(self, action: #selector(FlickPostView.refresh(refreshControl:)), for: UIControlEvents.valueChanged)
    
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
    flickViewModel?.refreshFlickPosts()
  }
  
  func endRefreshing() {
    _ = [self.refreshControl!, self.flickRefreshControl!].map( {
      if $0.isRefreshing
      {
        collectionFlick.setContentOffset(CGPoint(x: 0,y :0), animated: true)
        $0.endRefreshing()
      }
    })
  }
  
  /**
   reload
   */
  func reload() {
    self.endRefreshing()
    tableView.reloadData()
    collectionFlick.reloadData()
  }
  
  /**
   reloadCollection
   */
  func reloadCollection() {
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
      return 50
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
    let height : CGFloat = UIScreen.main.bounds.width / 2.0
    let width : CGFloat = UIScreen.main.bounds.width / 2.0
    return CGSize(width:width, height:height)
  }
  
  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    let diff = collectionFlick.contentSize.height - collectionFlick.contentOffset.y
    if (diff < (6.0 * UIScreen.main.bounds.height)) {
      flickViewModel!.loadNextPage()
    }
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    flickViewModel!.changeSearchTerm(searchTerm: textField.text!)
    return true
  }
  
}
