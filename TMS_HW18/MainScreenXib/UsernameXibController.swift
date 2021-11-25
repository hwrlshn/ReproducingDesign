import UIKit

class UsernameXibController: UIView {
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var clearImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configXib()
    }
    
    func configXib() {
        clearImage.isHidden = true
        separatorView.isHidden = true
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text.isEmpty {
            clearImage.isHidden = true
            separatorView.isHidden = true
        } else {
            clearImage.isHidden = false
            separatorView.isHidden = false
        }

    }
}
