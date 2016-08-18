//
//  Person.swift
//  Default-are-fun
//
//  Created by 李宝明 on 16/8/18.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    
    var firstName: String!
    var lastName: String!
    
    init(firstName: String, lastName: String){
        
        self.firstName = firstName
        self.lastName = lastName
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.firstName = aDecoder.decodeObjectForKey("firstName") as? String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as? String
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
    }
}