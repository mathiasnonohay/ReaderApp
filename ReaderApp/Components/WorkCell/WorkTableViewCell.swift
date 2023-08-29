//
//  WorkTableViewCell.swift
//  ReaderApp
//
//  Created by Mathias Nonohay on 28/08/2023.
//

import UIKit

class WorkTableViewCell: UITableViewCell {
    
    lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var workYear: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 14, weight: .light)
        return lbl
    }()
    
    lazy var imageContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    lazy var readWorkImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "book.circle")
        view.contentMode = .redraw
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(title)
        contentView.addSubview(workYear)
        contentView.addSubview(imageContentView)
        imageContentView.addSubview(readWorkImageView)
        
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            imageContentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageContentView.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 10),
            imageContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imageContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageContentView.widthAnchor.constraint(equalTo: readWorkImageView.widthAnchor),
            
            readWorkImageView.centerXAnchor.constraint(equalTo: imageContentView.centerXAnchor),
            readWorkImageView.centerYAnchor.constraint(equalTo: imageContentView.centerYAnchor),
            readWorkImageView.heightAnchor.constraint(equalToConstant: 30),
            readWorkImageView.widthAnchor.constraint(equalToConstant: 30),
            
            workYear.topAnchor.constraint(equalTo: title.bottomAnchor),
            workYear.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            workYear.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with model: Work) {
        title.text = model.title
        workYear.text = model.date
    }
    
}
