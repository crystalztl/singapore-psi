import Foundation

extension Bundle {
    public var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    public var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    public var simplifiedVersion : String {
        if let prefix = releaseVersionNumber, let postfix = buildVersionNumber {
            return prefix + " (" + postfix + ")"
        }
        return "Version unavailable."
    }
}
