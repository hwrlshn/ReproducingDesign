import UIKit

class Help: UITableViewCell {
    @IBOutlet weak var supportImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }
    
    func config() {
        supportImage.layer.cornerRadius = 8
        supportImage.layer.borderWidth = 1.5
        supportImage.layer.borderColor = UIColor.init(hex: "#e4e4e4")?.cgColor
    }

}
