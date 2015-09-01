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
    
    @IBOutlet weak var scrollView: UIScrollView!
    weak var topImageView: UIImageView!
    
    let cameraManager = CameraManager.sharedInstance
    
    
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.cameraManager.showAccessPermissionPopupAutomatically = true
        self.cameraManager.writeFilesToPhoneLibrary = false
        let currentCameraState = self.cameraManager.currentCameraStatus()
        
        if (currentCameraState == .Ready) {
            self.addCameraToView()
        }
        

       
    }

    override func viewWillLayoutSubviews() {
        let viewControllers = ["YellowFilterVC", "RedFilterVC", "BlueFilterVC"]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let deviceWidth = CGFloat(self.view.frame.width)
        println(self.view.frame.width)
        println(self.view.frame.height)
        
        let deviceHeight = CGFloat(self.view.frame.height)
        
        for (var i = 0; i < viewControllers.count;++i) {
            let vc = storyboard.instantiateViewControllerWithIdentifier(viewControllers[i]) as! UIViewController
            vc.view.frame = CGRect(x: CGFloat(deviceWidth) * CGFloat(i), y: 0, width: deviceWidth * 2, height: deviceHeight)
            self.addChildViewController(vc)
            self.scrollView!.addSubview(vc.view)
            vc.didMoveToParentViewController(self)
            
        }
        
        self.scrollView!.contentSize = CGSizeMake(CGFloat(deviceWidth) * CGFloat(viewControllers.count), deviceHeight)
        
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
