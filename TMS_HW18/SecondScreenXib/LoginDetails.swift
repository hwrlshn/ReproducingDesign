import UIKit

class LoginDetails: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }
    
    func config() {
        profileImage.layer.cornerRadius = 8
        profileImage.layer.borderWidth = 1.5
        profileImage.layer.borderColor = UIColor.init(hex: "#e4e4e4")?.cgColor
    }

}
