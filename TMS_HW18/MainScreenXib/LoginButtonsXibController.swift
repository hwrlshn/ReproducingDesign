import UIKit

class LoginButtonsXibController: UIView {
    @IBOutlet weak var faceidView: UIView!
    @IBOutlet weak var loginView: UIView!
    
    var onLogin: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configXib()
    }
    
    private func configXib() {
        configFaceidButton()
        loginButton()
    }
    
    private func configFaceidButton() {
        faceidView.clipsToBounds = false
        faceidView.layer.cornerRadius = 20
        faceidView.layer.borderWidth = 2
        faceidView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func loginButton() {
        loginView.clipsToBounds = false
        loginView.layer.cornerRadius = 20
        loginView.layer.borderWidth = 2
        loginView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        onLogin?()
    }
    
}
