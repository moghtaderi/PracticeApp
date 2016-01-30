//
//  ViewController.swift
//  Prayer App
//
//  Created by Reza Moghtaderi on 1/30/16.
//  Copyright © 2016 Cirtual L.L.C. All rights reserved.
//

import UIKit
import ChameleonFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(gradientStyle:UIGradientStyle.Radial, withFrame:self.view.frame, andColors:[UIColor.flatLimeColor(), UIColor.flatForestGreenColorDark()])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}

