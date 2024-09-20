import Foundation
import CoreLocation
import UIKit
import Capacitor
/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(TestPermissionIosPlugin)
public class TestPermissionIosPlugin: CAPPlugin, CAPBridgedPlugin, CLLocationManagerDelegate{

    var locationManager: CLLocationManager!
    var permissionCallID: String?
    public var window: UIWindow?
    var currentView: UIView!

    // default set value so dont touch
    public let identifier: String = "testPermissionIosPlugin"
    public let jsName: String = "testPermissionIos"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "isGpsEnabled", returnType: CAPPluginReturnPromise),
        // CAPPluginMethod(name: "showEnableLocationAlert", returnType: CAPPluginReturnPromise),
        // CAPPluginMethod(name: "addListener", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "requestPermissions", returnType: CAPPluginReturnPromise),
    ]
    private let implementation: TestPermissionIos = TestPermissionIos()

    override public func load() {
        super.load()
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
     @objc func isGpsEnabled(_ call: CAPPluginCall) {
        let status: Bool = CLLocationManager.locationServicesEnabled()
        call.resolve([
            "enabled": status
        ])
    }
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("hellos")
          print(permissionCallID)
         if let callID: String = permissionCallID, let call = bridge?.savedCall(withID:callID) {
             print("callID ada")
            checkPermissions(call)
             bridge?.releaseCall(call)
         }
    }
    @objc public override func requestPermissions(_ call: CAPPluginCall) {
        print("hey you")
        if let manager: CLLocationManager = locationManager, CLLocationManager.locationServicesEnabled() {
            print(CLLocationManager.authorizationStatus())
            if CLLocationManager.authorizationStatus() == .notDetermined {
                bridge?.saveCall(call)
                permissionCallID = call.callbackId
                manager.requestWhenInUseAuthorization()
                // call.resolve()
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {  // Delay before checking permissions
                self.checkPermissions(call)
            }
        
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {  // Delay before showing alert
            self.showEnableLocationAlert("main")
        }
            // call.reject("Location services are disabled")
        }
        

    }
    @objc public override func checkPermissions(_ call: CAPPluginCall) {
        print("check permission helo")
        let locationState: String

        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationState = "prompt"
        case .restricted, .denied:
            locationState = "denied"
            self.showEnableLocationAlert("app")
        case .authorizedAlways, .authorizedWhenInUse:
            locationState = "granted"
        @unknown default:
            locationState = "prompt"
        }

        // DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
        //     print("Delay finished, notifying listener")
        //     self.notifyListeners("locationStatusChange", data: [
        //         "data": locationState
        //     ])
        // }
        // call.resolve(["location": locationState])
        
    }
    func showEnableLocationAlert(_ type : String) {
        print("kau triggered tak?")
        var url = URL(string: UIApplication.openSettingsURLString)
//        call.getString("value") ?? ""
        if(type == "main"){
            url = URL(string: "App-Prefs:root=LOCATION_SERVICES")
        }
       
        DispatchQueue.main.async {
        let alert = UIAlertController(
            title: "Location Services Disabled",
            message: "Please enable location services in Settings to allow the app to access your location.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Settings", style: .default) { _ in
            if let settingsUrl = url {
                UIApplication.shared.open(settingsUrl)
            }
        })
        // alert.addAction(UIAlertAction(title: "Cancel", style: .cancel)
        //     { _ in
        //     self.notifyCancelAction()
        // })
         alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {  // 0.5-second delay before notifying cancel
                print("Notifying cancel action after delay")
                self.notifyCancelAction()
            }
        })
        
        self.bridge?.viewController?.present(alert, animated: true)
        }
        
        //  call.resolve()

    }
    
    func notifyCancelAction() {
        print("bruh triggered now")
        self.notifyListeners("cancelAction", data: ["data":"true"])
    }
    // custom addListener
    // private var touchEventListeners: [String: (PluginCallResultData) -> Void] = [:]

    // @objc public override func addListener(_ call: CAPPluginCall) {

    //     guard let eventName = call.getString("eventName") else {
    //         call.reject("Event name is required")
    //         return
    //     }
    //     print("addListener called", eventName)
    //     // Store the call and resolve it later when an event is emitted
    //     touchEventListeners[eventName] = { data in
    //         call.resolve(data)
    //     }
    // }
    // private func notifyListeners(_ eventName: String, data: [String: Any]) {
    //     print("notifyListeners triggered")
    //     touchEventListeners[eventName]?(data)
    // }
}
