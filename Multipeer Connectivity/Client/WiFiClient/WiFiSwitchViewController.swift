// Copyright 2016-2017, Ralf Ebert
// License   https://opensource.org/licenses/MIT
// Source    https://www.ralfebert.de/tutorials/ios-swift-multipeer-connectivity/

import UIKit

class ColorSwitchViewController: UIViewController {

    @IBOutlet weak var connectionsLabel: UILabel!
    
    let WiFiService = WiFiServiceManager()    

    @IBOutlet weak var lableField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WiFiService.delegate = self
    }

    func change(getText: String) {
        UIView.animate(withDuration: 0.2) {
            self.lableField.text=self.lableField.text!+getText
        }
    }
    
}

extension ColorSwitchViewController : WiFiServiceManagerDelegate {

    func connectedDevicesChanged(manager: WiFiServiceManager, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.connectionsLabel.text = "Connections: \(connectedDevices)"
        }
    }

}
