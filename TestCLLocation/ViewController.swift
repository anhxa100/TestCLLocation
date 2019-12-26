//
//  ViewController.swift
//  TestCLLocation
//
//  Created by Hoang Nguyen on 12/25/19.
//  Copyright © 2019 Hoang Nguyen. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var latTF: UILabel!
    @IBOutlet weak var longTF: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }
    
    
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            print("locations = \(locValue.latitude) \(locValue.longitude)")
            longTF.text = "Longitude: \(locValue.longitude)"
            latTF.text = "Latitude: \(locValue.latitude)"
        }
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .authorizedAlways {
                // you're good to go!
                guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
                print("locations = \(locValue.latitude) \(locValue.longitude)")
                longTF.text = "Longitude1: \(locValue.longitude)"
                latTF.text = "Latitude1: \(locValue.latitude)"
            }
        }
    }

