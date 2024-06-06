import UIKit

class ViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("loadView--1")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad--1")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear--1")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear--1")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear--1")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear--1")
    }

    @IBAction func CallSecndVC(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "demovc") as? SecondViewController
        //vc?.delegate = self
        navigationController?.pushViewController(vc!, animated: true)
    }
}
