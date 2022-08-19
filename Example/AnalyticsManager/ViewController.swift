//
//  ViewController.swift
//  AnalyticsManager
//
//  Created by white on 08/18/2022.
//  Copyright (c) 2022 white. All rights reserved.
//

import UIKit
import AnalyticsManager

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(test), for: .touchUpInside)
        button.analytics.properties = [
            "module": "page_main_teacher",
            "module_event": "click_check_homework",
            "key": "values"
        ]
        
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @objc
    private func test() {
        print("test")
    }
}

