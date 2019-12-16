//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var weightValue: UISlider!
    @IBOutlet weak var heightValue: UISlider!
    @IBOutlet weak var weightDisplay: UILabel!
    @IBOutlet weak var heightDisplay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightDisplay.text = "\(String(format: "%.2f",sender.value))m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightDisplay.text = "\(Int(sender.value))Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightValue.value
        let weight = weightValue.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)  //to go to the next viewController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBmiValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

