//
//  Azan.swift
//  Prayer App
//
//  Created by Reza Moghtaderi on 1/30/16.
//  Copyright © 2016 Cirtual L.L.C. All rights reserved.
//

import UIKit
import ChameleonFramework
import QuartzCore

class Azan: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background Color
        self.view.backgroundColor = UIColor(gradientStyle:UIGradientStyle.Radial, withFrame:self.view.frame, andColors:[UIColor.flatLimeColor(), UIColor.flatForestGreenColorDark()])

    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
