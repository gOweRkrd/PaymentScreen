//
//  PaymentTableViewCell.swift
//  PaymentScreen
//
//  Created by Александр Косяков on 07.02.2023.
//

import UIKit

final class PaymentTableViewCell: UITableViewCell {

    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        castomizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func castomizeCell () {
        
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor(red: 236 / 255, green: 240 / 255, blue: 243 / 255, alpha: 1)
        

    }
}

