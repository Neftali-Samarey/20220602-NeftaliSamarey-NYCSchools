//
//  ViewController.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/2/22.
//

import UIKit

class SchoolsViewController: UIViewController {

    var datasource: [Schools] = [] {
        didSet {
            coordinator.reloadData()
        }
    }

    private lazy var coordinator = SchoolsCoordinator(viewController: self)

    override func viewDidLoad() {
        super.viewDidLoad()

        coordinator.configure()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        coordinator.fetchSchools()

        coordinator.completionHandler = { result in
            self.datasource = result
        }
    }
}

extension SchoolsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")

        let schools = datasource[indexPath.item]
        cell?.textLabel?.text = schools.school_name

        return cell ?? UITableViewCell()
    }
}

extension SchoolsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

