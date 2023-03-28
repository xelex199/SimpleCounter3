//
//  ViewController.swift
//  SimpleCounter3
//
//  Created by Василий on 28.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var count : Int = 0
    
    var previousCount : Int = 0
    
    func whosBigger(){
        if count > previousCount{
            historyOfChanges.insertText("\n [\(Date())]: Значение изменено на +1  \n")
            previousCount = count
        }
        else if count < previousCount{
            historyOfChanges.insertText("\n [\(Date())]: Значение изменено на -1 \n")
            previousCount = count
        }
    }
    @IBOutlet weak var plusButton: UIButton!
    
    @IBAction func plusCounter(_ sender: Any) {
        count += 1
        counter.text = "Значение счетчика : \(count)"
        whosBigger()

    }
    
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBAction func minusCounter(_ sender: Any) {
        if count == 0{
            count += 1
            historyOfChanges.insertText("\n [\(Date())]: Попытка уменьшить значение счетчика ниже 0 \n")
            count -= 1
            previousCount = count
        }
        else {
            count -= 1
            whosBigger()
        }
        counter.text = "Значение счетчика : \(count)"
    }
    
    
    @IBOutlet weak var zeroCounter: UIButton!
    
    @IBAction func makeZeroCounter(_ sender: Any) {
        count = 0
        counter.text = "Значение счетчика : \(count)"
        historyOfChanges.insertText("\n [\(Date())]: Значение сброшено \n")
        previousCount = count
    }
    
    
    @IBOutlet weak var counter: UILabel!
    
    
    
    @IBOutlet weak var countersButton: UIButton!
    
    @IBAction func buttonDidTap(_ sender: Any) {
        count += 1
        counter.text = "Значение счетчика : \(count)"
    }
    
    
    @IBOutlet weak var historyOfChanges: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter.text = "Значение счетчика : \(count)"
        plusButton.setTitle("", for: .normal)
        minusButton.setTitle("", for: .normal)
        zeroCounter.setTitle("", for: .normal)
        historyOfChanges.text = " История изменений:"
        historyOfChanges.isScrollEnabled = true
        historyOfChanges.isUserInteractionEnabled = true
        historyOfChanges.isEditable  = false
        // Do any additional setup after loading the view.
    }


}

