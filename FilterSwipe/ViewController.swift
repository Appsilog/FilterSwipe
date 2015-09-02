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
        
        scrollView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        
        self.cameraManager.showAccessPermissionPopupAutomatically = true
        self.cameraManager.writeFilesToPhoneLibrary = false
        let currentCameraState = self.cameraManager.currentCameraStatus()
        
        if (currentCameraState == .Ready) {
            self.addCameraToView()
        }
        

       
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       
        
    }
    

    override func viewWillLayoutSubviews() {
        
        for vc in self.childViewControllers{
            vc.willMoveToParentViewController(nil)
            vc.view!?.removeFromSuperview()
            vc.removeFromParentViewController()
        }
        
        let frame = self.view.frame
        
        let clearVC = FilterViewController()
        clearVC.filterView = ClearFilterView(frame: frame)
        
        let redVC = FilterViewController()
        redVC.filterView = RedFilterView(frame: frame)
        
        let blueVC = FilterViewController()
        blueVC.filterView = BlueFilterView(frame: frame)
        
        let timeVC = TimeViewController()
        
        let viewControllers = [clearVC, redVC, blueVC, timeVC]

        setupScrollView(viewControllers)
        
    }
    
    func setupScrollView(viewControllers: [FilterViewController]){
        let frame = self.view.frame
        let deviceWidth = frame.width
        let deviceHeight = frame.height
        
        for (var i = 0; i < viewControllers.count;++i) {
            let vc = viewControllers[i] as FilterViewController
            vc.view.frame = CGRect(x: CGFloat(deviceWidth) * CGFloat(i), y: 0, width: deviceWidth, height: deviceHeight)
        
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
