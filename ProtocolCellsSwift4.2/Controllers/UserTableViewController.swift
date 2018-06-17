//
//  UserTableViewController.swift
//  ProtocolCellsSwift4.2
//
//  Created by Erick Barbosa on 6/16/18.
//  Copyright © 2018 Erick Barbosa. All rights reserved.
//

import UIKit

enum CellIdentifier: String, CaseIterable {
  case firstName = "FirstNameCell"
  case middleName = "MiddleNameCell"
  case lastName = "LastNameCell"
}

class UserTableViewController: UITableViewController {
  let user: [User] = [User.init(),User.init(),User.init()]

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return user.count
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return CellIdentifier.allCases.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let identifier = CellIdentifier.allCases[indexPath.row].rawValue
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

    if let cellProtocol = cell as? ConfigureCellProtocol {
      cellProtocol.configureCell(data: user[indexPath.row])
    }
    return cell
  }
}
extension UserTableViewController: CellDelegate {
  func tapped() {
    print("delegate tapped")
  }
}
