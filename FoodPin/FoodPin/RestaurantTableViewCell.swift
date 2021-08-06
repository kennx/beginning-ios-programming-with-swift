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
  @IBOutlet var heartImageView: UIImageView! {
    didSet {
      heartImageView.isHidden = true
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    self.tintColor = .systemYellow
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
