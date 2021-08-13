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
  
  
  @IBAction func close(segue: UIStoryboardSegue) {
    dismiss(animated: true, completion: nil)
  }
  
  var restaurant: Restaurant = Restaurant()
  
  override func viewDidLoad() {
    tableView.contentInsetAdjustmentBehavior = .never
    super.viewDidLoad()
    
    
    
    
    navigationController?.navigationBar.prefersLargeTitles = false
    
    // Configure header view
    headerView.nameLabel.text = restaurant.name
    headerView.typeLabel.text = restaurant.type
    headerView.headerImageView.image = UIImage(named: restaurant.image)
    
    let heartImage = restaurant.isFavorite ? "heart.fill" : "heart"
    headerView.heartButton.tintColor = restaurant.isFavorite ? .systemYellow : .white
    headerView.heartButton.setImage(UIImage(systemName: heartImage), for: .normal)
    
    // Configure the data source
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnSwipe = false
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
<<<<<<< HEAD
    switch segue.identifier {
    case "showMap":
      let destinationController = segue.destination as! MapViewController
      destinationController.restaurant = self.restaurant
    case "showReview":
      let destinationController = segue.destination as! ReviewViewController
      destinationController.restaurant = self.restaurant
    default:
      break
    }
  }
  
  @IBAction func rateRestaurant(segue: UIStoryboardSegue) {
    guard let identifier = segue.identifier else {
      return
    }
    
   
    dismiss(animated: true) {
      if let rating = Restaurant.Rating(rawValue: identifier) {
        self.restaurant.rating = rating
        self.headerView.ratingImageView.image = UIImage(named: rating.image)
      }
      
      let scaleTransform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
      self.headerView.ratingImageView.transform = scaleTransform
      self.headerView.ratingImageView.alpha = 0.0
      
      UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: []) {
        self.headerView.ratingImageView.transform = .identity
        self.headerView.ratingImageView.alpha = 1.0
      }
=======
    if segue.identifier == "showMap" {
      let destinationController = segue.destination as! MapViewController
      destinationController.restaurant = restaurant
>>>>>>> 9425ffe... update
    }
  }
  
  
}

extension RestaurantDetailViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
      
      cell.descriptionLabel.text = restaurant.description
      cell.selectionStyle = .none
<<<<<<< HEAD
=======
      
>>>>>>> 9425ffe... update
      return cell
      
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTwoColumnCell.self), for: indexPath) as! RestaurantDetailTwoColumnCell
      
      cell.column1TitleLabel.text = "Address"
      cell.column1TextLabel.text = restaurant.location
      cell.column2TitleLabel.text = "Phone"
      cell.column2TextLabel.text = restaurant.phone
      cell.selectionStyle = .none
<<<<<<< HEAD
=======
      
>>>>>>> 9425ffe... update
      return cell
      
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
<<<<<<< HEAD
      cell.configure(location: restaurant.location)
      cell.selectionStyle = .none
=======
      
      cell.configure(location: restaurant.location)
      cell.selectionStyle = .none
      
>>>>>>> 9425ffe... update
      return cell
      
    default:
      fatalError("Failed to instantiate the table view cell for detail view controller")
      
    }
  }
  
  
  
}
