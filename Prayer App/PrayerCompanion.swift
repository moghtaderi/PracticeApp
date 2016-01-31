//
//  ViewController.swift
//  Prayer App
//
//  Created by Reza Moghtaderi on 1/30/16.
//  Copyright © 2016 Cirtual L.L.C. All rights reserved.
//

import UIKit
import ChameleonFramework
import QuartzCore
import Persei

class PrayerCompanion: UITableViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    private weak var menu: MenuView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMenu()

        // Background Color
        self.view.backgroundColor = UIColor(gradientStyle:UIGradientStyle.Radial, withFrame:self.view.frame, andColors:[UIColor.flatLimeColor(), UIColor.flatForestGreenColorDark()])
        
        title = model.description
        imageView.image = model.image
        
    }
    
    private func loadMenu() {
        let menu = MenuView()
        menu.delegate = self
        menu.items = items
        
        tableView.addSubview(menu)
        
        self.menu = menu
    }
    // MARK: - Items
    private let items = (0..<7 as Range).map {
        MenuItem(image: UIImage(named: "menu_icon_\($0)")!)
    }
    
    // MARK: - Model
    private var model: ContentType = ContentType.Films {
        didSet {
            title = model.description
            
            if isViewLoaded() {
                let center: CGPoint = {
                    let itemFrame = self.menu.frameOfItemAtIndex(self.menu.selectedIndex!)
                    let itemCenter = CGPoint(x: itemFrame.midX, y: itemFrame.midY)
                    var convertedCenter = self.imageView.convertPoint(itemCenter, fromView: self.menu)
                    convertedCenter.y = 0
                    
                    return convertedCenter
                }()
                
                let transition = CircularRevealTransition(layer: imageView.layer, center: center)
                transition.start()
                
                imageView.image = model.image
            }
        }
    }

    // MARK: - Actions
    @IBAction func btnMenuPressed(sender: AnyObject) {
        menu.setRevealed(!menu.revealed, animated: true)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}


// MARK: - MenuViewDelegate
extension PrayerCompanion: MenuViewDelegate {
    func menu(menu: MenuView, didSelectItemAtIndex index: Int) {
        model = model.next()
    }
}

