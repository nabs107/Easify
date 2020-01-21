//
//  BaseGenericForm.swift
//  EasifyExamples
//
//  Created by Nabin Shrestha on 11/18/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
//import SwiftUI
import LBTATools

open class BaseGenericForm: LBTAFormController {
    var fields: [FormField] = []
    var viewHolder: [UIView] = []
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .init(white: 0.95, alpha: 1)
        
        let paymentName = FormField()
        paymentName.label = "Payment Name"
        paymentName.tag = "name"
        paymentName.required = true
        paymentName.maxLength = 50
        paymentName.type = .TEXT
        fields.append(paymentName)
        
        let amount = FormField()
        amount.label = "Amount"
        amount.tag = "amount"
        amount.required = true
        amount.type = .NUMBER
        fields.append(amount)
        
        self.setupFields()
        
        self.setupStackViewLayout()
        
    }
    
    private func setupFields() {
        fields.forEach { (formField) in
            guard let type = formField.type else {return}
            switch type {
            case .TEXT:
//                let textField = IndentedTextField(placeholder: formField.label, padding: 12, cornerRadius: 5, keyboardType: .default, backgroundColor: .white)
                let textField = SkyFloatingLabelTextField(frame: CGRect(x: 10, y: 10, width: 200, height: 45))
                
                textField.placeholder = "Name"
                textField.title = "Your full name"
                textField.errorMessage = "Required!"
                
                textField.constrainHeight(45)
                viewHolder.append(textField)
                break
            case .PASSWORD:
                break
            case .DROPDOWN:
                break
            case .DATE:
                break
            case .MOBILE:
                break
            case .PHONE:
                break
            case .SUBMIT:
                break
            case .TIME:
                break
            case .NUMBER:
                break
            case .HIDDEN:
                break
            case .ACCOUNT:
                break
            case .FROM_ACCOUNT:
                break
            case .CHECKBOX:
                break
            case .LABEL_VALUE:
                break
            case .SEARCH:
                break
            }
        }
    }
    
    fileprivate func setupStackViewLayout() {
        self.viewHolder.forEach{formContainerStackView.addArrangedSubview($0)}
        formContainerStackView.withMargins(.allSides(16))
    }
}
//struct BaseGenericFormProvider: PreviewProvider {
//    static var previews: some View {
//        return ContainerView()
//    }
//    struct ContainerView: UIViewControllerRepresentable {
//        func makeUIViewController(context: UIViewControllerRepresentableContext<BaseGenericFormProvider.ContainerView>) -> BaseGenericForm {
//            return BaseGenericForm()
//        }
//        
//        func updateUIViewController(_ uiViewController: BaseGenericForm, context: UIViewControllerRepresentableContext<BaseGenericFormProvider.ContainerView>) {
//            
//        }
//    }
//}
