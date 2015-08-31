//
//  ViewController.swift
//  FilterSwipe
//
//  Created by jay on 8/27/15.
//  Copyright (c) 2015 Appsilog LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cameraView: UIImageView!
    
    let cameraManager = CameraManager.sharedInstance
    
    var viewControllers = Array(count:3, repeatedValue: UIViewController())
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let pvc = segue.destinationViewController as! UIPageViewController
        pvc.dataSource = self
        
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.cameraManager.showAccessPermissionPopupAutomatically = true
        self.cameraManager.writeFilesToPhoneLibrary = false
        let currentCameraState = self.cameraManager.currentCameraStatus()
        
        if (currentCameraState == .Ready) {
            self.addCameraToView()
        }
        
                
        
        
        
//        let swiper = APSwipeViewControllers()
//        swiper.wraps = true
//        swiper.viewControllers = [FirstViewController(), SecondViewController(), ThirdViewController()]
//        swiper.mainViewControllerIndex = 1
//        
//        
        
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.cameraManager.resumeCaptureSession()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.cameraManager.stopCaptureSession()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func addCameraToView()
    {
        self.cameraManager.addPreviewLayerToView(self.cameraView, newCameraOutputMode: CameraOutputMode.StillImage)
        CameraManager.sharedInstance.showErrorBlock = { (erTitle: String, erMessage: String) -> Void in
            
            
        }
    }

}

extension ViewController: UIPageViewControllerDataSource{
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
      return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        return nil
    }
}