//
//  ViewController.swift
//  FilterSwipe
//
//  Created by jay on 8/27/15.
//  Copyright (c) 2015 Appsilog LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewControllers = Array(count:3, repeatedValue: UIViewController())
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let pvc = segue.destinationViewController as! UIPageViewController
        pvc.dataSource = self
        
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
//        let swiper = APSwipeViewControllers()
//        swiper.wraps = true
//        swiper.viewControllers = [FirstViewController(), SecondViewController(), ThirdViewController()]
//        swiper.mainViewControllerIndex = 1
//        
//        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIPageViewControllerDataSource{
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
      
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        <#code#>
    }
}