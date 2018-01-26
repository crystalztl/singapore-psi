import Foundation
import HandyJSON

extension Data {
    
    public func deserialize<T>() -> T? where T: HandyJSON {
        let tObject = T.deserialize(from: String(data: self, encoding: .utf8))
        return tObject
    }

}
