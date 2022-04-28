//
//  ViewController.swift
//  GradientViewWithAnimation
//
//  Created by Edexa_IOS on 28/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gradView: GradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addGradientAnimation()
    }
    
    func addGradientAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            
            //Is you want to add it inside table view then first you need to remove added layers from the GradientView. You can do it by below for loop code.
            for item in self.gradView.layer.sublayers ?? []{
                if item.name == "valuesGradient"{
                    item.removeFromSuperlayer()
                }
            }
            self.gradView.startAnimating(colors: [#colorLiteral(red: 0.03529411765, green: 0.03529411765, blue: 0.03529411765, alpha: 1).cgColor, #colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.09803921569, alpha: 1).cgColor], location: [0.0, 0.5, 0.9])
        }
    }
    
    func removeGradientAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            for item in self.gradView.layer.sublayers ?? []{
                if item.name == "valuesGradient"{
                    item.sublayers?.removeAll()
                }
            }
        }
    }
}

