
import UIKit
import HandyJSON

extension String {
    
    public func hexadecimal() -> Data? {
        var data = Data(capacity: characters.count / 2)
        
        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex.enumerateMatches(in: self, range: NSMakeRange(0, utf16.count)) { match, flags, stop in
            let byteString = (self as NSString).substring(with: match!.range)
            var num = UInt8(byteString, radix: 16)!
            data.append(&num, count: 1)
        }
        
        guard data.count > 0 else { return nil }
        
        return data
    }
    
    public var hexa2Bytes: [UInt8] {
        print(self)
        let hexa = Array(characters)
        return stride(from: 0, to: characters.count, by: 2).flatMap { UInt8(String(hexa[$0..<$0.advanced(by: 2)]), radix: 16) }
    }
    
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
