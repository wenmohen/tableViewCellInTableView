//
//  ViewController.swift
//  try
//
//  Created by ning on 2018/11/8.
//  Copyright © 2018年 ning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var foods = OrderEntity().foods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    ///布局改变后刷新tableView，必须加上，和cell里的layoutIfNeeded()、layoutSubviews()都不可缺少
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.reloadData()
    }
}

private extension ViewController {
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if section == 0 {
            return 1
        }else {
            return 2
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && indexPath.section != 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailTitle") else { return UITableViewCell() }
            return cell
        }else if indexPath.section == 3 && indexPath.row != 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailSetMealTableViewCell") as? OrderDetailSetMealTableViewCell else {
                return UITableViewCell()
            }
            cell.foods = foods
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailContent") else { return UITableViewCell() }
            return cell
        }
        
    }
    
    
}

