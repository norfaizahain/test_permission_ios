import Foundation

@objc public class TestPermissionIos: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
     @objc public func isGpsEnabled(_ value: String) {
        print("Checking if GPS is enabled: \(value)")
    }
    // @objc public func showEnableLocationAlert(_ value: String) {
    //     print("showEnableLocationAlert: \(value)")
    // }
    // @objc public func addListener(_ call: Any) {
    //     print("event: \(call)")
    // }
     @objc public func requestPermissions(_ value: String) {
        print("event: \(value)")
    }
}
