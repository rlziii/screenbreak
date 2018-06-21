import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("Hello, ScreenBreak!")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }

}

