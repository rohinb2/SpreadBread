//
//  leaderboard.swift
//  pyghack-mapkit-test
//
//  Created by Rishi Masand on 9/24/17.
//  Copyright © 2017 Rishi Masand. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    var leaderboardJSON = JSON()
    
    override func viewDidLoad() {
        
        let url = URL(string: "http://6a72124a.ngrok.io/top5")
        
        var rj = ""
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            rj = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
            
            if let dataFromString = rj.data(using: .utf8, allowLossyConversion: false) {
                
                do {
                    
                    self.leaderboardJSON = try JSON(data: dataFromString)
                    
                    print(self.leaderboardJSON[0]["name"])
                    print(self.leaderboardJSON[0]["score"])
                    
                    print(self.leaderboardJSON[1]["name"])
                    print(self.leaderboardJSON[1]["score"])
                    
                    print(self.leaderboardJSON[2]["name"])
                    print(self.leaderboardJSON[2]["score"])
                    
                    print(self.leaderboardJSON[3]["name"])
                    print(self.leaderboardJSON[3]["score"])
                    
                    print(self.leaderboardJSON[4]["name"])
                    print(self.leaderboardJSON[4]["score"])
                    
                }
                catch {
                    
                }
                
            }
            
        }
        
        task.resume()
        
    }
    
}
