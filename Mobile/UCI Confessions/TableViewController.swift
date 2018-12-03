//
//  TableViewController.swift
//  Murmur
//
//  Created by Garry Fanata on 12/1/18.
//  Copyright © 2018 Garry Fanata. All rights reserved.
//

import UIKit
import Alamofire

let baseURL = "http://104.210.50.150:5000/"

class TableViewController: UITableViewController {

    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.estimatedRowHeight = 88.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        refresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.cellTitle.text = posts[indexPath.row].title
        cell.cellDesc.text = posts[indexPath.row].text
        cell.time.text = posts[indexPath.row].time
        cell.user.text = posts[indexPath.row].user
        let randNum = arc4random_uniform(400)
        var doubRandNum = Double(randNum)
        if randNum > 1000 {
            doubRandNum /= 1000.0
            cell.votes.text = String(format: "%.1fk Zoots", doubRandNum)
        } else {
            cell.votes.text = "\(randNum) Zoots"
        }
        cell.upvotebutton.setImage(UIImage(named: "petr-template-copy"), for: .selected)
        cell.downvotebutton.setImage(UIImage(named: "petr-template-cry"), for: .selected)
        return cell
    }
    
    func refresh() {
        Alamofire.request("\(baseURL)getAll").responseJSON { response in
            
            if let json = response.result.value as? NSArray {
                self.posts.removeAll()
                for entry in json {
                    let entry = entry as! NSDictionary
                    var time = entry.value(forKey: "time") as! String
                    time.removeLast(7)
                    let post = Post(title: entry.value(forKey: "title") as! String, text: entry.value(forKey: "text") as! String, user: entry.value(forKey: "user") as! String, time: time)
                    
                    self.posts.append(post)
                }
                self.tableView.reloadData()
            }
        }
    }
    @IBAction func refreshposts(_ sender: UIBarButtonItem) {
        refresh()
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
        refresh()
    }
}
