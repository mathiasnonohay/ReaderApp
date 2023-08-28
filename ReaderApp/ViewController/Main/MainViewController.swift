//
//  MainViewController.swift
//  MarxistApp
//
//  Created by Mathias Nonohay on 24/08/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let viewModel: AuthorListViewModel = AuthorListViewModel()
    
    lazy var tableView: UITableView = {
        let tbView = UITableView()
        tbView.translatesAutoresizingMaskIntoConstraints = false
        return tbView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Autores"
        setupTableView()
        setupConstraints()
        setNavBar()
    }
    
    private func setNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AuthorTableViewCell.self, forCellReuseIdentifier: "AuthorTableViewCell")
        tableView.reloadData()
    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.authorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorTableViewCell", for: indexPath) as? AuthorTableViewCell else { return UITableViewCell() }
        
        cell.setupCell(with: viewModel.authorList[indexPath.row])
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.authorList[indexPath.row]
        let vc = AuthorWorkListViewController(model: model)
        navigationController?.pushViewController(vc, animated: true)
    }
}

