import UIKit

class LegalInformation: UITableViewCell {
    @IBOutlet weak var docImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }
    
    func config() {
        docImage.layer.cornerRadius = 8
        docImage.layer.borderWidth = 1.5
        docImage.layer.borderColor = UIColor.init(hex: "#e4e4e4")?.cgColor
    }

}
