//
//  PostViewViewController.swift
//  Murmur
//
//  Created by Garry Fanata on 12/1/18.
//  Copyright © 2018 Garry Fanata. All rights reserved.
//

import UIKit
import Alamofire
class PostViewViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet var posttitle: UITextField!
    @IBOutlet var postdesc: UITextView!
    
    @IBOutlet var categorytextfield: UITextField!
    
    @IBOutlet var categorypicker: UIPickerView!
    
    var categories = ["Random", "Alert", "Events", "Study Help", "Connections", "Confessions", "Jokes", "Market"]
    
    var catcolors = [UIColor.blue,UIColor.red,UIColor.orange,UIColor.gray,UIColor.purple,UIColor.brown,UIColor.magenta,UIColor.green]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categorypicker.delegate = self
        self.categorypicker.dataSource = self
        self.categorytextfield.delegate = self
        categorypicker.isHidden = true;
        categorytextfield.text = categories[0]
        // Do any additional setup after loading the view.

            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postbutton(_ sender: UIBarButtonItem) {
        let baseURL = "http://104.210.50.150:5000/"
        
        let parameters: Parameters = [
            "title": posttitle.text!,
            "text": postdesc.text!,
            "user": "user"
        ]
        
        Alamofire.request("\(baseURL)create", method: .post, parameters: parameters)
    }

    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        categorytextfield.text = categories[row]
        categorytextfield.textColor = catcolors[row]
        categorypicker.isHidden = true;
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        categorypicker.isHidden = false
        return false
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
