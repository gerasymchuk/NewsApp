//
//  SourceViewController.swift
//  NewsApp
//
//  Created by Misha on 08.09.2021.
//

import UIKit

class SourceViewController: UIViewController {

    @IBOutlet weak var sourceTableView: UITableView!
    
    let viewModel = NewsResponseViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sourceTableView.register(UITableViewCell.self, forCellReuseIdentifier: "source")

        sourceTableView.dataSource = self
        
        fetchSources()
    }
    
    func fetchSources() {
        viewModel.getSource { (_) in
            DispatchQueue.main.async {
                self.sourceTableView.reloadData()
            }
        }
    }
}

extension SourceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sourceVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "source", for: indexPath) as UITableViewCell
        let sourceVM = viewModel.sourceVM[indexPath.row]
        cell.textLabel?.text = sourceVM.name
        return cell
        
    }
}
