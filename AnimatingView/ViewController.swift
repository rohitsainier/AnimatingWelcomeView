//
//  ViewController.swift
//  AnimatingView
//
//  Created by Rohit Saini on 06/06/18.
//  Copyright © 2018 SainiSaab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bgViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var welcomeLbl: UILabel!
    
    @IBOutlet weak var holaBtn: UIButton!
    @IBOutlet weak var blurView: UIVisualEffectView!
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("")
        self.startAnimation()
       
    }
    
    func startAnimation(){
        bgViewConstraint.constant = -195
        
        for i in [bgImage,bgView,welcomeLbl,holaBtn]{
            i?.alpha = 0
        }
        UIView.animate(withDuration: 1, animations: {
            self.bgImage.alpha = 1
        }) { (true) in
            self.animateBgView()
        }
    }
    
    func animateBgView() {
        UIView.animate(withDuration: 2, animations: {
            self.bgView.alpha = 1
            self.bgViewConstraint.constant = 0
            self.view.layoutIfNeeded()
        }) { (true) in
            self.animateLabel()
        }
    }
    
    func animateLabel(){
        UIView.animate(withDuration: 1, animations: {
            self.welcomeLbl.alpha = 1
        }) { (true) in
            self.animateButton()
        }
    }
    
    func animateButton(){
        UIView.animate(withDuration: 1) {
            self.holaBtn.alpha = 1
        }
    }

    @IBAction func holaAmigosBtnPressed(_ sender: UIButton) {
        
        self.startAnimation()
    }
    
}

