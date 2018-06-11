//
//  ReservarViewController.swift
//  iPark2
//
//  Created by David Eduardo Gallegos Fernández on 10/06/18.
//  Copyright © 2018 UP Bona. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ReservarViewController: UIViewController {

    @IBOutlet weak var nombreparq: UITextField!
    @IBOutlet weak var horallegada: UITextField!
    
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
    
    @IBAction func reserve(_ sender: Any) {
        
        let parq = [
           "Disponible" : false
        ]
        
        //ref?.child("Parquímetros").child(nombreparq.text!).child("Disponible").setValue(false)
        ref?.child("Parquímetros").child(nombreparq.text!).updateChildValues(parq)
        ref?.child("Parquímetros").child(nombreparq.text!).child("HoraLlegada").setValue(horallegada.text)

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
