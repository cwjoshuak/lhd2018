//
//  Post.swift
//  Murmur
//
//  Created by Joshua Kuan on 12/1/18.
//  Copyright © 2018 Garry Fanata. All rights reserved.
//

import Foundation

class Post {

    var title: String?
    var text: String?
    var user: String?
    var time: String?
    
    init(title: String, text: String, user: String, time: String) {
        self.title = title
        self.text = text
        self.user = user
        self.time = time
    }
}
