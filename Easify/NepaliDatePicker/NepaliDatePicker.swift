//
//  NepaliCalendarView.swift
//  NepaliCalendar
//
//  Created by Nabin Shrestha on 1/20/20.
//  Copyright © 2020 f1soft. All rights reserved.
//

import UIKit

public typealias SelectedDate = (NepaliDate, Date?) -> Void

class NepaliDatePicker: UIView {
    
    fileprivate lazy var datePicker: UIPickerView = { [unowned self] in
        return $0
    }(UIPickerView())
    
    public var action: SelectedDate?
    
    private final let currentYearInEnglish = Calendar.current.component(.year, from: Date())
    private final let yearData: [Int] = Array(DateDataSource.getSource().keys).sorted()
    private final let daysData: [Int] = Array(1...32)
    private final var nepaliDaysData: [String] {
        return Array(1...32).map({ (value) -> String in
            getNumber(number: value)
        })
    }
    private final var nepaliYearData: [String] {
        return Array(DateDataSource.getSource().keys).sorted().map({ (value) -> String in
            getNumber(number: value)
        })
    }
    
    private var selectedYear: Int?
    private var selectedMonth: Int?
    private var selectedDay: Int?
    
    private var startingNepaliYear = 2000
    private var startingNepaliMonth = 1
    private var startingNepaliDay = 1
    
    private var daysInMonth = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    private var daysInMonthOfLeapYear = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func setupViews() {
        self.addSubview(self.datePicker)
        self.datePicker.translatesAutoresizingMaskIntoConstraints = false
        self.datePicker.dataSource = self
        self.datePicker.delegate = self
        
        NSLayoutConstraint.activate([
            self.datePicker.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.datePicker.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.datePicker.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.datePicker.heightAnchor.constraint(equalToConstant: 216)
        ])
        
        let currentEnglishDate = Date()
        let currentNepaliDate = DateConverter().getNepaliDate(englishDate: DateModel(year: currentEnglishDate.year, month: currentEnglishDate.month, day: currentEnglishDate.day))
        if let currentNepaliDate = currentNepaliDate {
            self.datePicker.selectRow(currentNepaliDate.year % 100, inComponent: 0, animated: false)
            self.datePicker.selectRow(currentNepaliDate.month - 1, inComponent: 1, animated: false)
            self.datePicker.selectRow(currentNepaliDate.day - 1, inComponent: 2, animated: false)
        }
        
        //setup initially selected date
        let selectedYearRow = self.datePicker.selectedRow(inComponent: 0)
        let selectedMonthRow = self.datePicker.selectedRow(inComponent: 1)
        let selectedDayRow = self.datePicker.selectedRow(inComponent: 2)
        
        self.selectedYear = self.yearData[selectedYearRow]
        self.selectedMonth = (selectedMonthRow + 1)
        self.selectedDay = self.daysData[selectedDayRow]
    }

}
extension NepaliDatePicker: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return DateDataSource.getSource().count
        } else if component == 1 {
            return 12
        } else {
            return 32
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
//            return String(self.yearData[row])
            return nepaliYearData[row]
        } else if component == 1 {
            return DateDataSource.getMonths()[row]
        } else {
//            return Array(1...32)[row].description
            return self.nepaliDaysData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            self.selectedYear = self.yearData[row]
        case 1:
            self.selectedMonth = (row + 1)
        case 2:
            self.selectedDay = self.daysData[row]
        default:
            break
        }
        guard let selectedYear = self.selectedYear, let selectedMonth = self.selectedMonth, let selectedDay = self.selectedDay else {return}
        let correspondingEnglishDate = DateConverter().getEnglishDate(nepaliDate: DateModel(year: selectedYear, month: selectedMonth, day: selectedDay))
        self.action?(NepaliDate(year: selectedYear.description, month: String(format: "%02d", selectedMonth), day: String(format: "%02d", selectedDay)), correspondingEnglishDate)
    }
    
    func BSToADConverter(year: Int, month: Int, day: Int) -> Date? {
        var engYear = 1943
        var engMonth = 4
        var engDay = 14
        
        var endDayOfMonth = 0
        
        var totalNepDaysCount = 0
        
        for i in self.startingNepaliYear..<year {
            for j in 1...12 {
                totalNepDaysCount = totalNepDaysCount + DateDataSource.getSource()[i]![j]
            }
        }
        
        for j in self.startingNepaliMonth..<month {
            totalNepDaysCount = totalNepDaysCount + DateDataSource.getSource()[year]![j]
        }
        
        totalNepDaysCount = totalNepDaysCount + (day - self.startingNepaliDay)
        
        while totalNepDaysCount != 0 {
            if (isLeapYear(year: engYear)) {
                endDayOfMonth = self.daysInMonthOfLeapYear[engMonth]
            } else {
                endDayOfMonth = self.daysInMonth[engMonth]
            }
            engDay = engDay + 1
            if engDay > endDayOfMonth {
                engMonth = engMonth + 1
                engDay = 1
                if engMonth > 12 {
                    engYear = engYear + 1
                    engMonth = 1
                }
            }
            totalNepDaysCount = totalNepDaysCount - 1
        }
        return Calendar.current.date(from: DateComponents(year: engYear, month: engMonth, day: engDay))
    }
    
    func isLeapYear(year: Int) -> Bool {
        let isLeapYear = ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0))
        return isLeapYear
    }
    
    public func getNumber(number: Int) -> String {
        
        let numberStr = "\(number)"
        
        let nepaliStrArr = numberStr.map { (char) -> String in
            
            let charStr = "\(char)"
            if let index = Int(charStr) {
                return DateDataSource.digits[index]
            } else {
                return charStr
            }
        }
        
        return nepaliStrArr.joined()
    }
}
