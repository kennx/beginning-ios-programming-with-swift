//
//  MapViewController.swift
//  FoodPin
//
//  Created by 张剑 on 2021/8/11.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  @IBOutlet var mapView: MKMapView!
<<<<<<< HEAD
=======
  
>>>>>>> 9425ffe... update
  var restaurant: Restaurant = Restaurant()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.delegate = self
<<<<<<< HEAD
    
    mapView.showsScale = true
    mapView.showsTraffic = true
    mapView.showsCompass = true
    
    let geoCoder = CLGeocoder()
    
    geoCoder.geocodeAddressString(restaurant.location) { placemarks, error in
=======
    mapView.showsCompass = true
    mapView.showsScale = true
    mapView.showsTraffic = true
    
    let geoCoder = CLGeocoder()
    
    geoCoder.geocodeAddressString(restaurant.location) { (placemarks, error) in
>>>>>>> 9425ffe... update
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      if let placemarks = placemarks {
        let placemark = placemarks[0]
        
        let annotation = MKPointAnnotation()
        annotation.title = self.restaurant.name
        annotation.subtitle = self.restaurant.type
        
        if let location = placemark.location {
          annotation.coordinate = location.coordinate
          
          self.mapView.showAnnotations([annotation], animated: true)
          self.mapView.selectAnnotation(annotation, animated: true)
        }
      }
    }
    
    // Do any additional setup after loading the view.
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


extension MapViewController: MKMapViewDelegate {
<<<<<<< HEAD
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    let identifier = "MyMarker"
    
=======
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    let identifier = "MyMarker"
>>>>>>> 9425ffe... update
    if annotation.isKind(of: MKUserLocation.self) {
      return nil
    }
    
    var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
    
    if annotationView == nil {
      annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
    }
<<<<<<< HEAD
    
    annotationView?.glyphText = "😋"
    // annotationView?.glyphImage = UIImage(systemName: "arrowtriangle.down.circle")
    annotationView?.markerTintColor = UIColor.orange
    
    return annotationView
  }
  
=======
    annotationView?.glyphImage = UIImage(systemName: "arrowtriangle.down.circle")
    annotationView?.markerTintColor = UIColor.orange
    return annotationView
  }
>>>>>>> 9425ffe... update
}
