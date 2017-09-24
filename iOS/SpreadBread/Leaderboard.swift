//
//  leaderboard.swift
//  pyghack-mapkit-test
//
//  Created by Rishi Masand on 9/24/17.
//  Copyright © 2017 Rishi Masand. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var third: UILabel!
    @IBOutlet weak var fourth: UILabel!
    @IBOutlet weak var fifth: UILabel!
    
    var leaderboardJSON = JSON()
    
    override func viewDidLoad() {
        
        let url = URL(string: "http://6a72124a.ngrok.io/top5")
        
        var rj = ""
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            rj = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
            
            if let dataFromString = rj.data(using: .utf8, allowLossyConversion: false) {
                
                do {
                    
                    self.leaderboardJSON = try JSON(data: dataFromString)
                    
                    DispatchQueue.main.async {
                        
                        self.first.text = "Name: \(self.leaderboardJSON[0]["name"]), Score: \(self.leaderboardJSON[0]["score"])"
                    
                        self.second.text = "Name: \(self.leaderboardJSON[1]["name"]), Score: \(self.leaderboardJSON[1]["score"])"
                        
                        self.third.text = "Name: \(self.leaderboardJSON[2]["name"]), Score: \(self.leaderboardJSON[2]["score"])"
                        
                        self.fourth.text = "Name: \(self.leaderboardJSON[3]["name"]), Score: \(self.leaderboardJSON[3]["score"])"
                        
                        self.fifth.text = "Name: \(self.leaderboardJSON[4]["name"]), Score: \(self.leaderboardJSON[4]["score"])"
                        
                        
                    }
                    
                    
                    
                }
                catch {
                    
                }
                
            }
            
        }
        
        task.resume()
        
    }
    
}


