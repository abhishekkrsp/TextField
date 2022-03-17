//
//  ViewController.swift
//  WorkingWithTextField
//
//  Created by Abhishek Kumar on 16/03/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Variables
    let textField: UITextField = {
        let someTextField = UITextField()
        someTextField.translatesAutoresizingMaskIntoConstraints = false
        someTextField.backgroundColor = .white
        someTextField.placeholder = "Type Text Here"
//        someTextField.layer.cornerRadius = 8
        someTextField.autocorrectionType = .no // .yes, .default
        someTextField.keyboardType = .decimalPad // .phonePad, .default, .decimalPad...
        someTextField.keyboardAppearance = .default
        someTextField.borderStyle = .roundedRect
        return someTextField
    }()
    let buttonSet: UIButton = {
        let someButton = UIButton()
        someButton.translatesAutoresizingMaskIntoConstraints = false
        someButton.setTitle("Set", for: .normal)
        someButton.backgroundColor = .systemGreen
        someButton.layer.cornerRadius = 4
        someButton.addTarget(self, action: #selector(setLabel), for: .touchUpInside)
        return someButton
    }()
    let buttonErase: UIButton = {
        let someButton = UIButton()
        someButton.translatesAutoresizingMaskIntoConstraints = false
        someButton.setTitle("Erase", for: .normal)
        someButton.backgroundColor = .systemGreen
        someButton.layer.cornerRadius = 4
        someButton.addTarget(self, action: #selector(eraseLabel), for: .touchUpInside)
        return someButton
    }()
    let stackViewHorizontal: UIStackView = {
        let someStackView = UIStackView()
        someStackView.translatesAutoresizingMaskIntoConstraints = false
        someStackView.axis = .horizontal
        someStackView.alignment = .center
        someStackView.spacing = 25
        someStackView.distribution = .fillEqually
        return someStackView
    }()
    let stackViewVertical: UIStackView = {
        let someStackView = UIStackView()
        someStackView.translatesAutoresizingMaskIntoConstraints = false
        someStackView.axis = .vertical
        someStackView.alignment = .center
        someStackView.spacing = 30
        someStackView.distribution = .fillEqually
//        someStackView.backgroundColor = .brown
        return someStackView
    }()
    let label: UILabel = {
        let someLabel = UILabel()
        someLabel.translatesAutoresizingMaskIntoConstraints = false
        someLabel.text = "Text Entered: "
//        someLabel.backgroundColor = .green
        someLabel.numberOfLines = 10
        someLabel.textAlignment = .center
        return someLabel
    }()
    
    // MARK: Overrided functions
    override func loadView() {
        super.loadView()
        setupUI()
        setupConstraints()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }

    // MARK: Setup UIComponents Functions
    private func setupUI() {
        stackViewHorizontal.addArrangedSubview(buttonSet)
        stackViewHorizontal.addArrangedSubview(buttonErase)
        stackViewVertical.addArrangedSubview(textField)
        stackViewVertical.addArrangedSubview(stackViewHorizontal)
        stackViewVertical.addArrangedSubview(label)
        view.addSubview(stackViewVertical)
        view.backgroundColor = .cyan
        
    }
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackViewVertical.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: -50),
            stackViewVertical.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            textField.widthAnchor.constraint(equalToConstant: 200),
            label.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor)
        ])
    }
    // MARK: My Fuctions
    @objc func setLabel() {
        if let fieldText = textField.text {
            label.text = "Text Entered:  \(fieldText)"
        }
        hideKeyboard()
    }
    @objc func eraseLabel() {
        label.text = "Text Entered: "
        textField.text = nil
        hideKeyboard()
    }
}

// MARK: Delegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("Text Field Should Clear")
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Text Field Did Begin Editing")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Text Field Did End Editing")
//        hideKeyboard()
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("Text Field DId Cjange Selection")
//        label.text = textField.text
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing with reason")
    }
}

// MARK: Extension
extension ViewController {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

