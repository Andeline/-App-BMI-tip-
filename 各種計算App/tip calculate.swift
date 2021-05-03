//
//  tip calculate.swift
//  各種計算App
//
//  Created by 蔡佳穎 on 2021/5/3.
//

import UIKit

class tip_calculate: UIViewController {

    @IBOutlet weak var mealTextField: UITextField!
    @IBOutlet weak var tipPercentTextField: UITextField!
    @IBOutlet weak var sharingNumberTextField: UITextField!
    @IBOutlet weak var totalMealLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
   

    @IBAction func calculate(_ sender: UIButton) {
        
        //收鍵盤
        view.endEditing(true)
        
        let mealText = mealTextField.text!
        let tipPercentText = tipPercentTextField.text!
        let sharingNumberText = sharingNumberTextField.text!
        let meal = Int(mealText)
        let tipPercent = Int(tipPercentText)
        let sharingNumber = Int(sharingNumberText)
        
        if meal != nil, tipPercent != nil, sharingNumber != nil {
            let totalMeal = meal! + meal! * tipPercent!/100
            let split = totalMeal / sharingNumber!
            totalMealLabel.text = "\(totalMeal)"
            splitLabel.text = "\(split)"
        } else {
            mealTextField.text = "請輸入數字"
            tipPercentTextField.text = "請輸入數字"
            sharingNumberTextField.text = "請輸入數字"
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        mealTextField.text = ""
        tipPercentTextField.text = ""
        sharingNumberTextField.text = ""
    }
}
