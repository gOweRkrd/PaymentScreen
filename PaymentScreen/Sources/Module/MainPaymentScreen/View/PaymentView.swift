import UIKit

final class PaymentView: UIView {
    
    // MARK: - UI Elements
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.separatorColor = .clear
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
        label.text = "Выберите удобный для вас способ \n оплаты"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = UIColor.lightGray
        label.font = UIFont(name: ".SFPro-Display", size: 18 )
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var subscribeButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Оформить подписку", for: .normal)
        button.backgroundColor = .black
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var byLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Восстановить покупки"
        label.font = UIFont(name: ".SFPro-Display", size: 16 )
        label.textColor = UIColor.lightGray
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
        addSubview(subscribeButton)
        addSubview(byLabel)
        
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        byLabel.translatesAutoresizingMaskIntoConstraints = false
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
            tableView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.42),
            
            subscribeButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant:98),
            subscribeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            subscribeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
            subscribeButton.heightAnchor.constraint(equalToConstant: 50),
            
            byLabel.topAnchor.constraint(equalTo: subscribeButton.bottomAnchor, constant:25),
            byLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
  
        ])
    }
}


// MARK: - Constant Constraints

private extension CGFloat {
    
    static let imageViewAnchor: CGFloat = 30
    static let topAnchor: CGFloat = 10
    static let trailingMargin: CGFloat = -10
}

