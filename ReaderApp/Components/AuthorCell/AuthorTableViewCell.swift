//
//  AuthorTableViewCell.swift
//  ReaderApp
//
//  Created by Mathias Nonohay on 24/08/2023.
//

import UIKit

class AuthorTableViewCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        return lbl
    }()
    
    private lazy var periodLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .systemGray
        lbl.font = .systemFont(ofSize: 10)
        return lbl
    }()
    
    private lazy var gradientView: UIView = {
        let view = UIView()
        view.frame = contentView.bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var portraitView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(periodLabel)
        contentView.addSubview(gradientView)
        contentView.addSubview(portraitView)
        
        contentView.sendSubviewToBack(portraitView)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            periodLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            periodLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            periodLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1),
            
            gradientView.topAnchor.constraint(equalTo: contentView.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            gradientView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            portraitView.topAnchor.constraint(equalTo: gradientView.topAnchor),
            portraitView.bottomAnchor.constraint(equalTo: gradientView.bottomAnchor),
            portraitView.leadingAnchor.constraint(equalTo: gradientView.leadingAnchor),
            portraitView.trailingAnchor.constraint(equalTo: gradientView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with author: Author) {
        nameLabel.text = author.name
        periodLabel.text = author.lifePeriod
        portraitView.image = author.portrait
        setupGradient()
    }
    
    private func setupGradient() {
        portraitView.contentMode = .redraw
        
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.colors = [contentView.backgroundColor?.cgColor ?? UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientView.layer.insertSublayer(gradient, at: 10)
    }
    
}
