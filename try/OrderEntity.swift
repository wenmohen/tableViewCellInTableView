//
//  OrderEntity.swift
//  try
//
//  Created by ning on 2018/11/8.
//  Copyright © 2018年 ning. All rights reserved.
//

import Foundation
class OrderEntity {
    var foods: [FoodEntity] = []
    init() {
        self.foods = [FoodEntity.init("凉菜", [FoodEntity.Dish.init("花生米", "2份", "$10"),
                                                 FoodEntity.Dish.init("皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮", "1份", "$15"),
                                                 FoodEntity.Dish.init("拍黄瓜", "1份", "$5"),FoodEntity.Dish.init("拍黄瓜", "1份", "$5"),FoodEntity.Dish.init("拍黄瓜", "1份", "$5")]),FoodEntity.init("凉菜", [FoodEntity.Dish.init("花生米", "2份", "$10"),
                                                                                                                                                                                                                              FoodEntity.Dish.init("皮蛋", "1份", "$15"),
                                                                                                                                                                                                                              FoodEntity.Dish.init("拍黄瓜", "1份", "$5"),FoodEntity.Dish.init("拍黄瓜", "1份", "$5"),FoodEntity.Dish.init("拍黄瓜", "1份", "$5")]),FoodEntity.init("凉菜", [FoodEntity.Dish.init("花生米", "2份", "$10"),
                                                                                                                                                                                                                                                                                                                                                                                                           FoodEntity.Dish.init("皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐皮蛋豆腐", "1份", "$15"),
                                                                                                                                                                                                                                                                                                                                                                                                           FoodEntity.Dish.init("拍黄瓜", "1份", "$5"),FoodEntity.Dish.init("拍黄瓜", "1份", "$5"),FoodEntity.Dish.init("拍黄瓜", "1份", "$5")]),FoodEntity.init("主菜", [FoodEntity.Dish.init("酸菜鱼", "1份", "$60"),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          FoodEntity.Dish.init("红烧茄子", "1份", "$25"),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          FoodEntity.Dish.init("山药排骨汤", "1份", "$35"),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          FoodEntity.Dish.init("鸡公煲", "1份", "$45")])]
//                self.foods = [FoodEntity.init("凉菜", [FoodEntity.Dish.init("花生米", "2份", "$10"),
//                                                         FoodEntity.Dish.init("皮蛋豆腐", "1份", "$15"),
//                                                         FoodEntity.Dish.init("拍黄瓜", "1份", "$5")]),
//                              FoodEntity.init("主菜", [FoodEntity.Dish.init("酸菜鱼", "1份", "$60"),
//                                                         FoodEntity.Dish.init("红烧茄子", "1份", "$25"),
//                                                         FoodEntity.Dish.init("山药排骨汤", "1份", "$35"),
//                                                         FoodEntity.Dish.init("鸡公煲", "1份", "$45")])]
    }
}
///菜式
class FoodEntity {
    var name: String?
    var dishes: [Dish] = []
    init(_ name: String, _ dishes: [Dish]) {
        self.name = name
        self.dishes = dishes
    }
}
///菜品
extension FoodEntity {
    class Dish {
        var name: String?
        var quantity: String?
        var price: String?
        init(_ name: String, _ quantity: String, _ price: String) {
            self.name = name
            self.quantity = quantity
            self.price = price
        }
    }
}
