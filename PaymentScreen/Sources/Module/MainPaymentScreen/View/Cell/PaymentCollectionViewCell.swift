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
    
    var subscriptionLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Пробный период 3 дня,бесплатная \n отмена"
        label.font = Fonts.SFProDisplay.regular.font(size: 16)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 109 / 255, green: 120 / 255, blue: 133 / 255, alpha: 1)
        return label
    }()
    
    private var monthsLabel: UILabel = {
        
        let label = UILabel()
        label.font = Fonts.SFProDisplay.bold.font(size: 20)
        label.textColor = .black
        return label
    }()
    
    private var priceLabel: UILabel = {
        
        let label = UILabel()
        label.text = "1990 руб."
        label.font = Fonts.SFProDisplay.heavy.font(size: 24)
        label.textColor = .black
        return label
    }()
    
    private var checkmark: UIImageView = {
        let image = UIImage(named: "Path")
        let imageView = UIImageView(image: image)
        imageView.isHidden = true
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        castomizeCell()
        addSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17))
    }
    
    // MARK: - Public Methods
    
    func selected(isSelected: Bool = false) {
            checkmark.isHidden = !isSelected
            monthsLabel.removeFromSuperview()
            contentView.addSubview(monthsLabel)
            
            if isSelected {
                contentView.backgroundColor = UIColor(red: 37 / 255, green: 217 / 255, blue: 119 / 255, alpha: 1)
                setupConstraintsIsSelected()
                subscriptionLabel.textColor = UIColor.black
            } else {
                contentView.backgroundColor = UIColor(red: 236 / 255, green: 240 / 255, blue: 243 / 255, alpha: 1)
                setupConstraints()
                subscriptionLabel.textColor = UIColor.lightGray
            }
        }
    
    // MARK: - Private Methods
    
    private func castomizeCell () {
        
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor(red: 236 / 255, green: 240 / 255, blue: 243 / 255, alpha: 1)
    }
}

// MARK: - Setup Constrains

private extension PaymentCollectionViewCell {
    
    func addSubView() {
        contentView.addSubviews([monthsLabel, checkmark, priceLabel, subscriptionLabel])
    }
    
    func setupConstraints() {
            
            NSLayoutConstraint.activate([
                
                monthsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .AnchorSize),
                monthsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .AnchorSize),
                
                checkmark.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .checkmarkTopAnchor),
                checkmark.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .AnchorSize),

                priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .AnchorSize),
                priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.AnchorSize),
                
                subscriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: .AnchorSize),
                subscriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .AnchorSize),
                subscriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.AnchorSize)
            ])
        }
    
    func setupConstraintsIsSelected() {
            
            NSLayoutConstraint.activate([
                monthsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .AnchorSize),
                monthsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .monthsLabelLeadingAnchor)
            ])
        }
}
// MARK: - Constant Constraints

private extension CGFloat {
    static let AnchorSize: CGFloat = 16
    static let checkmarkTopAnchor: CGFloat = 19
    static let monthsLabelLeadingAnchor: CGFloat = 48
}
