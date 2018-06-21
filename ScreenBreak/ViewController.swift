import Cocoa

class ViewController: NSViewController, NSUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Notification
    
    func createNotification() -> Void {
        let notification = NSUserNotification()
        
        notification.title = "SreenBreak Notification"
        notification.subtitle = "Testing....01...10...11..."
        notification.soundName = NSUserNotificationDefaultSoundName
        notification.deliveryDate = Date(timeIntervalSinceNow: 1)
        
        notification.deliveryRepeatInterval = DateComponents(minute: 1)
        
        NSUserNotificationCenter.default.delegate = self
        NSUserNotificationCenter.default.scheduleNotification(notification)
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }

    // MARK: Actions
    
    @IBAction func sendNotificationButtonClicked(_ sender: Any) {
        createNotification()
    }
    
    @IBAction func quitButtonClicked(_ sender: Any) {
        NSApplication.shared.terminate(sender)
    }
    
}

// MARK: Extensions

extension ViewController {
    static func freshController() -> ViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "ViewController")
        
        guard let viewController = storyboard.instantiateController(withIdentifier: identifier) as? ViewController else {
            fatalError("freshController(): Cannot find ViewController for instantiation.")
        }
        
        return viewController
    }
}
