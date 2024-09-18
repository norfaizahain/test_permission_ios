import Foundation

@objc public class testPermissionIos: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
