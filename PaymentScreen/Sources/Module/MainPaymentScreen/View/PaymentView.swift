import UIKit

final class PaymentView: UIView {
    
    // MARK: - UI Elements
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        return tableView
    }()
    
    lazy var mainTitleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Приложение платное"
        label.font = UIFont(name: ".SFPro-Display", size: 26 )
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Выберите удобный способ оплаты"
        label.numberOfLines = 2
        label.font = UIFont(name: ".SFPro-Display", size: 18 )
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addSubView()
        setupConstraints()
        
        tableView.register(PaymentTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Setup Constrains

extension PaymentView {
    
    func addSubView() {
        addSubview(mainTitleLabel)
        addSubview(subTitleLabel)
        addSubview(tableView)
        
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            mainTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant:76),
            mainTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant:16),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:40),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-40),
            
            tableView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant:48),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}


// MARK: - Constant Constraints

private extension CGFloat {
    
    static let imageViewAnchor: CGFloat = 30
    static let topAnchor: CGFloat = 10
    static let trailingMargin: CGFloat = -10
}

