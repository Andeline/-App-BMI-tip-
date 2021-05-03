//
//  BMI calculate.swift
//  各種計算App
//
//  Created by 蔡佳穎 on 2021/5/3.
//

import UIKit

class BMI_calculate: UIViewController {

    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var age: Float = 0
    var gender = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func moveAgeSlider(_ sender: UISlider) {
        ageLabel.text = String(format: "%.1f", sender.value)
        ageLabel.sizeToFit()
        age = sender.value
    }
    
    @IBAction func selectGender(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            gender = "女"
        } else {
            gender = "男"
        }
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        
        //收鍵盤
        view.endEditing(true)
        
        let heightText = heightTextField.text!
        let weightText = weightTextField.text!
        let height = Double(heightText)
        let weight = Double(weightText)
        var bmi: Double = 0
        
        //BMI計算
        if height != nil, weight != nil {
            let heightMeter = height! / 100
            bmi = weight! / (heightMeter*heightMeter)
            
            bmiLabel.text = String(format: "%.1f", bmi)
        } else {
            heightTextField.text = "請輸入數字"
            weightTextField.text = "請輸入數字"
        }
        
        //建議label
        if age < 18, gender == "男" { //未成年男
            switch age {
            case 0..<1:
                if bmi > 15.8 {
                    adviceLabel.text = "肥胖，請勿餵食"
                } else if bmi > 14.8 {
                    adviceLabel.text = "過重，叫阿公嗄罵不要再塞零食了"
                } else if bmi >= 11.5 {
                    adviceLabel.text = "正常，健康寶寶"
                } else {
                    adviceLabel.text = "夭壽喔瘦成這樣"
                }
            case 1..<1.5:
                if bmi > 19.2 {
                    adviceLabel.text = "肥胖，請勿餵食"
                } else if bmi > 18.3 {
                    adviceLabel.text = "過重，叫阿公嗄罵不要再塞零食了"
                } else if bmi >= 14.8 {
                    adviceLabel.text = "正常，健康寶寶"
                } else {
                    adviceLabel.text = "夭壽喔瘦成這樣"
                }
            case 1.5..<2:
                if bmi > 18.5 {
                    adviceLabel.text = "肥胖，請勿餵食"
                } else if bmi > 17.5 {
                    adviceLabel.text = "過重，叫阿公嗄罵不要再塞零食了"
                } else if bmi >= 14.2 {
                    adviceLabel.text = "正常，健康寶寶"
                } else {
                    adviceLabel.text = "夭壽喔瘦成這樣"
                }
            default:
                break
            }
        } else if age < 18, gender == "女" { //未成年女
            switch age {
            case 0..<0.5:
                if bmi > 15.5 {
                    adviceLabel.text = "肥胖，請勿餵食"
                } else if bmi > 14.7 {
                    adviceLabel.text = "過重，叫阿公嗄罵不要再塞零食了"
                } else if bmi >= 11.5 {
                    adviceLabel.text = "正常，健康寶寶"
                } else {
                    adviceLabel.text = "夭壽喔瘦成這樣"
                }
            case 0.5..<1:
                if bmi > 19.6 {
                    adviceLabel.text = "肥胖，請勿餵食"
                } else if bmi > 18.6 {
                    adviceLabel.text = "過重，叫阿公嗄罵不要再塞零食了"
                } else if bmi >= 14.6 {
                    adviceLabel.text = "正常，健康寶寶"
                } else {
                    adviceLabel.text = "夭壽喔瘦成這樣"
                }
            case 1..<1.5:
                if bmi > 19 {
                    adviceLabel.text = "肥胖，請勿餵食"
                } else if bmi > 17.9 {
                    adviceLabel.text = "過重，叫阿公嗄罵不要再塞零食了"
                } else if bmi >= 14.2 {
                    adviceLabel.text = "正常，健康寶寶"
                } else {
                    adviceLabel.text = "夭壽喔瘦成這樣"
                }
            case 1.5..<2:
                if bmi > 18.2 {
                    adviceLabel.text = "肥胖，請勿餵食"
                } else if bmi > 17.2 {
                    adviceLabel.text = "過重，叫阿公嗄罵不要再塞零食了"
                } else if bmi >= 13.7 {
                    adviceLabel.text = "正常，健康寶寶"
                } else {
                    adviceLabel.text = "夭壽喔瘦成這樣"
                }
            default:
                break
            }
        } else if age >= 18 { //成年男女
            if bmi < 18.5 {
                adviceLabel.text = "太瘦啦，沒有要當model的話，就多吃一點吧！"
            } else if bmi >= 18.5, bmi < 24 {
                adviceLabel.text = "Good！這樣很健康！繼續保持～"
            } else {
                adviceLabel.text = "你知道的，請放下對邪惡垃圾食品的慾望"
            }
            adviceLabel.sizeToFit()
        }
    }
}
