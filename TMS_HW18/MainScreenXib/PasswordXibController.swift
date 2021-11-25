import UIKit

class PasswordXibController: UIView {
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var visibleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configXib()
    }
    
    func configXib() {
        visibleImage.isHidden = true
        separatorView.isHidden = true
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text.isEmpty {
            visibleImage.isHidden = true
            separatorView.isHidden = true
        } else {
            visibleImage.isHidden = false
            separatorView.isHidden = false
        }

    }
}
