import UIKit

final class PaymentCollectionViewCell: UICollectionViewCell {
    
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
    
    private var checkmark: UIImageView = {
        let image = UIImage(named: "Path")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        castomizeCell()
        addSubView()
        setupConstraints()
        showMark()
        hideMark()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17))
    }
    
    
    // MARK: - Private Methods
    
    private func castomizeCell () {
        
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor(red: 236 / 255, green: 240 / 255, blue: 243 / 255, alpha: 1)
    }
    
     func showMark() {
         setupSelected()
        checkmark.isHidden = false
        contentView.backgroundColor = UIColor(red: 37 / 255, green: 217 / 255, blue: 119 / 255, alpha: 1)
    }
    
     func hideMark() {
        checkmark.isHidden = true
        contentView.backgroundColor = UIColor(red: 236 / 255, green: 240 / 255, blue: 243 / 255, alpha: 1)
    }
}

// MARK: - Setup Constrains

private extension PaymentCollectionViewCell {
    
    func addSubView() {
        contentView.addSubview(monthsLabel)
        contentView.addSubview(checkmark)
        contentView.addSubview(priceLabel)
        contentView.addSubview(subscriptionLabel)
        
        monthsLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        subscriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        checkmark.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            monthsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            monthsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            
            checkmark.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19),
            checkmark.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            
            subscriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 16),
            subscriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            subscriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
        ])
    }
    
    func setupSelected() {
        
        NSLayoutConstraint.activate([
        monthsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        monthsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 48),
        
        checkmark.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19),
        checkmark.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
        ])
    }
    
}
// MARK: - Constant Constraints

//extension CGFloat {
//    static let leadingTrailingSize: CGFloat = 10
//    static let newsImageViewTrailingAnchor: CGFloat = 20
//    static let newsImageViewSizeAnchor: CGFloat = 130
//    static let subTitleLabelTopAnchor: CGFloat = 65
//}




