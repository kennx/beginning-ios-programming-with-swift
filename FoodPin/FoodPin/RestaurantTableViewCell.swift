//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by 张剑 on 2021/8/6.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
  
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var locationLabel: UILabel!
  @IBOutlet var typeLabel: UILabel!
  @IBOutlet var thumbnailImageView: UIImageView! {
    didSet {
      thumbnailImageView.layer.cornerRadius = 20.0
      thumbnailImageView.clipsToBounds = true
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
