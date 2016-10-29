//
//  MapVC.swift
//  YYZRide
//
//  Created by Yevhen Kim on 2016-10-29.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import Foundation


class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        loadMarker()
        
    }
    
    func loadMarker() {
        let marker1 = GMSMarker()
        
        marker1.position = CLLocationCoordinate2DMake(43.6532, -79.3832)
        marker1.title = "Toronto"
        marker1.icon = UIImage(named: "Icon-20")
        marker1.snippet = "Canada"
        marker1.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2DMake(43.7448, -79.3409)
        marker2.icon = UIImage(named: "Icon-20")
        marker2.title = "Don Mills"
        marker2.snippet = "PofC: 104.64%, CO2: 1597.91"
        marker2.map = mapView
        
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2DMake(43.6604, -79.3729)
        marker3.icon = UIImage(named: "Icon-20")
        marker3.title = "Downtowner"
        marker3.snippet = "PofC: 69.21%, CO2: 1052.63"
        marker3.map = mapView
        
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2DMake(43.7505, -79.2703)
        marker4.icon = UIImage(named: "Icon-20")
        marker4.title = "Lawrence East"
        marker4.snippet = "PofC: 72.50%, CO2: 454.02"
        marker4.map = mapView
        
        let marker5 = GMSMarker()
        marker5.position = CLLocationCoordinate2DMake(43.6555, -79.4598)
        marker5.icon = UIImage(named: "Icon-20")
        marker5.title = "Keele"
        marker5.snippet = "PofC: 75.50%, CO2: 15098.98"
        marker5.map = mapView
        
        let marker6 = GMSMarker()
        marker6.position = CLLocationCoordinate2DMake(43.6555, -79.3856)
        marker6.icon = UIImage(named: "Icon-20")
        marker6.title = "Dundas"
        marker6.snippet = "PofC: 16.68%, CO2: 2148.99"
        marker6.map = mapView
        
        let marker7 = GMSMarker()
        marker7.position = CLLocationCoordinate2DMake(43.6664, -79.4112)
        marker7.icon = UIImage(named: "Icon-20")
        marker7.title = "Bathurst"
        marker7.snippet = "PofC: 59.22%, CO2: 17624.54"
        marker7.map = mapView
        
        let marker8 = GMSMarker()
        marker8.position = CLLocationCoordinate2DMake(43.3944, -79.2536)
        marker8.icon = UIImage(named: "Icon-20")
        marker8.title = "Ossington"
        marker8.snippet = "PofC: 42.85%, CO2: 2257.00"
        marker8.map = mapView
        
        let marker9 = GMSMarker()
        marker9.position = CLLocationCoordinate2DMake(43.3857, -79.2240)
        marker9.icon = UIImage(named: "Icon-20")
        marker9.title = "KING"
        marker9.snippet = "PofC: 29.23%, CO2: 5145.69"
        marker9.map = mapView
        
        let marker10 = GMSMarker()
        marker10.position = CLLocationCoordinate2DMake(43.6487, -79.3965)
        marker10.icon = UIImage(named: "Icon-20")
        marker10.title = "Spadina"
        marker10.snippet = "PofC: 17.27%, CO2: 873.15"
        marker10.map = mapView
        
        let marker11 = GMSMarker()
        marker11.position = CLLocationCoordinate2DMake(43.3936, -79.2608)
        marker11.icon = UIImage(named: "Icon-20")
        marker11.title = "Dufferin"
        marker11.snippet = "PofC:61.50%, CO2: 464.10"
        marker11.map = mapView
        
        let marker12 = GMSMarker()
        marker12.position = CLLocationCoordinate2DMake(43.3933, -79.2634)
        marker12.icon = UIImage(named: "Icon-20")
        marker12.title = "Lansdowne"
        marker12.snippet = "PofC: 39.13%, CO2: 1355.84"
        marker12.map = mapView
    }
}

extension MapVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
            mapView.isMyLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
    }
}

