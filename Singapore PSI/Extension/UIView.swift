
import Foundation
import UIKit

extension UIView {
    @IBInspectable public var cornerRadius: CGFloat {
        set(newValue) {
            self.layer.cornerRadius = newValue
        }
        get {
            return self.layer.cornerRadius
        }
    }
    @IBInspectable public var borderWidth: CGFloat {
        set(newValue) {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    @IBInspectable public var borderColor: UIColor {
        set(newValue) {
            self.layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
}
