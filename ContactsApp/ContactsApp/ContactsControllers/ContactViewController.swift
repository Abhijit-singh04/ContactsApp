

import UIKit
// MARK: Protocol
protocol UpdateContactInterface {
    func updateContactInterface(model: Person)
}

final class ContactViewController: UIViewController {
    

    // MARK: IBOutlets
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
//    properties
    var model: Person?
    var newModel: Person?
    
//    delegate
    var delegate: UpdateCellDelegate?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fillPersonData()
    }
    // MARK: IBAction
    @IBAction private func callButton() {
        alert(
            title: "Sorry =(",
            message: "This function can not be used, please stay with us for update!",
            style: .alert
        )
    }
    @IBAction private func messageButton() {
        alert(
            title: "Sorry =(",
            message: "This function can not be used, please stay with us for update!",
            style: .alert
        )
    }
    @IBAction private func freeVideoCallButton() {
        alert(
            title: "Sorry =(",
            message: "This function can not be used, please stay with us for update!",
            style: .alert
        )
    }
    @IBAction private func extraOutCallButton() {
        alert(
            title: "Sorry =(",
            message: "This function can not be used, please stay with us for update!",
            style: .alert
        )
    }
    @IBAction private func editButton() {
        performSegue(withIdentifier: "GoToEditContactVC", sender: nil)
    }
    
    // MARK: Functions
    private func fillPersonData() {
        if let unwrapModel = model {
            title = unwrapModel.name + " " + unwrapModel.surname
            phoneLabel.text = unwrapModel.phone
            emailLabel.text = unwrapModel.email
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let editContactVC = segue.destination as? EditContactViewController,
            let unwModel = model
        {
            let person = Person(name: unwModel.name,
                                surname: unwModel.surname,
                                email: unwModel.email,
                                phone: unwModel.phone)
            editContactVC.model = person
            editContactVC.delegate = self
        }
    }
}

// MARK: Extension
extension ContactViewController: UpdateContactInterface {
    func updateContactInterface(model: Person) {
        title = model.name + " " + model.surname
        phoneLabel.text = model.phone
        emailLabel.text = model.email
        delegate?.updateCellDelegate(person: model)
    }
}
