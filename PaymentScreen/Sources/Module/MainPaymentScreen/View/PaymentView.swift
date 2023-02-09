import UIKit

final class PaymentView: UIView {
    
    private let spacing: CGFloat = 16.0
    
    // MARK: - UI Elements
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var mainTitleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Приложение платное"
        label.font = Fonts.SFProDisplay.black.font(size: 26)
        label.textColor = .black
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Выберите удобный для вас способ \n оплаты"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = UIColor(red: 109 / 255, green: 120 / 255, blue: 133 / 255, alpha: 1)
        label.font = Fonts.SFProDisplay.regular.font(size: 18)
        return label
    }()
    
    lazy var subscribeButton: LoaderButton = {
        
        let button = LoaderButton()
        button.setTitle("Оформить подписку", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = Fonts.SFProDisplay.semibold.font(size: 16)
        button.layer.masksToBounds = true
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var byButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Восстановить покупки", for: .normal)
        button.setTitleColor(UIColor(red: 153 / 255, green: 162 / 255, blue: 173 / 255, alpha: 1), for: .normal)
        button.titleLabel?.font = Fonts.SFProDisplay.semibold.font(size: 16)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        addSubView()
        setupConstraints()
        setupSpacingCollectionView()
        backgroundColor = .white
        
        collectionView.register(PaymentCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Methods
    
    private func setupSpacingCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
}

// MARK: - Setup Constrains

private extension PaymentView {
    
    func addSubView() {
        self.addSubviews([mainTitleLabel, subTitleLabel, collectionView, subscribeButton, byButton ])
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            mainTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: .mainTitleLabelTopAnchor),
            mainTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: .AnchorSizeView),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .subTitleLabelAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -.subTitleLabelAnchor),
            
            collectionView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: .collectionViewTopAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: .collectionViewHeightAnchor),
            
            subscribeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .AnchorSizeView),
            subscribeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -.AnchorSizeView),
            subscribeButton.heightAnchor.constraint(equalToConstant: .subscribeButtonHeightAnchor),
            subscribeButton.bottomAnchor.constraint(equalTo: byButton.topAnchor, constant: -.subscribeButtonBottomAnchor),
            
            byButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            byButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: .byButtonTopAnchor)
            
        ])
    }
}

// MARK: - Constant Constraints

private extension CGFloat {
    
    static let mainTitleLabelTopAnchor: CGFloat = 60
    static let AnchorSizeView: CGFloat = 16
    static let subTitleLabelAnchor: CGFloat = 40
    static let collectionViewTopAnchor: CGFloat = 18
    static let collectionViewHeightAnchor: CGFloat = 0.55
    static let subscribeButtonBottomAnchor: CGFloat = 15
    static let subscribeButtonHeightAnchor: CGFloat = 50
    static let byButtonTopAnchor: CGFloat = -20
}
