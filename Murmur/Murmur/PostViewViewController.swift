//
//  PostViewViewController.swift
//  Murmur
//
//  Created by Garry Fanata on 12/1/18.
//  Copyright © 2018 Garry Fanata. All rights reserved.
//

import UIKit

class PostViewViewController: UIViewController {

    @IBOutlet var posttitle: UITextField!
    @IBOutlet var postdesc: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postbutton(_ sender: UIBarButtonItem) {
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
