//
//  ViewController.swift
//  VeCalc
//
//  Created by Dema Abu Adas on 2017-10-20.
//  Copyright © 2017 Dema Abu Adas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var DimentionSwitcher: UISegmentedControl!
    
    /* Vectors */
    @IBOutlet weak var u1: UITextField!
    @IBOutlet weak var u2: UITextField!
    @IBOutlet weak var u3: UITextField!
    @IBOutlet weak var v1: UITextField!
    @IBOutlet weak var v2: UITextField!
    @IBOutlet weak var v3: UITextField!
    
    /* Operations using 2 vectors */
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var subtractBtn: UIButton!
    @IBOutlet weak var crossBtn: UIButton!
    @IBOutlet weak var dotBtn: UIButton!
    
    /* Operations using 1 vector */
    @IBOutlet weak var magnitudeBtn: UIButton!
    @IBOutlet weak var unitBtn: UIButton!
    @IBOutlet weak var derivativeBtn: UIButton!
    @IBOutlet weak var integral: UIButton!
    
    /* Result Vectors */
    @IBOutlet weak var singleResult: UILabel!
    @IBOutlet weak var xResult: UILabel!
    @IBOutlet weak var yResult: UILabel!
    @IBOutlet weak var zResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        u1.delegate = self
        u2.delegate = self
        u3.delegate = self
        v1.delegate = self
        v2.delegate = self
        v3.delegate = self
    
        addBtn.addTarget(self, action: #selector(ViewController.buttonClicked(_:)), for: .touchUpInside)
        magnitudeBtn.addTarget(self, action: #selector(ViewController.buttonClicked(_:)), for: .touchUpInside)
        subtractBtn.addTarget(self, action: #selector(ViewController.buttonClicked(_:)), for: .touchUpInside)

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        //change this later when i learn how to do button "listeners" individually
        if (sender === addBtn) {
            calcAdd()
        } else if (sender === magnitudeBtn) {
            calcMagnitude()
        } else if (sender === subtractBtn) {
            calcSubtract();
        }
    }
    
    func calcMagnitude() {
        var u1Double: Double = Double(u1.text!)!
        var u2Double: Double = Double(u2.text!)!
        var u3Double: Double = Double(u3.text!)!
        
        u1Double = u1Double * u1Double
        u2Double = u2Double * u2Double
        u3Double = u3Double * u3Double
        
        if (u1Double < 0) {
            u1Double = -u1Double
        } else if (u2Double < 0) {
            u2Double = -u2Double
        } else if (u3Double < 0) {
            u3Double = -u3Double
        }
        
        var final:Double = u1Double + u2Double + u3Double
        final = final.squareRoot()
        let finalString = "\(final)"
        singleResult.text = finalString

    }
    
    func calcAdd() {
        let addx: Double = Double(u1.text!)! + Double(v1.text!)!
        let addy: Double = Double(u2.text!)! + Double(v2.text!)!
        let addz: Double = Double(u3.text!)! + Double(v3.text!)!
        
        xResult.text = "\(addx)"
        yResult.text = "\(addy)"
        zResult.text = "\(addz)"
    }
    
    func calcSubtract() {
        let subtractx: Double = Double(u1.text!)! - Double(v1.text!)!
        let subtracty: Double = Double(u2.text!)! - Double(v2.text!)!
        let subtractz: Double = Double(u3.text!)! - Double(v3.text!)!
        
        xResult.text = "\(subtractx)"
        yResult.text = "\(subtracty)"
        zResult.text = "\(subtractz)"
    }

}

