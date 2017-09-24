//
//  AboutViewController.swift
//  SpreadBread
//
//  Created by Rohin Bhasin on 9/24/17.
//  Copyright © 2017 Rohin Bhasin. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var firstLabel: UITextView!
    @IBOutlet weak var secondLabel: UITextView!
    @IBOutlet weak var thirdLabel: UITextView!
    @IBOutlet weak var fourLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstLabel.alpha = 0
        self.secondLabel.alpha = 0
        self.thirdLabel.alpha = 0
        self.fourLabel.alpha = 0
        self.firstLabel.text = "Our goal is to help eradicate the hunger associated with poverty in local, suburban environments."
        self.secondLabel.text = "SpreadBread helps fix this issue by providing a means for volunteers to deliver goods to food shelters in a timely manner."
        self.thirdLabel.text = "Our vision for SpreadBread is for it to use it in college-campus settings, starting with the Champaign-Urbana area. SpreadBread will help connect groups of students, businesses, and the underprivileged to truly benefit the community."
        self.fourLabel.text = "Our leaderboard feature allows students to have healthy competition while performing selfless acts. Eventually, SpreadBread will allow businesses to make themselves more accessible through the service, simultaneously helping businesses grow and helping the underprivileged."
        self.firstLabel.fadeOut(completion: {
            (finished: Bool) -> Void in
            self.firstLabel.fadeIn(duration: 1.0, delay: 0.5)
        })
        self.secondLabel.fadeOut(completion: {
            (finished: Bool) -> Void in
            self.secondLabel.fadeIn(duration: 1.0, delay: 1.5)
        })
        self.thirdLabel.fadeOut(completion: {
            (finished: Bool) -> Void in
            self.thirdLabel.fadeIn(duration: 1.0, delay: 2.5)
        })
        self.fourLabel.fadeOut(completion: {
            (finished: Bool) -> Void in
            self.fourLabel.fadeIn(duration: 1.0, delay: 3.5)
        })
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


