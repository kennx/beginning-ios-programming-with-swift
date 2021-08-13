//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by 张剑 on 2021/8/12.
//

import UIKit

class ReviewViewController: UIViewController {
  
  @IBOutlet var backgroundImageView: UIImageView!
  
  @IBOutlet var rateButtons: [UIButton]!
  @IBOutlet var closeButton: UIButton!
  
  var restaurant: Restaurant = Restaurant()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    backgroundImageView.image = UIImage(named: restaurant.image)
    
    let blurEffect = UIBlurEffect(style: .dark)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = view.bounds
    backgroundImageView.addSubview(blurEffectView)
    // Do any additional setup after loading the view.
    
    let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
    let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
    let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
    
    let closeButtonTransform = CGAffineTransform.init(translationX: 0, y: -600)
    closeButton.transform = closeButtonTransform
    closeButton.alpha = 0.0
    
    for rateButton in rateButtons {
      rateButton.transform = moveScaleTransform
      rateButton.alpha = 0.0
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: []) {
      self.closeButton.alpha = 1.0
      self.closeButton.transform = .identity
    }
    var time = 0.1
    for rateButton in rateButtons {
      UIView.animate(withDuration: 0.4, delay: time, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: []) {
        rateButton.alpha = 1.0
        rateButton.transform = .identity
        time += 0.05
      }
    }
    
//    UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: []) {
//      self.rateButtons[0].alpha = 1.0
//      self.rateButtons[0].transform = .identity
//    }
//    UIView.animate(withDuration: 0.4, delay: 0.15,usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: []) {
//      self.rateButtons[1].alpha = 1.0
//      self.rateButtons[1].transform = .identity
//    }
//    UIView.animate(withDuration: 0.4, delay: 0.2,usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: []) {
//      self.rateButtons[2].alpha = 1.0
//      self.rateButtons[2].transform = .identity
//    }
//    UIView.animate(withDuration: 0.4, delay: 0.25,usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: []) {
//      self.rateButtons[3].alpha = 1.0
//      self.rateButtons[3].transform = .identity
//    }
//    UIView.animate(withDuration: 0.4, delay: 0.3,usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: []) {
//      self.rateButtons[4].alpha = 1.0
//      self.rateButtons[4].transform = .identity
//    }
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
