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
    var tips: [FoodEntity] = []
    var height: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
//        self.tips = OrderEntity().foods
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(10)) {
            self.tips = OrderEntity().foods
            self.tableView.reloadData()
//            self.tableView.layoutIfNeeded()
//            self.loadViewIfNeeded()
            self.view.layoutIfNeeded()
        }
    }
    ///布局改变后刷新tableView，必须加上，和cell里的layoutIfNeeded()、layoutSubviews()都不可缺少
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("-----viewDidLayoutSubviews------")
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
        }
//        else if indexPath.section == 3 && indexPath.row != 0{
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailSetMealTableViewCell") as? OrderDetailSetMealTableViewCell else {
//                return UITableViewCell()
//            }
//            cell.foods = foods
//            cell.type = 0
//            return cell
//        }
        else if indexPath.section == 2 && indexPath.row != 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailSetMealTableViewCell") as? OrderDetailSetMealTableViewCell else {
                return UITableViewCell()
            }
            cell.tips = tips
            cell.type = 1
            cell.didRefresh = { tempHeight in
                if self.height != tempHeight {
                    self.height = tempHeight
                    self.viewDidLayoutSubviews()
                }
            }
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailContent") else { return UITableViewCell() }
            return cell
        }
        
    }
    
    
}

