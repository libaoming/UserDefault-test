//
//  ViewController.swift
//  Default-are-fun
//
//  Created by 李宝明 on 16/8/18.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var favLbl: UILabel!
    
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let person1 = Person(firstName: "慧", lastName: "周")
        let person2 = Person(firstName: "慧2", lastName: "周")
        let person3 = Person(firstName: "慧3", lastName: "周")
        
        people.append(person1)
        people.append(person2)
        people.append(person3)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
        
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            favLbl.text = "you fav color : \(color)"
        }else {
            favLbl.text = "pick a color "
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func yellow(sender: AnyObject) {
        
        self.favLbl.text = "you fav color: yellow "
        NSUserDefaults.standardUserDefaults().setValue("yellow", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if let loadPeople = NSUserDefaults.standardUserDefaults().valueForKey("people") as? NSData {
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadPeople) as? [Person] {
                
                for people in peopleArray {
                    print(people.firstName)
                }
                
            }
        }
        
        
        
        
        
    }

    
    @IBAction func blue(sender: AnyObject) {
        self.favLbl.text = "you fav color: blue "
        NSUserDefaults.standardUserDefaults().setValue("blue", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
        

        
    }
    
    
    @IBAction func red(sender: AnyObject) {
        self.favLbl.text = "you fav color: red "
        NSUserDefaults.standardUserDefaults().setValue("red", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()

        
    }
    
    
}

