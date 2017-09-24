//
//  Annotation.swift
//  pyghack-mapkit-test
//
//  Created by Rishi Masand on 9/24/17.
//  Copyright © 2017 Rishi Masand. All rights reserved.
//

import MapKit

class Annotation: NSObject, MKAnnotation {
    var url: NSURL = NSURL()
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D, subtitle: String) {
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
    }
}
