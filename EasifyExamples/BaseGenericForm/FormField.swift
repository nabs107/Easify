//
//  FormField.swift
//  BankSmart
//
//  Created by Shreejan Shrestha on 10/27/18.
//  Copyright © 2018 f1soft. All rights reserved.
//

import Foundation
import UIKit

public class FormField {
    
    public enum FieldType {
        case TEXT
        case PASSWORD
        case DROPDOWN
        case DATE
        case MOBILE
        case PHONE
        case SUBMIT
        case TIME
        case NUMBER
        case HIDDEN
        case ACCOUNT
        case FROM_ACCOUNT
        case CHECKBOX
        case LABEL_VALUE
        case SEARCH
    }
    
    public var type : FieldType?
    public var required : Bool?
    public var regex : String?
    public var label : String?
    public var tag : String?
    public var maxValue : Double?
    public var minValue : Double?
    public var errorMessage : String?
    public var maxLength : Int = 100
    public var hidden : Bool = false
    public var ignoreField : Bool = false
    public var options : [Option]?
    public var hint : String?
    public var validatorMessage : String?
    public var requiredMessage : String?
    public var disablePastDates : Bool = false
    public var disableFutureDates : Bool = false
    public var view : UIView?
    public var visibilityParent : String?
    public var visibilityValues : [String]?
    public var parentPickerview : String?
    public var multiItems : [[Option]]?
    public var defaultValue : String?
    
    public init() {
        
    }
}
