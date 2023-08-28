//
//  AuthorView.swift
//  ReaderApp
//
//  Created by Mathias Nonohay on 28/08/2023.
//

import UIKit

class AuthorView: UIView {
    
    private var isShowMore: Bool = false
    
    lazy var portraitView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var authorName: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    lazy var lifePeriod: UILabel = {
        let lbl = UILabel()
        lbl.font = .italicSystemFont(ofSize: 10)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 4
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.contentMode = .topLeft
        lbl.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(showMoreLabel))
        lbl.addGestureRecognizer(tap)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func showMoreLabel() {
        descriptionLabel.numberOfLines = isShowMore ?  4 : 0
        UIView.animate(withDuration: 0.5) {
            self.descriptionLabel.superview?.layoutIfNeeded()
        }
        isShowMore = !isShowMore
    }
    
    func setupView(with viewModel: AuthorViewModel) {
        portraitView.image = viewModel.portrait
        authorName.text = viewModel.authorName
        lifePeriod.text = viewModel.period
        descriptionLabel.text = viewModel.description
        
        
        self.backgroundColor = .white
    }
    
    private func configureConstraints() {
        self.addSubview(portraitView)
        self.addSubview(authorName)
        self.addSubview(lifePeriod)
        self.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            portraitView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            portraitView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            authorName.topAnchor.constraint(equalTo: portraitView.bottomAnchor, constant: 10),
            authorName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            authorName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            lifePeriod.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 8),
            lifePeriod.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: lifePeriod.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            
        ])
        
        
    }
}
