//
//  TableViewCell.swift
//  Murmur
//
//  Created by Garry Fanata on 12/1/18.
//  Copyright © 2018 Garry Fanata. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var cellTitle: UILabel!
    @IBOutlet var cellDesc: UILabel!
    
    @IBOutlet var votes: UILabel!
    
    @IBOutlet var upvotebutton: UIButton!
    @IBOutlet var downvotebutton: UIButton!
    
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var time: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func upvotepress(_ sender: UIButton) {
        var v = votes.text!
        v.removeLast(6)
 
        if downvotebutton.state != .selected{
            print(sender.state)
            if sender.isSelected{
                if let vote = Int(v) {
                    votes.text = String(vote-1) + " Zoots"
                }
            } else{
                if let vote = Int(v) {
                    votes.text = String(vote+1) + " Zoots"
                }
            }
            
            sender.isSelected = !sender.isSelected
        }
        
    }
    @IBAction func downvotepress(_ sender: UIButton) {
        var v = votes.text!
        v.removeLast(6)
        print("lol")
        if upvotebutton.state != .selected{
            
            
            if sender.isSelected {
                if let vote = Int(v) {
                    votes.text = String(vote+1) + " Zoots"
                }
            } else {
                if let vote = Int(v) {
                    votes.text = String(vote-1) + " Zoots"
                }
            }
            
            
            
            
            sender.isSelected = !sender.isSelected
        }
    }

}
