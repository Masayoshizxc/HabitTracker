//
//  ViewController.swift
//  HabitsTracker
//
//  Created by Adilet on 10/5/23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 68/255, green: 99/255, blue: 99/255, alpha: 1)
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        
    }
    
}
