//
//  ViewController.swift
//  NewsApp
//
//  Created by Misha on 06.09.2021.
//

import UIKit
import BTNavigationDropdownMenu

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = NewsResponseViewModel()
    let categories = ["Business", "Entertainment", "General", "health", " Science", "Sports", "Technology"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "article")
        setupDropdownMenu()
        
        fetchArticles()
        
    }
    
    func setupDropdownMenu() {
        let menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: BTTitle.title("Headlines"), items: categories)
        menuView.arrowImage = UIImage(systemName: "chevron.down")
        menuView.arrowTintColor = .black
        menuView.cellHeight = 45
        menuView.cellBackgroundColor = .white
        menuView.cellSeparatorColor = .lightGray
        menuView.cellTextLabelFont = UIFont.systemFont(ofSize: 17, weight: .regular)
        menuView.cellTextLabelAlignment = .center
        
        navigationItem.titleView = menuView
        
    }
    
    func fetchArticles() {
        viewModel.getArticle { (_) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension MainViewController: UITableViewDataSource {
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

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleWebView = ArticleWebViewController()
        articleWebView.urlString = viewModel.articleVM[indexPath.row].url
        present(articleWebView, animated: true, completion: nil)
    }
}


