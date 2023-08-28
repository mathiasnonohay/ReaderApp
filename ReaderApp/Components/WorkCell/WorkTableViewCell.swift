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
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var workYear: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var arrowEnterView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "doc.text.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(title)
        contentView.addSubview(workYear)
        contentView.addSubview(arrowEnterView)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            arrowEnterView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            arrowEnterView.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 10),
            arrowEnterView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            arrowEnterView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            
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
