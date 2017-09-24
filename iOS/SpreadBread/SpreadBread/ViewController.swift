//
//  ViewController.swift
//  SpreadBread
//
//  Created by Rohin Bhasin on 9/24/17.
//  Copyright © 2017 Rohin Bhasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var restaurantsJSON = JSON()

    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var firstLabel : UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel!
    @IBOutlet weak var seventhLabel: UILabel!
    @IBOutlet weak var eighthlabel: UILabel!
    @IBOutlet weak var ninthLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        self.firstLabel.alpha = 0
//        self.secondLabel.alpha = 0
//        self.thirdLabel.alpha = 0
//        self.fourthLabel.alpha = 0
//        self.fifthLabel.alpha = 0
//        self.sixthLabel.alpha = 0
//        self.seventhLabel.alpha = 0
//        self.eighthlabel.alpha = 0
//        self.ninthLabel.alpha = 0
        
        let url = URL(string: "http://6a72124a.ngrok.io/getplaces")
        
        var rj = ""
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            rj = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
            
            if let dataFromString = rj.data(using: .utf8, allowLossyConversion: false) {
                
                do {
                    self.restaurantsJSON = try JSON(data: dataFromString)
                    DispatchQueue.main.async {
                        
                        var date = NSDate(timeIntervalSince1970: TimeInterval(self.restaurantsJSON[0]["close"].int!))
                        
                        var calendar = Calendar.current
                        var hour = calendar.component(.hour, from: date as Date)
                        var minutes = calendar.component(.minute, from: date as Date)
                        
                        var minutesString = "\(minutes)"
                        
                        if (minutesString.characters.count < 2) {
                            minutesString += "0"
                        }
                        
                        var amPM = "AM"
                        
                        if (hour > 12) {
                            amPM = "PM"
                        }

                        self.firstLabel.text = "\(self.restaurantsJSON[0]["name"]) , Closes: \(hour % 12):\(minutesString) \(amPM)"
                        
                        date = NSDate(timeIntervalSince1970: TimeInterval(self.restaurantsJSON[1]["close"].int!))
                        
                        calendar = Calendar.current
                        hour = calendar.component(.hour, from: date as Date)
                        minutes = calendar.component(.minute, from: date as Date)
                        
                        minutesString = "\(minutes)"
                        
                        if (minutesString.characters.count < 2) {
                            minutesString += "0"
                        }
                        
                        amPM = "AM"
                        
                        if (hour > 12) {
                            amPM = "PM"
                        }
                        
                        self.secondLabel.text = "\(self.restaurantsJSON[1]["name"]) , Closes: \(hour % 12):\(minutesString) \(amPM)"
                        
                        date = NSDate(timeIntervalSince1970: TimeInterval(self.restaurantsJSON[2]["close"].int!))
                        
                        calendar = Calendar.current
                        hour = calendar.component(.hour, from: date as Date)
                        minutes = calendar.component(.minute, from: date as Date)
                        
                        minutesString = "\(minutes)"
                        
                        if (minutesString.characters.count < 2) {
                            minutesString += "0"
                        }
                        
                        amPM = "AM"
                        
                        if (hour > 12) {
                            amPM = "PM"
                        }
                        
                        self.thirdLabel.text = "\(self.restaurantsJSON[2]["name"]) , Closes: \(hour % 12):\(minutesString) \(amPM)"
                        
                        date = NSDate(timeIntervalSince1970: TimeInterval(self.restaurantsJSON[3]["close"].int!))
                        
                        calendar = Calendar.current
                        hour = calendar.component(.hour, from: date as Date)
                        minutes = calendar.component(.minute, from: date as Date)
                        
                        minutesString = "\(minutes)"
                        
                        if (minutesString.characters.count < 2) {
                            minutesString += "0"
                        }
                        
                        amPM = "AM"
                        
                        if (hour > 12) {
                            amPM = "PM"
                        }
                        
                        self.fourthLabel.text = "\(self.restaurantsJSON[3]["name"]) , Closes: \(hour % 12):\(minutesString) \(amPM)"
                        
                        date = NSDate(timeIntervalSince1970: TimeInterval(self.restaurantsJSON[4]["close"].int!))
                        
                        calendar = Calendar.current
                        hour = calendar.component(.hour, from: date as Date)
                        minutes = calendar.component(.minute, from: date as Date)
                        
                        minutesString = "\(minutes)"
                        
                        if (minutesString.characters.count < 2) {
                            minutesString += "0"
                        }
                        
                        amPM = "AM"
                        
                        if (hour > 12) {
                            amPM = "PM"
                        }
                        
                        self.fifthLabel.text = "\(self.restaurantsJSON[4]["name"]) , Closes: \(hour % 12):\(minutesString) \(amPM)"
                        
                        date = NSDate(timeIntervalSince1970: TimeInterval(self.restaurantsJSON[5]["close"].int!))
                        
                        calendar = Calendar.current
                        hour = calendar.component(.hour, from: date as Date)
                        minutes = calendar.component(.minute, from: date as Date)
                        
                        minutesString = "\(minutes)"
                        
                        if (minutesString.characters.count < 2) {
                            minutesString += "0"
                        }
                        
                        amPM = "AM"
                        
                        if (hour > 12) {
                            amPM = "PM"
                        }
                        
                        self.sixthLabel.text = "\(self.restaurantsJSON[5]["name"]) , Closes: \(hour % 12):\(minutesString) \(amPM)"
                        
                        date = NSDate(timeIntervalSince1970: TimeInterval(self.restaurantsJSON[6]["close"].int!))
                        
                        calendar = Calendar.current
                        hour = calendar.component(.hour, from: date as Date)
                        minutes = calendar.component(.minute, from: date as Date)
                        
                        minutesString = "\(minutes)"
                        
                        if (minutesString.characters.count < 2) {
                            minutesString += "0"
                        }
                        
                        amPM = "AM"
                        
                        if (hour > 12) {
                            amPM = "PM"
                        }
                        
                        self.seventhLabel.text = "\(self.restaurantsJSON[6]["name"]) , Closes: \(hour % 12):\(minutesString) \(amPM)"
                        
                        date = NSDate(timeIntervalSince1970: TimeInterval(self.restaurantsJSON[7]["close"].int!))
                        
                        calendar = Calendar.current
                        hour = calendar.component(.hour, from: date as Date)
                        minutes = calendar.component(.minute, from: date as Date)
                        
                        minutesString = "\(minutes)"
                        
                        if (minutesString.characters.count < 2) {
                            minutesString += "0"
                        }
                        
                        amPM = "AM"
                        
                        if (hour > 12) {
                            amPM = "PM"
                        }
                        
                        self.eighthlabel.text = "\(self.restaurantsJSON[7]["name"]) , Closes: \(hour % 12):\(minutesString) \(amPM)"
                        
                        date = NSDate(timeIntervalSince1970: TimeInterval(self.restaurantsJSON[8]["close"].int!))
                        
                        calendar = Calendar.current
                        hour = calendar.component(.hour, from: date as Date)
                        minutes = calendar.component(.minute, from: date as Date)
                        
                        minutesString = "\(minutes)"
                        
                        if (minutesString.characters.count < 2) {
                            minutesString += "0"
                        }
                        
                        amPM = "AM"
                        
                        if (hour > 12) {
                            amPM = "PM"
                        }
                        
                        self.ninthLabel.text = "\(self.restaurantsJSON[8]["name"]) , Closes: \(hour % 12):\(minutesString) \(amPM)"
//                        self.firstLabel.fadeOut(completion: {
//                            (finished: Bool) -> Void in
//                            self.firstLabel.fadeIn(duration: 0.7, delay: 0.1)
//                        })
//                        self.secondLabel.fadeOut(completion: {
//                            (finished: Bool) -> Void in
//                            self.secondLabel.fadeIn(duration: 0.7, delay: 0.25)
//                        })
//                        self.thirdLabel.fadeOut(completion: {
//                            (finished: Bool) -> Void in
//                            self.thirdLabel.fadeIn(duration: 0.7, delay: 0.25)
//                        })
//                        self.fourthLabel.fadeOut(completion: {
//                            (finished: Bool) -> Void in
//                            self.fourthLabel.fadeIn(duration: 0.7, delay: 0.4)
//                        })
//                        self.fifthLabel.fadeOut(completion: {
//                            (finished: Bool) -> Void in
//                            self.fifthLabel.fadeIn(duration: 0.7, delay: 0.55)
//                        })
//                        self.sixthLabel.fadeOut(completion: {
//                            (finished: Bool) -> Void in
//                            self.sixthLabel.fadeIn(duration: 0.7, delay: 0.7)
//                        })
//                        self.seventhLabel.fadeOut(completion: {
//                            (finished: Bool) -> Void in
//                            self.seventhLabel.fadeIn(duration: 0.7, delay: 1.0)
//                        })
//                        self.eighthlabel.fadeOut(completion: {
//                            (finished: Bool) -> Void in
//                            self.eighthlabel.fadeIn(duration: 0.7, delay: 1.15)
//                        })
//                        self.ninthLabel.fadeOut(completion: {
//                            (finished: Bool) -> Void in
//                            self.ninthLabel.fadeIn(duration: 0.7, delay: 1.3)
//                        })
                    
                    }
                    
                }
                catch {
                    
                }
            }
        }
        
        task.resume()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
