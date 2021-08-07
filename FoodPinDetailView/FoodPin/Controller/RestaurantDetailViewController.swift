//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 21/10/2020.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  @IBOutlet var headerView: RestaurantDetailHeaderView!
  
  var restaurant: Restaurant = Restaurant()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = false
    
    headerView.nameLabel.text = restaurant.name
    headerView.typeLabel.text = restaurant.type
    headerView.headerImageView.image = UIImage(named: restaurant.image)
    
    let heartImage = restaurant.isFavorite ? "heart.fill" : "heart"
    
    headerView.heartButton.tintColor = restaurant.isFavorite ? .systemYellow : .white
    
    headerView.heartButton.setBackgroundImage(UIImage(systemName: heartImage), for: .normal)
  }
  
  
}
