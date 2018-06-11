//
//  AddPayMethodViewController.swift
//  iPark2
//
//  Created by David Eduardo Gallegos Fernández on 09/06/18.
//  Copyright © 2018 UP Bona. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddPayMethodViewController: UIViewController {

    @IBOutlet weak var cardNum: UITextField!
    @IBOutlet weak var cardDate: UITextField!
    @IBOutlet weak var cardCVV: UITextField!
    
    var ref:DatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addCard(_ sender: Any) {

        let key = ref?.child("Users").child("0").child("PayMethods").childByAutoId().key
        //Post the data to Firebase
        ref?.child("Users").child("0").child("PayMethods").child(key!).child("CardNumber").setValue(cardNum.text)
        ref?.child("Users").child("0").child("PayMethods").child(key!).child("ExpDate").setValue(cardDate.text)
        ref?.child("Users").child("0").child("PayMethods").child(key!).child("CVV").setValue(cardCVV.text)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
