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
        var timeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        timeLabel.center = view.center
        
        
        timeLabel.font = UIFont.systemFontOfSize(50.0)
        timeLabel.textColor = .whiteColor()
        timeLabel.textAlignment = .Center
        
        let date = NSDate()
        var formatter = NSDateFormatter();
        formatter.dateFormat = "H:mma";
        let defaultTimeZoneStr = formatter.stringFromDate(date);
        var timestamp = defaultTimeZoneStr
        timeLabel.text = timestamp
        
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
