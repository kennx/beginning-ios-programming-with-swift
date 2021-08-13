//
//  NewRestaurantController.swift
//  FoodPin
//
//  Created by 张剑 on 2021/8/13.
//

import UIKit

class NewRestaurantController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  
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
  
  @IBOutlet var photoImageView: UIImageView! {
    didSet {
      self.photoImageView.layer.cornerRadius = 10.0
      self.photoImageView.layer.masksToBounds = true
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
    
    let margins = photoImageView.superview!.layoutMarginsGuide
    
    photoImageView.translatesAutoresizingMaskIntoConstraints = false
    
    photoImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    photoImageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    photoImageView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
    photoImageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    
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
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      let photoSourceRequestController = UIAlertController(title: "", message: "Choose your phooto source", preferredStyle: .actionSheet)
      
      let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
          let imagePicker = UIImagePickerController()
          imagePicker.allowsEditing = false
          imagePicker.sourceType = .camera
          imagePicker.delegate = self
          self.present(imagePicker, animated: true, completion: nil)
        }
      }
      
      let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
          let imagePicker = UIImagePickerController()
          imagePicker.allowsEditing = false
          imagePicker.sourceType = .photoLibrary
          imagePicker.delegate = self
          self.present(imagePicker, animated: true, completion: nil)
        }
      }
      
      
      photoSourceRequestController.addAction(cameraAction)
      photoSourceRequestController.addAction(photoLibraryAction)
      
      if let popoverController = photoSourceRequestController.popoverPresentationController {
        if let cell = tableView.cellForRow(at: indexPath) {
          popoverController.sourceView = cell
          popoverController.sourceRect = cell.bounds
        }
      }
      
      present(photoSourceRequestController, animated: true, completion: nil)
    }
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      self.photoImageView.image = selectedImage
      self.photoImageView.contentMode = .scaleAspectFill
      self.photoImageView.clipsToBounds = true
    }
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func saveRestaurant(sender: UIBarButtonItem) {
    if let nameText = nameTextField.text, let typeText = typeTextField.text, let addressText = addressTextField.text, let phoneText = phoneTextField.text, let descriptionText = descriptionTextView.text {
      let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
      let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alertController.addAction(alertAction)
      if nameText.isEmpty || typeText.isEmpty || addressText.isEmpty || phoneText.isEmpty || descriptionText.isEmpty {
        self.present(alertController, animated: true, completion: nil)
      } else {
        print("Name: \(nameText)")
        print("Type: \(typeText)")
        print("Location: \(addressText)")
        print("Phone: \(phoneText)")
        print("Description: \(descriptionText)")
        dismiss(animated: true, completion: nil)
      }
      
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
