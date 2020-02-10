//
//  ViewController.swift
//  EasifyExamples
//
//  Created by Nabin Shrestha on 11/11/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
//import SwiftUI
import Easify
import LBTATools

class ViewController: UIViewController {
    
    let fromDateBtn = UIButton(title: "From Date", titleColor: UIColor.white, font: .boldSystemFont(ofSize: 16), backgroundColor: .purple, target: self, action: #selector(fromDateTapped))
    let toDateBtn = UIButton(title: "To Date", titleColor: UIColor.white, font: .boldSystemFont(ofSize: 16), backgroundColor: .magenta, target: self, action: #selector(toDateTapped))
    let baseGenericForm = UIButton(title: "Base Generic Form", titleColor: UIColor.white, font: .boldSystemFont(ofSize: 16), backgroundColor: .brown, target: self, action: #selector(baseGenericFormTapped))
    let selectedDateLabel = UILabel(text: "Selected Date", textColor: .black)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let fromAndToDateView = UIView()
        
        self.view.stack(UIView(backgroundColor: .blue), fromAndToDateView.hstack(fromDateBtn.withWidth(self.view.width / 2 - 32).withHeight(50), toDateBtn.withWidth(self.view.width / 2 - 32).withHeight(50), spacing: 10, distribution: .fill), selectedDateLabel.withHeight(40), UIView(backgroundColor: .gray).withHeight((self.view.height / 2) - 50), alignment: .center)
        
        self.fromDateBtn.layer.cornerRadius = 10
        self.toDateBtn.layer.cornerRadius = 10
    }

    @objc
    func fromDateTapped() {
        let date = Calendar.current.date(byAdding: .init(day: -30), to: Date())
        self.showDatePicker(title: "From Date", defaultDate: date) { (date) in
            self.selectedDateLabel.text = date.dateString(ofStyle: .long)
        }
    }
    
    @objc
    func toDateTapped() {
//        self.showDatePicker(title: "To Date") { (date) in
//            self.selectedDateLabel.text = date.dateString(ofStyle: .long)
//        }
//        self.showNepaliDatePicker(title: "Select Date", message: nil) {
//            print("\($0)/\($1)")
//        }
        
//        print(DateConverter().getNepaliDate(englishDate: DateModel(year: Date().year, month: Date().month, day: Date().day)))
        
        print(Int(2075).unicoded())
        
        print("2075".unicoded())
    }
    
    @objc
    func baseGenericFormTapped() {
        
    }

}
//struct MainProvider: PreviewProvider {
//    static var previews: some View {
//        return ContainerView().edgesIgnoringSafeArea(.all)
//    }
//
//    struct ContainerView: UIViewControllerRepresentable {
//        func makeUIViewController(context: UIViewControllerRepresentableContext<MainProvider.ContainerView>) -> UIViewController {
//            return ViewController()
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<MainProvider.ContainerView>) {
//
//        }
//    }
//}
