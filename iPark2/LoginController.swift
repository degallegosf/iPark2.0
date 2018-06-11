//
//  LoginController.swift
//  iPark2
//
//  Created by David Eduardo Gallegos Fernández on 09/06/18.
//  Copyright © 2018 UP Bona. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginController: UIViewController {

    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var pass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Login(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: emailtext.text!, password: pass.text!) { (user, error) in
            if let u = user{
                self.performSegue(withIdentifier: "gotoMain", sender: self)
            }
            else{
                
            }
        
        }
    }
    
    @IBAction func Register(_ sender: Any) {
        
        
        Auth.auth().createUser(withEmail: emailtext.text!, password: pass.text!,completion: {
            (user,error) in

        })
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
