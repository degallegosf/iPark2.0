//
//  PayMethodsViewController.swift
//  iPark2
//
//  Created by David Eduardo Gallegos Fernández on 09/06/18.
//  Copyright © 2018 UP Bona. All rights reserved.
//

import UIKit
import FirebaseDatabase


class PayMethodsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    var ref:DatabaseReference?
    var databaseHandlera:DatabaseHandle?
    
    var postData = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //set the Firebase Reference
        ref = Database.database().reference()
        
        //Retrieve the data and listen the changes
        
        databaseHandlera = ref?.child("Users").child("0").child("PayMethods").observe(.childAdded, with: { (snapshot) in

            
            //Code to execute
            //Take the value and addedit to the post data
            
            
            //let key = snapshot.key
            
            guard let dictionary = snapshot.value as? [String: AnyObject] else {return}
            //let data = snapshot.value as? String
            
            let cn = dictionary["CardNumber"] as? String
            if let actualPost = cn {
                self.postData.append(actualPost)
                self.tableView.reloadData()
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return postData.count;
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
            cell?.textLabel?.text = postData[indexPath.row]
            
            return cell!
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
