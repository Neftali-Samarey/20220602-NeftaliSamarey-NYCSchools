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

        DispatchQueue.main.async {
            self.coordinator.showIndicator()
        }

        coordinator.fetchSchools()

        // Performing a sort for the result data source, then we assign the sorted data onto the main datasource
        coordinator.completionHandler = { result in
            let sortedSchools = result.sorted() { $0.school_name < $1.school_name }
            self.datasource = sortedSchools
        }
    }
}

// MARK: - UITableView Datasource
extension SchoolsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")

        let schools = datasource[indexPath.item]
        cell?.textLabel?.text = schools.school_name
        cell?.accessoryType = .disclosureIndicator

        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableView Deleate
extension SchoolsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data = datasource[indexPath.item]
        coordinator.pushSchoolDetails(with: data)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

