//
//  ChooseRoomTableViewController.swift
//  Hotel Monzana
//
//  Created by Bertran on 21.10.2018.
//  Copyright © 2018 Bertran. All rights reserved.
//

import UIKit

class ChooseRoomTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenRoomTypeID = indexPath.row
        print(choosenRoomTypeID)
    }

}
