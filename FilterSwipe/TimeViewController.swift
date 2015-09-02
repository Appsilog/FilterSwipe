//
//  TimeViewController.swift
//  FilterSwipe
//
//  Created by jay on 9/1/15.
//  Copyright (c) 2015 Appsilog LLC. All rights reserved.
//

import UIKit

class TimeViewController: FilterViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var timeLabel = UILabel(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height/2, width: 200, height: 200))
       // timeLabel.text = "12:00am"
        
        let attributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName : UIFont.systemFontOfSize(50/0)
        ]
        timeLabel.text = "12:00am"
        
        self.view.addSubview(timeLabel)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
