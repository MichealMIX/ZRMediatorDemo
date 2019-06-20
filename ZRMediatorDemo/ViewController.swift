//
//  ViewController.swift
//  ZRMediatorDemo
//
//  Created by 郑锐 on 2019/5/29.
//  Copyright © 2019 郑锐. All rights reserved.
//

import UIKit
import ZRHomepageModular
import ZRFamilyModular

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let controller = CTMediator.sharedInstance()?.A_HomePageModular_Swift_ViewController{ (result) in
                print(result)
            }
            navigationController?.pushViewController(controller!, animated: true)
        }
        
        if indexPath.row == 1 {
            
            let someDict =  ["zrString": "我是你爹"]
            
            
            let controller = CTMediator.sharedInstance()?.a_FamilyModular_Objc_ViewController(callback: { (result) in
                //这里输出回调函数
                print(result)
            }, andParam: someDict)
            
            
            navigationController?.pushViewController(controller!, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = dataSource[indexPath.row]
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    // MARK: Getters and Setters
    lazy var tableView : UITableView = {
        let _tableView = UITableView(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain)
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return _tableView
    }()
    
    lazy var dataSource = [
        "进入swift模块",
        "进入OC模块",
    ]


}

