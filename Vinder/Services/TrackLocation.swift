//
//  TrackLocation.swift
//  Vinder
//
//  Created by Patrick Fischer on 04.11.19.
//  Copyright © 2019 Patrick Fischer. All rights reserved.
//

import Foundation
import CoreLocation


///
///Add key: Privacy - Location When in Use Usage Description to Info.plist
///
class TrackLocation: NSObject {
    let locationManager = CLLocationManager()
    var newLocation: ((CLLocation)->())?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
     func askForPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startTrackingLocation() {
        locationManager.distanceFilter = 500
        locationManager.startMonitoringSignificantLocationChanges()

    }
    
    

}

extension TrackLocation: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        if let location = manager.location {
            
            newLocation?(location)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        newLocation?(locations.last!)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
