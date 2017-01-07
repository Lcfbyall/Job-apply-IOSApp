//
//  YYxFile.swift
//  YYxReceipt
//
//  Created by young lu on 2016/11/30.
//  Copyright © 2016年 young lu. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    func copyView() -> AnyObject
    {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self))! as AnyObject
    }
}

func currectTime(){
    let date = Date()
    let calendar = Calendar.current
    
    let year = calendar.component(.year, from: date)
    
    let month = calendar.component(.month, from: date)
    let day = calendar.component(.day, from: date)
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    let seconds = calendar.component(.second, from: date)
    print("hours = \(year):\(month):\(day):\(hour):\(minutes):\(seconds)")
}
// - MARK: about String -
func giveMeLastString(InString:String) ->String{
    let  index = InString.index(InString.endIndex, offsetBy: -1, limitedBy: InString.startIndex)
    let  offsetString = InString.substring(from: index ?? InString.startIndex)
    
    return offsetString
}
// - MARK: save/load UserDefault -
func save_UserDefaultInDictionary(theDic:Any, theDicName:String)  {
    //must type of [String:Any]
    if theDic is [String:Any] {
        let userDefault =  UserDefaults.standard
        userDefault.set(theDic, forKey: theDicName)
//        print(userDefault.dictionary(forKey: theDicName) as Any)
    }else{
        print("\(theDicName)不符合 [String:Any]")
    }
    
}
func load_UserDefaultInDictionary(theDicName:String) -> [String:Any] {
    let userDefault =  UserDefaults.standard
    var theDic = [String:Any]()
    
    if (userDefault.dictionary(forKey: theDicName) == nil) {
       print(" 沒有\(theDicName)這個檔案")
        
    }else{
        
        theDic = userDefault.dictionary(forKey: theDicName)!
        print("load data of Userdefault dic:\(theDic)")
    }
    return theDic
}
// - MARK: convert to OC/swift  -
func yyxConvertToNSMutableArray(theArr:[Any])-> NSMutableArray{
    let nsArr = NSMutableArray.init(array: theArr)
    // convert back: print nsArr as AnyObject as! [Int]
    return nsArr
}


// - MARK: other  -
func documentPath() -> String {
    let DocumentsPath:String = NSHomeDirectory().appending("/Documents")
    return DocumentsPath
}
