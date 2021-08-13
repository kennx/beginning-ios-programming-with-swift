//
//  RestaurantDetailSeparatorCell.swift
//  FoodPin
//
//  Created by 张剑 on 2021/8/11.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
  
  @IBOutlet var mapView: MKMapView! {
    didSet {
<<<<<<< HEAD
      mapView.clipsToBounds = true
      mapView.layer.cornerRadius = 20
=======
      self.mapView.layer.cornerRadius = 20
>>>>>>> 9425ffe... update
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
  
  func configure(location: String) {
    let geoCoder = CLGeocoder()
<<<<<<< HEAD
    geoCoder.geocodeAddressString(location) { placemarks, error in
=======
    print(location)
    geoCoder.geocodeAddressString(location) { (placemarks, error) in
>>>>>>> 9425ffe... update
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      if let placemarks = placemarks {
        let placemark = placemarks[0]
<<<<<<< HEAD
        
        let annotation = MKPointAnnotation()
        
        if let location = placemark.location {
=======
        let annotation = MKPointAnnotation()
        
        if let location  = placemark.location {
>>>>>>> 9425ffe... update
          annotation.coordinate = location.coordinate
          self.mapView.addAnnotation(annotation)
          
          let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
<<<<<<< HEAD
=======
          
>>>>>>> 9425ffe... update
          self.mapView.setRegion(region, animated: false)
        }
      }
    }
  }
  
}
