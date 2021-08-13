//
//  NewRestaurantController.swift
//  FoodPin
//
//  Created by 张剑 on 2021/8/13.
//

import UIKit

class NewRestaurantController: UITableViewController {
  
  @IBOutlet var nameTextField: RoundedBorderTextField! {
    didSet {
      self.nameTextField.tag = 1
      self.nameTextField.becomeFirstResponder()
      self.nameTextField.delegate = self
    }
  }
  
  @IBOutlet var typeTextField: RoundedBorderTextField! {
    didSet {
      self.typeTextField.tag = 2
      self.typeTextField.delegate = self
    }
  }
  
  @IBOutlet var addressTextField: RoundedBorderTextField! {
    didSet {
      self.addressTextField.tag = 3
      self.addressTextField.delegate = self
    }
  }
  
  @IBOutlet var phoneTextField: RoundedBorderTextField! {
    didSet {
      self.phoneTextField.tag = 4
      self.addressTextField.delegate = self
    }
  }
  
  @IBOutlet var descriptionTextView: UITextView! {
    didSet {
      self.descriptionTextView.tag = 5
      self.descriptionTextView.layer.cornerRadius = 10.0
      self.descriptionTextView.layer.masksToBounds = true
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let appearance = navigationController?.navigationBar.standardAppearance {
      if let customFont = UIFont(name: "Nunito-Bold", size: 40.0) {
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!, .font: customFont]
      }
      navigationController?.navigationBar.standardAppearance = appearance
      navigationController?.navigationBar.compactAppearance = appearance
      navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
  }
  
}


extension NewRestaurantController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if let nextTextField = view.viewWithTag(textField.tag + 1) {
      textField.resignFirstResponder()
      nextTextField.becomeFirstResponder()
    }
    return true
  }
}
