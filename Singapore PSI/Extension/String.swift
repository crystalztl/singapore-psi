
import UIKit
import HandyJSON

extension String {
    
    
    public func deserialize<T>() -> T? where T: HandyJSON {
        let tObject = T.deserialize(from: self)
        return tObject
    }
    
    public func deserializeToArray<T>() -> [T] where T: HandyJSON {
        let data = self.data(using: .utf8)
        let json = try? JSONSerialization.jsonObject(with: data!, options: [])
        let hashable = json as? [String: Any]
        if hashable != nil {
            if hashable?["errorMessage"] != nil {
                let flatMessage = self
                print("The json has errorMessage" + flatMessage);
            }
        } else {
            let items = json as? [[String: Any]]
            var tObjects = [T]()
            for item in items! {
                if let tObject = T.deserialize(from: item) {
                    tObjects += [tObject]
                }
            }
            return tObjects
        }
        return [T]()
    }
}
