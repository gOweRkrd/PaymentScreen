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
    }
    
    // MARK: - Private Methods
    
    private func setupDelegate() {
        paymentView.tableView.delegate = self
        paymentView.tableView.dataSource = self
    }
}

// MARK: - TableViewDataSource

extension PaymentController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PaymentTableViewCell  else {
            fatalError("Creating cell from HotelsListViewController failed")
        }
        
        cell.textLabel?.text = "Hello"
    
        return cell
    }
    
}

// MARK: - TableViewDelegate

extension PaymentController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121
    }
}

