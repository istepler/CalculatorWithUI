//
//  ViewController.swift
//  CalculatorWithUI
//
//  Created by Kirill Kirikov on 5/7/17.
//  Copyright © 2017 GoIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CEButton: UIButton!
    var didInputStarted:Bool = false
    var dotUsed = false
    var model = CalculatorModel()
    var currentDisplayValue: Double {
        set {
            inputDisplay.text = String(newValue)
        }
        get {
            return Double(inputDisplay.text!)!
        }
    }
    
    @IBOutlet weak var inputDisplay: UITextField!
    
    @IBAction func touchDigit(_ sender: UIButton) {
        print("Digit: \(sender.currentTitle!)")
        
        if didInputStarted {
            if inputDisplay.text! == "0" {
                inputDisplay.text = sender.currentTitle!
            } else {
                inputDisplay.text = inputDisplay.text! + sender.currentTitle!
            }
            
        } else {
            inputDisplay.text = sender.currentTitle!
            didInputStarted = true
        }
    }
    
    @IBAction func inputDot(_ sender: UIButton) {
        if !didInputStarted  {
            inputDisplay.text = "0" + sender.currentTitle!
            didInputStarted = true
            dotUsed = true
        } else {
            
            if !dotUsed {
                inputDisplay.text = inputDisplay.text! + sender.currentTitle!
                dotUsed = true
            }
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        guard let currentValue = Double(inputDisplay.text!) else {
            return
        }
        
        model.setOperand(currentValue)
        model.performOperation(sender.currentTitle!)
        currentDisplayValue = model.result ?? 0
        
        dotUsed = false
        didInputStarted = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "inputImage")!
        //inputDisplay.backgroundColor = UIColor(patternImage: UIImage(named:"inputImage")!).withAlphaComponent(0.5)
        // HOW TO SET THE ALPHA TO BACKGROUND IMAGE
        inputDisplay.background  = UIImage(named: "inputImage")!
        
    }
}

