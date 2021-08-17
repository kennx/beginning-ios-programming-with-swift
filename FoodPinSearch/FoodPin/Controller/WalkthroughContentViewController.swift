//
//  WalkthroughContentViewController.swift
//  FoodPin
//
//  Created by 张剑 on 2021/8/17.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
  
  @IBOutlet var headingLabel: UILabel! {
    didSet {
      headingLabel.numberOfLines = 0
    }
  }
  
  @IBOutlet var subHeadingLabel: UILabel! {
    didSet {
      subHeadingLabel.numberOfLines = 0
    }
  }
  
  @IBOutlet var contentImageView: UIImageView!
  
  var index = 0
  var heading = ""
  var subHeading = ""
  var imageFile = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    headingLabel.text = heading
    subHeadingLabel.text = subHeading
    contentImageView.image = UIImage(named: imageFile)
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
