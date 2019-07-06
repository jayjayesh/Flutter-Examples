//
//  ViewController.swift
//  AddFlutterToExistingIOSApp
//
//  Created by Jayesh Lathiya on 30/06/19.
//  Copyright © 2019 jayesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var txtFirstNumber: UITextField!
    @IBOutlet weak var txtSecondNumber: UITextField!
    @IBOutlet weak var lblResultText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK:- TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      return true;
    }
    
    
     //MARK:- On Button Click
    @IBAction func onSendDataToFlutterModuleButtonClicked(_ sender: Any) {
        txtFirstNumber.resignFirstResponder()
        txtSecondNumber.resignFirstResponder()
        
        let (firstNumber, secondNumber) = validateNumbers()
        if(firstNumber != 0 && secondNumber != 0)
        {
            
        }
        
    }
    
    
    //MARK:- Other
    func validateNumbers() -> (Int, Int) {
        
        let nFirst = self.txtFirstNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let nSecond = self.txtSecondNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if(nFirst.isEmpty)
        {
            showMessage(msg: "Please enter first number")
        }
        else if (nSecond.isEmpty)
        {
            showMessage(msg: "Please enter second number")
        }
        else
        {
            return (Int(nFirst)!, Int(nSecond)!)
        }
        
         return (0,0)
    }


    
    func showMessage(msg: String){
        let alert = UIAlertController(title: "", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

