import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var plusImage: UIImageView!
    @IBOutlet weak var tableUIView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var logoutViewForButton: UIView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    // MARK: - config

    func config() {
        configAvatar()
        configTable()
        configLogout()
    }
    
    // MARK: - config avatar section
    
    private func configAvatar() {
        avatarImage.layer.cornerRadius = 58
        plusImage.layer.cornerRadius = 18
    }
    
    // MARK: - config table section
    
    private func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        registerNibForTable()
        configTableUIView()
    }
    
    private func registerNibForTable() {
        tableView.register(UINib(nibName: "LoginDetails", bundle: nil), forCellReuseIdentifier: "LoginDetails")
        tableView.register(UINib(nibName: "Help", bundle: nil), forCellReuseIdentifier: "Help")
        tableView.register(UINib(nibName: "LegalInformation", bundle: nil), forCellReuseIdentifier: "LegalInformation")
        tableView.register(UINib(nibName: "FaceIdVerification", bundle: nil), forCellReuseIdentifier: "FaceIdVerification")
    }
    
    private func configTableUIView() {
        tableView.backgroundColor = .clear
        tableUIView.layer.cornerRadius = 15
        tableUIView.layer.borderWidth = 1.5
        tableUIView.layer.borderColor = UIColor.init(hex: "#e4e4e4")?.cgColor
    }
    
    // MARK: - config log out seection
    
    private func configLogout() {
        configLogoutView()
        configLogoutButton()
    }
    
    private func configLogoutView() {
        logoutView.layer.cornerRadius = 30
        logoutView.addShadows(cornerRadius: 30, radius: 5, opacity: 0.1)
    }
    
    private func configLogoutButton() {
        logoutViewForButton.layer.cornerRadius = 20
        logoutViewForButton.layer.borderWidth = 1.5
        logoutViewForButton.layer.borderColor = UIColor.black.cgColor
    }
}

// MARK: - extensions

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "LoginDetails", for: indexPath)
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "Help", for: indexPath)
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "LegalInformation", for: indexPath)
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "FaceIdVerification", for: indexPath)
        default:
            cell = UITableViewCell()
        }
        cell.backgroundColor = .clear
        cell.selectedBackgroundView = UIView()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }

}
