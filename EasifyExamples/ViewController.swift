//
//  ViewController.swift
//  EasifyExamples
//
//  Created by Nabin Shrestha on 11/11/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
import SwiftUI
import Easify
import LBTATools

class ViewController: UIViewController {
    
    let fromDateBtn = UIButton(title: "From Date", titleColor: UIColor.white, font: .boldSystemFont(ofSize: 16), backgroundColor: .purple, target: self, action: #selector(fromDateTapped))
    let toDateBtn = UIButton(title: "To Date", titleColor: UIColor.white, font: .boldSystemFont(ofSize: 16), backgroundColor: .magenta, target: self, action: #selector(toDateTapped))
    let selectedDateLabel = UILabel(text: "Selected Date", textColor: .white)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.view.stack(UIView(), fromDateBtn.withHeight(50), toDateBtn.withHeight(50), self.view.stack(selectedDateLabel.withWidth(self.view.width).withHeight(40), alignment: .center), UIView(backgroundColor: .gray).withHeight((self.view.height / 2) - 50))
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
        self.showDatePicker(title: "To Date") { (date) in
            self.selectedDateLabel.text = date.dateString(ofStyle: .long)
        }
    }

}
struct MainProvider: PreviewProvider {
    static var previews: some View {
        return ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainProvider.ContainerView>) -> UIViewController {
            return UINavigationController(rootViewController: ViewController())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<MainProvider.ContainerView>) {
            
        }
    }
}
