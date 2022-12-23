//
//  HomeVC.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//  
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    var presenter: HomePresenterProtocol?
    let margin: CGFloat = 16
    let options = ["Hombre", "Mujer"]
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Registro"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        let loc = Locale.init(identifier: "es_MX")
        datePicker.locale = loc
        return datePicker
    }()
    
    lazy var dateTxt: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        textField.placeholder = "Fecha de nacimiento"
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.inputView = datePicker
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: options)
        segmentedControl.backgroundColor = .clear
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlDidChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    lazy var userTxt: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        textField.placeholder = "Nombre"
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var lastNameTxt: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        textField.placeholder = "Apellido paterno"
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var lastName2Txt: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        textField.placeholder = "Apellido materno"
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @objc func segmentedControlDidChange() {
    }
    
    func setupView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        showDatePicker()
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        self.containerView.addSubviews(titleLabel, userTxt, lastNameTxt, lastName2Txt, segmentedControl, dateTxt)
        self.scrollView.addSubview(containerView)
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.containerView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.containerView.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor),
            self.containerView.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        let contentViewHeightConstraint = containerView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        contentViewHeightConstraint.priority = .defaultLow
        contentViewHeightConstraint.isActive = true
        
        self.titleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: margin).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: margin).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -margin).isActive = true
        
        self.userTxt.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: margin).isActive = true
        self.userTxt.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: margin).isActive = true
        self.userTxt.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -margin).isActive = true
        self.userTxt.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        self.lastNameTxt.topAnchor.constraint(equalTo: self.userTxt.bottomAnchor, constant: margin).isActive = true
        self.lastNameTxt.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: margin).isActive = true
        self.lastNameTxt.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -margin).isActive = true
        self.lastNameTxt.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        self.lastName2Txt.topAnchor.constraint(equalTo: self.lastNameTxt.bottomAnchor, constant: margin).isActive = true
        self.lastName2Txt.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: margin).isActive = true
        self.lastName2Txt.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -margin).isActive = true
        self.lastName2Txt.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        self.segmentedControl.topAnchor.constraint(equalTo: self.lastName2Txt.bottomAnchor, constant: margin).isActive = true
        self.segmentedControl.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: margin).isActive = true
        self.segmentedControl.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -margin).isActive = true
        self.segmentedControl.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        self.dateTxt.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor, constant: margin).isActive = true
        self.dateTxt.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: margin).isActive = true
        self.dateTxt.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -margin).isActive = true
        self.dateTxt.heightAnchor.constraint(equalToConstant: 46).isActive = true

    }
    
    func showDatePicker() {
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Cancelar", style: .done, target: self, action: #selector(cancelDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Hecho", style: .done, target: self, action: #selector(doneDatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        // add toolbar to textField
        dateTxt.inputAccessoryView = toolbar
        dateTxt.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "dd/MM/yyyy"
        let formatedDate = formatter.string(from: datePicker.date)
        dateTxt.text = formatedDate
        dismissKeyboard()
    }
    
    @objc func cancelDatePicker() {
        dismissKeyboard()
    }
}
/// Protocolo para recibir datos del presenter.
extension HomeVC: HomeViewProtocol {
}
