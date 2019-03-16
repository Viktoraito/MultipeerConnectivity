// Copyright 2016-2017, Ralf Ebert
// License   https://opensource.org/licenses/MIT
// Source    https://www.ralfebert.de/tutorials/ios-swift-multipeer-connectivity/

import UIKit

class WiFiSwitchViewController: UIViewController {

    @IBOutlet weak var connectionsLabel: UILabel!
    @IBOutlet weak var controlButton: UIButton!
    
    let WiFiService = WiFiServiceManager()

    //@IBOutlet weak var textField: UITextView!
    @IBOutlet weak var lableField: UITextView!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WiFiService.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:self.view, action: #selector(UIView.endEditing(_:))))
    }

    @IBAction func SendPushed() {
        WiFiService.send(Message: "\(UIDevice.current.name): \(lableField.text!)\n")
    }

    func change(getText: String) {
        UIView.animate(withDuration: 0.2) {
            self.lableField.text=self.lableField.text!+getText
        }
    }
    
}

extension WiFiSwitchViewController : WiFiServiceManagerDelegate {
    

    func connectedDevicesChanged(manager: WiFiServiceManager, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.connectionsLabel.text = "Connections: \(connectedDevices)"
        }
    }


}
