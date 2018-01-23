import UIKit
import ARSLineProgress

extension UIViewController {
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc public func dismissKeyboard() {
        view.endEditing(true)
    }
    
    public func showAlert(title: String = "Singapore PSI", message: String, dismissButtonText: String = "OK", dismissHandler: @escaping (UIAlertAction) -> Void = { _ in
        }) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: dismissButtonText, style: UIAlertActionStyle.default, handler: dismissHandler))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func gotoPreviousView() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    public func showProgress(onView view: UIView) {
        if ARSLineProgress.shown {
            return
        }
        
        ARSLineProgressConfiguration.circleColorInner = UIColor.orange.cgColor
        ARSLineProgressConfiguration.circleColorMiddle = UIColor.orange.cgColor
        ARSLineProgressConfiguration.circleColorOuter = UIColor.orange.cgColor
        ARSLineProgressConfiguration.successCircleColor = UIColor.orange.cgColor
        ARSLineProgressConfiguration.backgroundViewStyle = .blur
        ARSLineProgress.ars_showOnView(view)
    }
    
    public func showProgress() {
        if ARSLineProgress.shown {
            return
        }
        
        ARSLineProgressConfiguration.circleColorInner = UIColor.orange.cgColor
        ARSLineProgressConfiguration.circleColorMiddle = UIColor.orange.cgColor
        ARSLineProgressConfiguration.circleColorOuter = UIColor.orange.cgColor
        ARSLineProgressConfiguration.successCircleColor = UIColor.orange.cgColor
        ARSLineProgressConfiguration.backgroundViewStyle = .blur
        ARSLineProgress.show()
    }
    
    public func hideProgress(){
        ARSLineProgress.hide()
    }

}



