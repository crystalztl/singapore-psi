import Foundation
import UIKit
extension UIImage{
    
    public func multiplyImageByConstantColor(color:UIColor)-> UIImage {
        let backgroundSize = self.size
        UIGraphicsBeginImageContext(backgroundSize)
        
        let ctx = UIGraphicsGetCurrentContext()!
        
        var backgroundRect=CGRect()
        backgroundRect.size = backgroundSize
        backgroundRect.origin.x = 0
        backgroundRect.origin.y = 0
        
        let myFloatForR = 0
        var r = CGFloat(myFloatForR)
        let myFloatForG = 0
        var g = CGFloat(myFloatForG)
        let myFloatForB = 0
        var b = CGFloat(myFloatForB)
        let myFloatForA = 0
        var a = CGFloat(myFloatForA)
        
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        ctx.setFillColor(red: r, green: g, blue: b, alpha: a)
        ctx.fill(backgroundRect)
        
        var imageRect=CGRect()
        imageRect.size = self.size
        imageRect.origin.x = (backgroundSize.width - self.size.width)/2
        imageRect.origin.y = (backgroundSize.height - self.size.height)/2
        
        // Unflip the image
        ctx.translateBy(x: 0, y: backgroundSize.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        
        ctx.setBlendMode(.multiply)
        ctx.draw(self.cgImage!, in: imageRect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
