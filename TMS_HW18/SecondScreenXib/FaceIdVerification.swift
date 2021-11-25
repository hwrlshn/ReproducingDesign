import UIKit

class FaceIdVerification: UITableViewCell {
    @IBOutlet weak var faceIdImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }
    
    func config() {
        faceIdImage.layer.cornerRadius = 8
        faceIdImage.layer.borderWidth = 1.5
        faceIdImage.layer.borderColor = UIColor.init(hex: "#e4e4e4")?.cgColor
    }

}
