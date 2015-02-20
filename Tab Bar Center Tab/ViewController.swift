//
//  ViewController.swift
//  Tab Bar Center Tab
//
//  Created by Jorge Crisóstomo Palacios on 2/19/15.
//  Copyright (c) 2015 videmor. All rights reserved.
//

import UIKit
import QuartzCore


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // [self addCenterButtonWithImage:[UIImage imageNamed:@"cameraTabBarItem.png"] highlightImage:nil];
//        [self addCenterButtonWithImage:[UIImage imageNamed:@"camera_button_take.png"] highlightImage:nil];
        
        self.tabBarController?.tabBar.layer.borderWidth = 0
        self.tabBarController?.tabBar.layer.borderColor = self.tabBarController?.tabBar.tintColor.CGColor
        
        self.addCenterButtonWithImage(UIImage(named: "camera_button_take.png")!, highlightImage: nil)
        // [self addCenterButtonWithImage:[UIImage imageNamed:@"capture-button.png"] highlightImage:nil];
    }
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCenterButtonWithImage(buttonImage: UIImage, highlightImage: UIImage?){
        let button = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        button.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleTopMargin
        
        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height)
        button.setBackgroundImage(buttonImage, forState: UIControlState.Normal)
        button.setBackgroundImage(highlightImage, forState: UIControlState.Highlighted)
        button.addTarget(self, action: "buttonEvent", forControlEvents: UIControlEvents.TouchUpInside)
        
        var heightDifference: CGFloat = buttonImage.size.height - self.tabBarController!.tabBar.frame.size.height
        
        if (heightDifference < 0){
            button.center = self.tabBarController!.tabBar.center
        }else{
            var center: CGPoint = self.tabBarController!.tabBar.center
            center.y = center.y - self.tabBarController!.tabBar.frame.origin.y - heightDifference/2.0
//            center.y = center.y - heightDifference/2.0
            button.center = center
        }
        
        
        
//        self.view.addSubview(button)
        self.tabBarController?.tabBar.addSubview(button)
        
    }
    
    func buttonEvent() {
        self.tabBarController?.selectedIndex = 1
    }


}

