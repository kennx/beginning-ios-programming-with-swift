//
//  RestaurantDiffableDataSource.swift
//  FoodPin
//
//  Created by 张剑 on 2021/8/7.
//

import UIKit

enum Section {
    case all
}

class RestaurantDiffableDataSource: UITableViewDiffableDataSource<Section, Restaurant> {

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

}
