//
//  EditContactViewController.swift
//  ContactsApp
//
//  Created by Abhijit Singh.
//

import UIKit

final class EditContactViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var surnameTextField: UITextField!
    @IBOutlet private weak var doneButtonOutlet: UIButton!
    
    // MARK: Delegates and Properties
    var model: Person?
    var delegate: UpdateContactInterface?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPersonData()
    }
    
    // MARK: IBActions
    @IBAction private func nameTextFieldAction() {
        checkPersons()
    }
    @IBAction private func surnameTextFieldAction() {
        checkPersons()
    }
    @IBAction private func phoneTextFieldAction() {
        checkPersons()
    }
    @IBAction private func emailTextFieldAction() {
        checkPersons()
    }
    @IBAction private func doneButtonAction() {
        let name = nameTextField.text!
        let surname = surnameTextField.text!
        let email = emailTextField.text!
        let phone = phoneTextField.text!
        
        let person = Person(
            name: name,
            surname: surname,
            email: email,
            phone: phone
        )
        
        delegate?.updateContactInterface(model: person)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Functions
    private func setupPersonData() {
        if
            let person = model
        {
            nameTextField.text = person.name
            surnameTextField.text = person.surname
            emailTextField.text = person.email
            phoneTextField.text = person.phone
        }
    }
    private func checkPersons() {
        if
            let name = nameTextField.text,
            !name.isEmpty,
            let surname = surnameTextField.text,
            !surname.isEmpty,
            let email = emailTextField.text,
            !email.isEmpty,
            let phone = phoneTextField.text,
            !phone.isEmpty
        {
            let newModel = Person(name: name, surname: surname, email: email, phone: phone)
            doneButtonOutlet.isEnabled = model != newModel
        } else {
            doneButtonOutlet.isEnabled = false
            alert(title: "Warning!", message: "Please, dont leave empty cells", style: .alert)
        }
    }
}
