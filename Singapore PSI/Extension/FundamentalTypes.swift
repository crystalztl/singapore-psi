import Foundation

extension Date {
    public var TotalMillis : Int64 {
        return Int64(self.timeIntervalSince1970 * 1_000)
    }
    
    public var TotalMicros : Int64 {
        return Int64(self.timeIntervalSince1970 * 1_000_000)
    }
    
    
    public var month : Int {
        return Calendar.current.component(.month, from: self)
    }
    public var year : Int {
        return Calendar.current.component(.year, from: self)
    }
    public var day : Int {
        return Calendar.current.component(.day, from: self)
    }
    public var dayOfWeek : Weekday {
        let possibleDay = Weekday(rawValue : Calendar.current.component(.weekday, from: self))
        return possibleDay!
    }
    public func isToday() -> Bool {
        let date = Date()
        return self.day == date.day && self.month == date.month && self.year == date.year
    }
}

public enum Weekday : Int {
    case Sunday,
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday
    public func toString() -> String {
        switch self{
        case .Sunday:
            return "Sunday"
        case .Monday:
            return "Monday"
        case .Tuesday:
            return "Tuesday"
        case .Wednesday:
            return "Wednesday"
        case .Thursday:
            return "Thursday"
        case .Friday:
            return "Friday"
        case .Saturday:
            return "Saturday"
        }
    }
}

extension Date {
    public func format(_ format: DateFormat, humanFriendly : Bool = false) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        if format.get() == "dd/MM/yyyy" && humanFriendly {
            if self.isToday() {
                return "Today"
            }else{
                dateFormatter.dateFormat = format.get()
                return dateFormatter.string(from:self)
            }
        }
        dateFormatter.dateFormat = format.get()
        return dateFormatter.string(from:self)
    }
    public func timeString() -> String {
        return self.format(DateFormats.Coloned_HHmmss)
    }
    public func dateString() -> String {
        return  self.format(DateFormats.Slashed_ddMMyyyy, humanFriendly: true)
    }
}

public class DateFormats {
    public static let TZ_NoMillis = DateFormat.pattern("yyyy-MM-dd'T'HH:mm:ss'Z'")
    public static let TZ = DateFormat.pattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    public static let Slashed_ddMMyyyy = DateFormat.pattern("dd/MM/yyyy")
    public static let Coloned_HHmmss = DateFormat.pattern("HH:mm:ss")
    public static let ddMMyyyy_hhmma = DateFormat.pattern("dd/MM/yyyy hh:mm a")
    public static let HHmm = DateFormat.pattern("HH:mm")
    
}

public enum DateFormat {
    case pattern(String)
    public func get() -> String {
        switch(self){
        case .pattern(let value):
            return value
        }
    }
}


extension String {
    
    public  func contains(what : String) -> Bool {
        return (self.range(of: what) != nil)
    }
    
    public func asDate(currentTimeZone: Bool = true) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.TZ.get()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        if let date = formatter.date(from : self) {
            return date
        }else{
            formatter.dateFormat = DateFormats.TZ_NoMillis.get()
            return formatter.date(from: self)
        }
    }
    
    public func append(line : String) -> String{
        return self.appending(line).appending("\n")
    }
}
func > (
    left : String,
    right : String
    ) -> Bool {
    return left.compare(right) == ComparisonResult.orderedDescending
}
