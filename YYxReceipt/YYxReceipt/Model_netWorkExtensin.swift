//
//  Model_ReceiveServersData.swift
//  YYxReceipt
//
//  Created by young lu on 2017/1/13.
//  Copyright © 2017年 young lu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
extension theMonthViewController{
    
    func checkTimeToConnectSevers()  {
        
        
       //maybe i should right uinit test here
       
print(load_UserDefaultInDictionary(theDicName: "pageSetting_Dic"))
        
        var seversWasLoaded = Bool(pageSetting_Dic["seversWasLoaded"] as! NSNumber)
        print("aa\(seversWasLoaded)")
        print(pageSetting_Dic["seversWasLoaded"]!)
        //月初seversWasLoaded歸零
        if todayDate.day() == 1 {
            seversWasLoaded = false
        }
        
        //check&set odd time ,統一發票每逢單月的二十五日
        guard todayDate.month()%2 == 0 else {

            return
        }
        
//        if odd month time >=25 check hasData or connect srvers
        if  todayDate.day() >= 25 || seversWasLoaded == false{
            
            
        //so 應該只剩>＝25＆seversWasLoaded==fale兩種
            
            self.connectServers()
            
            //已經更新過一次
            seversWasLoaded = true
            pageSetting_Dic["seversWasLoaded"] = seversWasLoaded
            save_UserDefaultInDictionary(theDic: pageSetting_Dic, theDicName: "pageSetting_Dic")
        
            
        }
        

       
    
    }
    
    func connectServers()  {
        //handle server data
        
        //the right URL string of even month
        let URLString = "no URL"
        print(URLString)
        //send the request
        Alamofire.request(URLString)
            .responseJSON { response in
                
                //check error exsit
                //error is nil
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error ")
                    print(response.result.error!)
                    return
                }
                
                //check value is not nil
                guard let data = response.result.value else {
                    print("no result data")
                    return
                }
                // handle the results as JSON
                let respondJsonData = JSON(data)
                // now we have the results
                // let's just print them though a tableview would definitely be better UI:
                print("The monthsData is: " + respondJsonData.description)
                guard let stampTime = respondJsonData["timeStamp"]["time"].int else {
                    print("error parsing")
                    return
                }
                // to access a field:
                print("stampTime::\(stampTime)")
                
            // handle respondJsonData
                
        }
        

    }
    
}
