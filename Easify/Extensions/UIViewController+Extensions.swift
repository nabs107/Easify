//
//  UIViewController+Extensions.swift
//  Easify
//
//  Created by Nabin Shrestha on 11/11/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

public extension UIViewController {
    func showDatePicker(title: String? = nil, message: String? = nil, defaultDate: Date? = nil, minimumDate: Date? = nil, maximumDate: Date? = nil, completion: @escaping (Date) -> Void) {
        let alert = UIAlertController(style: .actionSheet, title: title, message: message)
        alert.addDatePicker(mode: .date, date: defaultDate ?? Date(), minimumDate: minimumDate, maximumDate: maximumDate) { date in
            completion(date)
        }
        alert.addAction(title: "Done", style: .cancel)
        alert.show(in: self)
    }
    
    func showListPicker(title: String? = nil, message: String? = nil, pickerViewValues: [[ListOption]], completion: @escaping (ListOption) -> Void) {
        let alert = UIAlertController(style: .actionSheet, title: title, message: message)
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: 0)
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
                completion(values)
        }
        alert.addAction(title: "Done", style: .cancel)
        alert.show(in: self)
    }
    
    func showNepaliDatePicker(title: String? = nil, message: String? = nil, completion: @escaping (NepaliDate, Date?) -> Void) {
        let alert = UIAlertController(style: .actionSheet, title: "Date Picker", message: "Select Date")
//        alert.addDatePicker(mode: .date, date: Date(), minimumDate: nil, maximumDate: nil) { date in
//            print(date)
//        }
        alert.addNepaliDatePicker {
            completion($0, $1)
        }
        alert.addAction(title: "Done", style: .cancel)
        alert.show(in: self)
    }

}
