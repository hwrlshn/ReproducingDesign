import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var secondaryTextLabel: UILabel!
    @IBOutlet weak var forgotPassLabel: UILabel!
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var organizationView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var buttonsView: UIView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    // MARK: - config
    
    private func config() {
        configLogo()
        configText()
        configForms()
        configButtons()
    }
    
    // MARK: - config logo
    
    private func configLogo() {
        cornerRadiusLogo(view: logoImage, radius: 15)
    }
    
    private func cornerRadiusLogo(view: UIView, radius: CGFloat) {
        view.layer.cornerRadius = radius
    }
    
    // MARK: - config text
    
    private func configText() {
        configMainText()
        secondaryText()
        configforgotPass()
    }
    
    private func configMainText() {
        guard let text = mainTextLabel.text else { return }
        guard let font = UIFont(name: "Roboto-Black", size: 25) else { return }
        let mainColor = UIColor.init(hex: "#000000")
        let secondaryColor = UIColor.init(hex: "#0742fa")
        let attributes: [NSAttributedString.Key:Any] = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: mainColor as Any
        ]
        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        attributedString.addAttribute(
            .foregroundColor,
            value: secondaryColor as Any,
            range: NSRange(location: 8, length: 11)
        )
        mainTextLabel.attributedText = attributedString
    }
    
    private func secondaryText() {
        guard let text = secondaryTextLabel.text else { return }
        guard let font = UIFont(name: "Roboto-Regular", size: 14) else { return }
        let color = UIColor.init(hex: "#333333")
        let attributes: [NSAttributedString.Key:Any] = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color as Any
        ]
        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        secondaryTextLabel.attributedText = attributedString
    }
    
    private func configforgotPass() {
        guard let text = forgotPassLabel.text else { return }
        guard let font = UIFont(name: "Roboto-Black", size: 16) else { return }
        let color = UIColor.init(hex: "#333333")
        let attributes: [NSAttributedString.Key:Any] = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color as Any
        ]
        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        forgotPassLabel.attributedText = attributedString
    }
    
    // MARK: - config forms
    
    private func configForms() {
        configUsername()
        configOrganization()
        configPass()
    }
    
    private func configUsername() {
        let usernameXib = Bundle.loadView(fromNib: "Username", withType: UsernameXibController.self)
        let cornerRadius: CGFloat = 20
        usernameXib.layer.cornerRadius = cornerRadius
        usernameView.layer.cornerRadius = cornerRadius
        usernameView.addSubview(usernameXib)
        usernameView.addShadows(cornerRadius: 0, radius: 8, opacity: 0.05)
    }
    
    private func configOrganization() {
        let organizationXib = Bundle.loadView(fromNib: "Organization", withType: OrganizationXibController.self)
        let cornerRadius: CGFloat = 20
        organizationXib.layer.cornerRadius = cornerRadius
        organizationView.layer.cornerRadius = cornerRadius
        organizationView.addSubview(organizationXib)
        organizationView.addShadows(cornerRadius: 0, radius: 8, opacity: 0.05)

    }
    
    private func configPass() {
        let passXib = Bundle.loadView(fromNib: "Password", withType: PasswordXibController.self)
        let cornerRadius: CGFloat = 20
        passXib.layer.cornerRadius = cornerRadius
        passwordView.layer.cornerRadius = cornerRadius
        passwordView.addSubview(passXib)
        passwordView.addShadows(cornerRadius: 0, radius: 8, opacity: 0.05)

    }
    
    // MARK: - config buttons
    
    private func configButtons() {
        let buttonsXib = Bundle.loadView(fromNib: "LoginButtons", withType: LoginButtonsXibController.self)
        let cornerRadius: CGFloat = 20
        buttonsXib.layer.cornerRadius = cornerRadius
        buttonsView.layer.cornerRadius = cornerRadius
        buttonsView.addSubview(buttonsXib)
        buttonsXib.onLogin = {[weak self] in
            self?.loginButton()
        }
    }
    
    private func loginButton() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ProfilePage")
        controller.modalPresentationStyle = UIModalPresentationStyle.custom
        controller.transitioningDelegate = self
        present(controller, animated: true)
        
    }
    
}

// MARK: - extensions

extension ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension Bundle {
    static func loadView<T>(fromNib name: String, withType type: T.Type) -> T {
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }
        fatalError("Couldn't load view w/ this type " + String(describing: type))
    }
}
