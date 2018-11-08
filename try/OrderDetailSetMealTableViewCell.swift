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
    
    var foods: [FoodEntity] = []
    var tips: [FoodEntity] = []
    var type = 0 {
        didSet {
            tableView.reloadData()
            ///立即刷新
            layoutIfNeeded()
        }
    }
    
    var didRefresh:((_ height: CGFloat)->())?
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
        print(tips.count)
        print("-----layoutSubviews------")
        tableViewConstraintHeight.constant = tableView.contentSize.height
        didRefresh?(tableViewConstraintHeight.constant)
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
        return type == 0 ? foods.count : tips.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return type == 0 ? foods[section].dishes.count : tips[section].dishes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailSetMealTitleTableViewCell") as? OrderDetailSetMealDishesTableViewCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = type == 0 ? foods[indexPath.section].name : tips[indexPath.section].name

            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailSetMealDishesTableViewCell") as? OrderDetailSetMealDishesTableViewCell else {
                return UITableViewCell()
            }
            let dishes = type == 0 ? foods[indexPath.section].dishes : tips[indexPath.section].dishes
            let dish = dishes[indexPath.row]
            let quantity = dish.quantity ?? ""
            let quantityStr = quantity.count > 0 ? " (\(quantity))" : ""
            cell.titleLabel.text = (dish.name ?? "") + quantityStr
            cell.subtitleLabel.text = dish.price
            
            return cell
        }

    }
}

