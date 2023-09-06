//
//  AuthorWorkListViewController.swift
//  ReaderApp
//
//  Created by Mathias Nonohay on 24/08/2023.
//

import UIKit

class AuthorWorkListViewController: UIViewController {
    
    var viewModel: AuthorViewModel?
    
    lazy var workTableView: UITableView = {
        let tbView = UITableView()
        tbView.translatesAutoresizingMaskIntoConstraints = false
        return tbView
    }()
    
    lazy var authorPresentationView: AuthorView = {
        let view = AuthorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(model: AuthorResponseElement) {
        self.viewModel = AuthorViewModel(author: model)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupTableView()
    }
    
    private func setupTableView() {
        workTableView.dataSource = self
        workTableView.delegate = self
        workTableView.register(WorkTableViewCell.self, forCellReuseIdentifier: "WorkTableViewCell")
        workTableView.reloadData()
    }
    
    private func configureView() {
        guard let viewModel else { return }
        authorPresentationView.setupView(with: viewModel)
        
        self.view.addSubview(workTableView)
        self.view.addSubview(authorPresentationView)
        
        NSLayoutConstraint.activate([
            authorPresentationView.topAnchor.constraint(equalTo: self.view.topAnchor),
            authorPresentationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            authorPresentationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            workTableView.topAnchor.constraint(equalTo: authorPresentationView.bottomAnchor),
            workTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            workTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            workTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension AuthorWorkListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PDFViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension AuthorWorkListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = viewModel?.works?.count else { return 0 }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let work = viewModel?.works?[indexPath.row],
              let cell = tableView.dequeueReusableCell(withIdentifier: "WorkTableViewCell", for: indexPath) as? WorkTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setupCell(with: work)
        
        return cell
    }
}
