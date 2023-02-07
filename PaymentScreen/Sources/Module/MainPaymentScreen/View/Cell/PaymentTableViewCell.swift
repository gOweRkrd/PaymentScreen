//
//  PaymentTableViewCell.swift
//  PaymentScreen
//
//  Created by Александр Косяков on 07.02.2023.
//

import UIKit

final class PaymentTableViewCell: UITableViewCell {
    
    var data: DataModel? {
        didSet {
            guard let data = data else { return }
            monthsLabel.text = data.monthsLabel
            priceLabel.text = data.priceLabel
            subscriptionLabel.text = data.subscriptionLabel
        }
    }

    
    // MARK: - UI Elements
    
    private var monthsLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private var priceLabel: UILabel = {
        
        let label = UILabel()
        label.text = "1990 руб."
        label.font = .systemFont(ofSize: 24 , weight: .semibold)
        return label
    }()
    
    private var subscriptionLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Пробный период 3 дня,бесплатная \n отмена"
        label.font = .systemFont(ofSize: 16 , weight: .regular)
        label.numberOfLines = 2
        label.textColor = UIColor.lightGray
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        castomizeCell()
        addSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 17, bottom: 16, right: 17))
    }
    
    private func castomizeCell () {
        
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor(red: 236 / 255, green: 240 / 255, blue: 243 / 255, alpha: 1)
    }
}

// MARK: - Setup Constrains

private extension PaymentTableViewCell {
    
    func addSubView() {
        contentView.addSubview(monthsLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(subscriptionLabel)
        
        monthsLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        subscriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            monthsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            monthsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            
            subscriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 16),
            subscriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            subscriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
           
        ])
    }
}

// MARK: - Constant Constraints

extension CGFloat {
    static let leadingTrailingSize: CGFloat = 10
    static let newsImageViewTrailingAnchor: CGFloat = 20
    static let newsImageViewSizeAnchor: CGFloat = 130
    static let subTitleLabelTopAnchor: CGFloat = 65
}




