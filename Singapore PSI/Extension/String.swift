
import UIKit
import HandyJSON

extension String {    
    public func deserialize<T>() -> T? where T: HandyJSON {
        let tObject = T.deserialize(from: self)
        return tObject
    }

}
