//
//  MKMapViewController.swift
//  BarDoZe
//
//  Created by Jonathan on 17/02/20.
//  Copyright © 2020 hbsis. All rights reserved.
//

import MapKit

class MKMapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // (1
        let location = CLLocationCoordinate2D(latitude: 51.5007773, longitude: -0.124602)
        
        
        // (2
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        
        
        // (3
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Hitler"
        annotation.subtitle = "Judeus"
        mapView.addAnnotation(annotation)
        
        



    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
