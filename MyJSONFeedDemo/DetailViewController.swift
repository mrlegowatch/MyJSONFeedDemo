//
//  DetailViewController.swift
//  MyJSONFeedDemo
//
//  Created by Brian Arnold on 6/18/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeMap: MKMapView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    
    @IBOutlet weak var alertImage: UIImageView!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tsunamiImage: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    
    func updateDetails() {
        guard let detail = detailItem else {
            return
        }
        
        guard let label = titleLabel else {
            return
        }
        
        label.text = detail.properties.title
        placeLabel.text = detail.properties.place
        
        let magString = magnitudeString(from: detail.properties.mag, magType: detail.properties.magType)
        let point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: detail.geometry.latitude, longitude: detail.geometry.longitude)
        point.title = magString
        placeMap.addAnnotation(point)
        placeMap.centerCoordinate = point.coordinate
        
        dateLabel.text = dateString(from: detail.properties.time)
        timeLabel.text = timeString(from: detail.properties.time)
        alertImage.backgroundColor = alertColor(from: detail.properties.alert)
        magnitudeLabel.text = magString
        latitudeLabel.text = latitudeString(from: detail.geometry.latitude)
        longitudeLabel.text = longitudeString(from: detail.geometry.longitude)
        depthLabel.text = depthString(from: detail.geometry.depth)
        detailLabel.text = detail.properties.detail
        statusLabel.text = statusString(from: detail.properties.status)
        updatedLabel.text = dateTimeString(from: detail.properties.updated)
        tsunamiImage.text = tsunamiString(from: detail.properties.tsunami)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return MKPinAnnotationView(annotation: annotation, reuseIdentifier: "place")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeMap.delegate = self
        
        updateDetails()
    }

    var detailItem: USGSEarthquakeData.Feature? {
        didSet {
            updateDetails()
        }
    }


}

