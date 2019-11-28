//
//  UIViewController+Extensions.swift
//  Easify
//
//  Created by Nabin Shrestha on 11/11/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

public extension UIViewController {
    func showDatePicker(title: String? = nil, message: String? = nil, defaultDate: Date? = nil, completion: @escaping (Date) -> Void) {
        let alert = UIAlertController(style: .actionSheet, title: title, message: message)
        alert.addDatePicker(mode: .date, date: defaultDate ?? Date(), minimumDate: nil, maximumDate: nil) { date in
            completion(date)
        }
        alert.addAction(title: "Done", style: .cancel)
        alert.show(in: self)
    }
    
    func showListPicker(title: String? = nil, message: String? = nil, pickerViewValues: [[Option]], completion: @escaping ([[Option]]) -> Void) {
        let alert = UIAlertController(style: .actionSheet, title: title, message: message)
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: 0)
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
                completion(values)
        }
        alert.addAction(title: "Done", style: .cancel)
        alert.show(in: self)
    }

}
