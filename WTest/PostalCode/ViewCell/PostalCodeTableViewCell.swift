//
//  PostalCodeTableViewCell.swift
//  WTest
//
//  Created by Raphael Alkamim on 24/09/22.
//

import Foundation
import UIKit

class PostalCodeTableViewCell: UITableViewCell {
    static let identifier = "postalCodeCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var postalCode: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "TextColor")
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "####-###"
        return label
    }()
    
    lazy var postalDesignation: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "TextColor")
        label.font = .systemFont(ofSize: 20)
        label.text = "Designação Postal"
        return label
    }()
}

extension PostalCodeTableViewCell {
    func setup() {
        contentView.addSubview(postalCode)
        contentView.addSubview(postalDesignation)
        setupConstraints()
    }
    
    func setupConstraints() {
        postalCode.translatesAutoresizingMaskIntoConstraints = false
        postalCode.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        postalCode.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        postalCode.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true

        
        postalDesignation.translatesAutoresizingMaskIntoConstraints = false
        postalDesignation.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        postalDesignation.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        postalDesignation.leadingAnchor.constraint(equalTo: postalCode.trailingAnchor, constant: 16).isActive = true
        postalDesignation.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
    }
}
