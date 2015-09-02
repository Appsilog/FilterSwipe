//
//  RedFilterView.swift
//  FilterSwipe
//
//  Created by jay on 9/1/15.
//  Copyright (c) 2015 Appsilog LLC. All rights reserved.
//

import UIKit

class RedFilterView: UIImageView {

    override init(frame: CGRect){
        super.init(frame: frame)
        
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(){
        backgroundColor = .redColor()
        alpha = 0.1
    }

}
