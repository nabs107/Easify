//
//  NepaliDatePickerViewController.swift
//  Easify
//
//  Created by Nabin Shrestha on 1/21/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

final class NepaliDatePickerViewController: UIViewController {
    
    public typealias Action = (Date) -> Void
    
    fileprivate var action: SelectedDate?
    
    fileprivate lazy var datePicker: NepaliDatePicker = { [unowned self] in
        $0.action = {
            self.action?($0, $1)
        }
        return $0
        }(NepaliDatePicker())
    
    required init(date: Date? = nil, minimumDate: Date? = nil, maximumDate: Date? = nil, action: SelectedDate?) {
        super.init(nibName: nil, bundle: nil)
        //        datePicker.date = date ?? Date()
        //        datePicker.minimumDate = minimumDate
        //        datePicker.maximumDate = maximumDate
        self.action = action
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("has deinitialized")
    }
    
    override func loadView() {
        view = datePicker
    }
    
    @objc func actionForDatePicker() {
        //        action?(datePicker.date)
    }
    
    public func setDate(_ date: Date) {
        //        datePicker.setDate(date, animated: true)
    }
}


