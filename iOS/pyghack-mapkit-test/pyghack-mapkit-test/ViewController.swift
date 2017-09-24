//
//  ViewController.swift
//  pyghack-mapkit-test
//
//  Created by Rishi Masand on 9/24/17.
//  Copyright © 2017 Rishi Masand. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var stateSwitch: UISwitch!
    @IBOutlet weak var iDeliveredButton: UIButton!
    
    var sheltersJSON = JSON()
    var restaurantsJSON = JSON()
    
    func convertToDictionary(text: String) -> [String: Any]? {
        
        if let data = text.data(using: .utf8) {
            
            do {
                
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                
            } catch {
                
                print(error.localizedDescription)
                
            }
            
        }
        
        return nil
        
    }
    
    @objc func switchChanged(mySwitch: UISwitch) {
        
        if (mySwitch.isOn) {
            // change to shelters
            mapView.removeAnnotations(mapView.annotations)
                        
            for i in 0...(sheltersJSON.count-1) {
                            
                print(sheltersJSON[i]["name"].string!)
                print(sheltersJSON[i]["latitude"].double!)
                print(sheltersJSON[i]["longitude"].double!)
                print("\n")
                            
                let theAnnotation = Annotation(title: sheltersJSON[i]["name"].string!, coordinate: CLLocation(latitude: sheltersJSON[i]["latitude"].double!, longitude: sheltersJSON[i]["longitude"].double!).coordinate, subtitle: "")
                            
                DispatchQueue.main.async {
                    
                    self.mapView.addAnnotation(theAnnotation)
                                
                    let span = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
                    let region = MKCoordinateRegion(center: CLLocation(latitude: self.sheltersJSON[i]["latitude"].double!, longitude: self.sheltersJSON[i]["longitude"].double!).coordinate, span: span)
                    
                    self.mapView.setRegion(region, animated: true)
                    
                }
                            
            }
    
        }
        else {
            // change to restaurants
            mapView.removeAnnotations(mapView.annotations)
            
            for i in 0...(restaurantsJSON.count-1) {
                
                print(restaurantsJSON[i]["name"].string!)
                print(restaurantsJSON[i]["latitude"].double!)
                print(restaurantsJSON[i]["longitude"].double!)
                print("\n")
                
                let date = NSDate(timeIntervalSince1970: TimeInterval(restaurantsJSON[i]["close"].int!))
                
                let calendar = Calendar.current
                let hour = calendar.component(.hour, from: date as Date)
                let minutes = calendar.component(.minute, from: date as Date)
                
                var minutesString = "\(minutes)"
                
                if (minutesString.characters.count < 2) {
                    minutesString += "0"
                }
                
                var amPM = "AM"
                
                if (hour > 12) {
                    amPM = "PM"
                }
                
                let theAnnotation = Annotation(title: restaurantsJSON[i]["name"].string!, coordinate: CLLocation(latitude: restaurantsJSON[i]["latitude"].double!, longitude: restaurantsJSON[i]["longitude"].double!).coordinate, subtitle: "Closes: \(hour % 12):\(minutesString) \(amPM)")
                
                DispatchQueue.main.async {
                    
                    self.mapView.addAnnotation(theAnnotation)
                    
                    let span = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
                    let region = MKCoordinateRegion(center: CLLocation(latitude: self.restaurantsJSON[i]["latitude"].double!, longitude: self.restaurantsJSON[i]["longitude"].double!).coordinate, span: span)
                    
                    self.mapView.setRegion(region, animated: true)
                    
                }
                
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        
        iDeliveredButton.layer.cornerRadius = 5
        
        stateSwitch.onTintColor = UIColor(red:0.62, green:0.34, blue:0.27, alpha:1.0)
        
    }
    
    override func viewDidLoad() {
        
        stateSwitch.addTarget(self, action: #selector(ViewController.switchChanged(mySwitch:)), for: UIControlEvents.valueChanged)
        
        let url = URL(string: "http://6a72124a.ngrok.io/getplaces")
        
        var rj = ""
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            rj = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
            
            if let dataFromString = rj.data(using: .utf8, allowLossyConversion: false) {
                
                do {
                    
                    self.restaurantsJSON = try JSON(data: dataFromString)
                    
                    let url1 = URL(string: "http://6a72124a.ngrok.io/getshelters")
                    
                    var rj1 = ""
                    
                    let task1 = URLSession.shared.dataTask(with: url1!) {(data1, response1, error1) in
                        
                        rj1 = NSString(data: data1!, encoding: String.Encoding.utf8.rawValue)! as String
                        
                        if let dataFromString = rj1.data(using: .utf8, allowLossyConversion: false) {
                            
                            do {
                                
                                self.sheltersJSON = try JSON(data: dataFromString)
                                
                            }
                            catch {
                                
                            }
                            
                        }
                        
                    }
                        
                    task1.resume()
                    
                    self.mapView.removeAnnotations(self.mapView.annotations)
                    
                    for i in 0...(self.restaurantsJSON.count-1) {
                        
                        print(self.restaurantsJSON[i]["name"].string!)
                        print(self.restaurantsJSON[i]["latitude"].double!)
                        print(self.restaurantsJSON[i]["longitude"].double!)
                        print("\n")
                        
                        let date = NSDate(timeIntervalSince1970: TimeInterval(self.restaurantsJSON[i]["close"].int!))
                        
                        let calendar = Calendar.current
                        let hour = calendar.component(.hour, from: date as Date)
                        let minutes = calendar.component(.minute, from: date as Date)
                        
                        var minutesString = "\(minutes)"
                        
                        if (minutesString.characters.count < 2) {
                            minutesString += "0"
                        }
                        
                        var amPM = "AM"
                        
                        if (hour > 12) {
                            amPM = "PM"
                        }
                        
                        let theAnnotation = Annotation(title: self.restaurantsJSON[i]["name"].string!, coordinate: CLLocation(latitude: self.restaurantsJSON[i]["latitude"].double!, longitude: self.restaurantsJSON[i]["longitude"].double!).coordinate, subtitle: "Closes: \(hour % 12):\(minutesString) \(amPM)")
                        
                        DispatchQueue.main.async {
                            
                            self.mapView.addAnnotation(theAnnotation)
                            
                            let span = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
                            let region = MKCoordinateRegion(center: CLLocation(latitude: self.restaurantsJSON[i]["latitude"].double!, longitude: self.restaurantsJSON[i]["longitude"].double!).coordinate, span: span)
                            
                            self.mapView.setRegion(region, animated: true)
                            
                        }
                        
                    }
                    
                }
                catch {
                    
                }
                
            }
        }
        
        task.resume()
        
    }
    
    @IBAction func iDeliveredTapped(_ sender: Any) {
        
        let parameters = ["name": "Brian"] as [String: String]
        
        //create the url with NSURL
        let url = NSURL(string: "http://6a72124a.ngrok.io/addpoints")
        
        //create the session object
        let session = URLSession.shared
        
        //now create the NSMutableRequest object using the url object
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject] {
                    print(json)
                    // handle json...
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
            
        })
        
        task.resume()
        
    }
    
}

