//
//  SearchViewController.swift
//  NewsApp
//
//  Created by Misha on 09.09.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let viewModel = NewsResponseViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "article")
        searchBar.delegate = self
    }
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articleVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "article", for: indexPath) as! ArticleCell
        let article = viewModel.articleVM[indexPath.row]
        cell.articleVM = article
        return cell
        
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleWebView = ArticleWebViewController()
        articleWebView.urlString = viewModel.articleVM[indexPath.row].url
        present(articleWebView, animated: true, completion: nil)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        viewModel.search(with: searchText) { (_) in
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
        }
    }
}
