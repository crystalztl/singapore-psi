import Foundation
import HandyJSON

extension Data {
    
    public func deserialize<T>() -> T? where T: HandyJSON {
        let tObject = T.deserialize(from: String(data: self, encoding: .utf8))
        return tObject
    }
    
    public func deserializeToArray<T>() -> [T] where T: HandyJSON {
        print("Deserializing to array")
        let json = try? JSONSerialization.jsonObject(with: self, options: [])
        let hashable = json as? [String: Any]
        if hashable != nil {
            if hashable?["errorMessage"] != nil {
                let flatMessage = String(data: self, encoding: .utf8)
                print("The json has errorMessage" + flatMessage!);
            }
        } else {
            let items = json as? [NSDictionary]
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
