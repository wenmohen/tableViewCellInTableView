//
//  OrderDetailSetMealTableViewCell.swift
//  try
//
//  Created by ning on 2018/11/8.
//  Copyright © 2018年 ning. All rights reserved.
//

import UIKit

class OrderDetailSetMealTableViewCell: UITableViewCell {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewConstraintHeight: NSLayoutConstraint!
    
    var foods: [FoodEntity] = [] {
        didSet {
            tableView.reloadData()
            ///立即刷新
            layoutIfNeeded()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        tableViewConstraintHeight.constant = tableView.contentSize.height
    }
    
}
private extension OrderDetailSetMealTableViewCell {
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
   
}

extension OrderDetailSetMealTableViewCell: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return foods.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods[section].dishes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailSetMealTitleTableViewCell") as? OrderDetailSetMealDishesTableViewCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = foods[indexPath.section].name

            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailSetMealDishesTableViewCell") as? OrderDetailSetMealDishesTableViewCell else {
                return UITableViewCell()
            }
            let dishes = foods[indexPath.section].dishes
            let dish = dishes[indexPath.row]
            let quantity = dish.quantity ?? ""
            let quantityStr = quantity.count > 0 ? " (\(quantity))" : ""
            cell.titleLabel.text = (dish.name ?? "") + quantityStr
            cell.subtitleLabel.text = dish.price
            
            return cell
        }

    }
}

