import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //Run the corresponding SDK on related button press
    @IBAction func runIdentitySDK(_ sender: Any) {
        SDKRunner.runIdentitySDK(self)
    }
    
    @IBAction func runBiometricsSDK(_ sender: Any) {
        SDKRunner.runBiometricsSDK(self)
    }
}

