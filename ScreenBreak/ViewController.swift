import Cocoa

class ViewController: NSViewController, NSUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Notification
    
    func createNotification() -> Void {
        let notification = NSUserNotification()
        
        var actions = [NSUserNotificationAction]()
        let delay5Minutes = NSUserNotificationAction(identifier: "delay5Minutes", title: "Delay 5 minutes")
        let delay10Minutes = NSUserNotificationAction(identifier: "delay10Minutes", title: "Delay 10 minutes")
        let delaySkip = NSUserNotificationAction(identifier: "delaySkip", title: "Skip this time")
        
        actions.append(delay5Minutes)
        actions.append(delay10Minutes)
        actions.append(delaySkip)
        
        notification.title = "It's time to stand!"
//        notification.subtitle = "Testing....01...10...11..."
//        notification.identifier = "test0001"
        notification.hasActionButton = true
        notification.actionButtonTitle = "Delay"
        notification.otherButtonTitle = "Complete!"
        notification.additionalActions = actions
        
        // WARNING, private API
        notification.setValue(true, forKey: "_alwaysShowAlternateActionMenu")
        
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
