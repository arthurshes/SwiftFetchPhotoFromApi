//
//  ListTableViewController.swift
//  Weather
//
//  Created by Артур Шестаков on 12.03.2023.
//

import UIKit

class ListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
let urlString="https://api.weather.yandex.ru/v2/forecast?"
    }
//    3bca7703-0c54-422f-8552-e55bf89f7832
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)



        return cell
    }

}
