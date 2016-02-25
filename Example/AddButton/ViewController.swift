//
//  ViewController.swift
//  AddButton
//
//  Created by Sven Bacia on 02/24/2016.
//  Copyright (c) 2016 Sven Bacia. All rights reserved.
//

import UIKit
import AddButton

class ViewController: UIViewController {
  
  @IBOutlet weak var button: AddButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // add a border when needed
    // button.border(width: 4.0, color: UIColor.blackColor(), cornerRadius: 8.0)
  }
  
  @IBAction func addButtonTapped(sender: AddButton) {
    sender.added = !sender.added
  }
}

