import UIKit

final class PaymentController: UIViewController {
    
    // MARK: - Properties
    
    private let paymentView = PaymentView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = paymentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        paymentView.subscribeButton.addTarget(self, action: #selector(subscribeTup), for: .touchUpInside)
    }
    
    // MARK: - Private Methods
    
    private func setupDelegate() {
        paymentView.collectionView.delegate = self
        paymentView.collectionView.dataSource = self
    }
    
    @objc
    private func subscribeTup(_ sender: LoaderButton) {
        sender.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            sender.isLoading = false
        }
    }
}

// MARK: - CollectionViewDataSource

extension PaymentController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PaymentCollectionViewCell
        cell.data = itemsModel[indexPath.item]
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension PaymentController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? PaymentCollectionViewCell {
            cell.showMark()
            cell.layoutIfNeeded()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? PaymentCollectionViewCell {
            cell.hideMark()
        }
    }
}

// MARK: - CollectionViewDelegateFlowLayout

extension PaymentController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 1, height: collectionView.frame.width / 3.6)
    }
}
