//
//  ProfileViewController.swift
//  iPark2
//
//  Created by David Eduardo Gallegos Fernández on 10/06/18.
//  Copyright © 2018 UP Bona. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ProfileViewController: UIViewController {

    @IBOutlet weak var userName: UILabel?
    var ref:DatabaseReference?
    var databaseHandlera:DatabaseHandle?
    var user = "-"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName?.text = "UserName"
        // Do any additional setup after loading the view.
    
        //set the Firebase Reference
        ref = Database.database().reference()
        
        //Retrieve the data and listen the changes
        
        ref?.child("Users").child("0").child("Info").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["Username"] as? String ?? ""
            
            self.userName?.text = username
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
