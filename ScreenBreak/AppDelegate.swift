import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarIcon"))
            button.action = #selector(printTitle(_:))
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
    
    @objc func printTitle(_ sender: Any?) {
        print("Hello, ScreenBreak!")
    }

}

