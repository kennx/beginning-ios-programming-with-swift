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
  var restaurant: Restaurant = Restaurant()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.delegate = self
    
    mapView.showsScale = true
    mapView.showsTraffic = true
    mapView.showsCompass = true
    
    let geoCoder = CLGeocoder()
    
    geoCoder.geocodeAddressString(restaurant.location) { placemarks, error in
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
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    let identifier = "MyMarker"
    
    if annotation.isKind(of: MKUserLocation.self) {
      return nil
    }
    
    var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
    
    if annotationView == nil {
      annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
    }
    
    annotationView?.glyphText = "😋"
    // annotationView?.glyphImage = UIImage(systemName: "arrowtriangle.down.circle")
    annotationView?.markerTintColor = UIColor.orange
    
    return annotationView
  }
  
}
