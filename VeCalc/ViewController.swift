//
//  ViewController.swift
//  VeCalc
//
//  Created by Dema Abu Adas on 2017-10-20.
//  Copyright © 2017 Dema Abu Adas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /* Vectors */
    @IBOutlet weak var u1: UITextField!
    @IBOutlet weak var u2: UITextField!
    @IBOutlet weak var u3: UITextField!
    
    /* Operations using 2 vectors */
    @IBOutlet weak var addBtn: UIButton!
    
    /* Operations using 1 vector */
    @IBOutlet weak var magnitudeBtn: UIButton!
    
    /* Result Vectors */
    @IBOutlet weak var singleResult: UILabel!
    @IBOutlet weak var xResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addBtn.addTarget(self, action: #selector(ViewController.buttonClicked(_:)), for: .touchUpInside)
        magnitudeBtn.addTarget(self, action: #selector(ViewController.buttonClicked(_:)), for: .touchUpInside)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        //change this later when i learn how to do button "listeners" individually
        if (sender === addBtn) {
        } else if (sender == magnitudeBtn) {
            calcMagnitude();
        }
    }
    
    func calcMagnitude() {
        var u1Double: Double = Double(u1.text!)!
        var u2Double: Double = Double(u2.text!)!
        var u3Double: Double = Double(u3.text!)!
        //v///ar final: Double
        //var finalString
        
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


}

