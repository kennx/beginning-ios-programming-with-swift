//
//  Restaurant.swift
//  FoodPin
//
//  Created by 张剑 on 2021/8/7.
//

import Foundation

struct Restaurant: Hashable {
  var name: String = ""
  var type: String = ""
  var location: String = ""
  var image: String = ""
  var isFavorite: Bool = false
}
