import UIKit

final class PaymentView: UIView {
    
    private let spacing:CGFloat = 16.0
    
    // MARK: - UI Elements
 
    let collectionView: UICollectionView = {

       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .vertical
       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       return collectionView
   }()
    
    lazy var mainTitleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Приложение платное"
        label.font = Fonts.SFProDisplay.black.font(size: 26)
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Выберите удобный для вас способ \n оплаты"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = UIColor.lightGray
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var subscribeButton: LoaderButton = {
        
        let button = LoaderButton()
        button.setTitle("Оформить подписку", for: .normal)
        button.backgroundColor = .black
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var byButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Восстановить покупки", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addSubView()
        setupConstraints()
        setupSpacingCollectionView()
 
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

extension PaymentView {
    
    func addSubView() {
        addSubview(mainTitleLabel)
        addSubview(subTitleLabel)
        addSubview(collectionView)
        addSubview(subscribeButton)
        addSubview(byButton)
        
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        byButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            mainTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant:76),
            mainTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant:16),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:40),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-40),
            
            collectionView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant:48),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45),
            
            subscribeButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant:98),
            subscribeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            subscribeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
            subscribeButton.heightAnchor.constraint(equalToConstant: 50),
            
            byButton.topAnchor.constraint(equalTo: subscribeButton.bottomAnchor, constant:25),
            byButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
  
        ])
    }
}


// MARK: - Constant Constraints

private extension CGFloat {
    
    static let imageViewAnchor: CGFloat = 30
    static let topAnchor: CGFloat = 10
    static let trailingMargin: CGFloat = -10
}

