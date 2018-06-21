import Cocoa

class ViewController: NSViewController, NSUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showNotification() -> Void {
        let notification = NSUserNotification()
        notification.title = "SreenBreak Notification"
        notification.subtitle = "Testing....01...10...11..."
        notification.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.default.delegate = self
        NSUserNotificationCenter.default.deliver(notification)
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter,
                                shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }

    @IBAction func sendNotificationButtonClicked(_ sender: Any) {
        showNotification()
    }
}

extension ViewController {
    static func freshController() -> ViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "ViewController")
        guard let viewController = storyboard.instantiateController(withIdentifier: identifier) as? ViewController else {
            fatalError("Cannot find ViewController for instantiation.")
        }
        
        return viewController
    }
}
