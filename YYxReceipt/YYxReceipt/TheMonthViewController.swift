//
//  TheMonthViewController.swift
//  
//
//  Created by young lu on 2016/11/30.
//
//

import Foundation
import UIKit
import SnapKit
import EasyAnimation
import Toaster



class theMonthViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    let bigContainerView_Width = 320
    let bigContainerView_Height = 450
    let bigContainerView_Height_Iphone5_Height = 350
    let displayLabelWidth_Iphoe5 = 200
    let tagComplementaryNum = 100 //按鈕補數
    var witchPage:Int?{
        didSet {
           editEachPageData()
            let checkPlistFileExist:NSMutableArray? = YYxSimpleFactory_ObjC.readFromPlist(withArray: "\(year).\(monthsNum.0)\(monthsNum.1)")
            if checkPlistFileExist != nil{
                receiptSaveFile_Arr = checkPlistFileExist as AnyObject as! [Int]
                print("load file: \(year).\(monthsNum.0)\(monthsNum.1)")
            }else{
                print("\(monthsNum.0,monthsNum.1)沒有存檔")
            }

        }
    }
    
    let todayDate = Date()
    var year = Date().year()
    var monthsNum = (Int(),Int())
    let evenMonth = Int()
    
    
    
    
    
    let smallContainerView = UIView()
    let coverView = UIView()
    let upButton = UIButton()
    let downButton = UIButton()
    let displayLabel = UILabel()
    let restoreButton = UIButton()
    
    // - MARK: record list button element -
    let recordListTableView = UITableView()
    let closeRecordListBtn = UIButton()
    
    
    var receiptSaveFile_Arr:Array<Int> = Array()
    var lastIndexList_Arr:Array<Int> = Array()
    
    @IBOutlet weak var keyboardContainerView: UIView!
    
    
    
    let bigContainerView = UIView()
    
    var pageSetting_Dic = [String : Any]()
    
    
    
       override func viewDidLoad() {
        
        self.checkUserDefaultFileExit()
       
        self.checkTimeToConnectSevers()
        
        self.editSubViewSetting()
        self.editViewWithSnapkit()
        self.editNumberButton()
        self.editListView()
        self.loadDatafromPlist()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        //read&check plist & put into receiptSaveFile_Arr
//        print("ggggg\(year).\(monthsNum.0)\(monthsNum.1)")
//        YYxSimpleFactory_ObjC.readFromPlist(withArray: "\(year).\(monthsNum.0)\(monthsNum.1)")

    }
    func loadDatafromPlist() {
        // 讀取lastNumList_arry
        let lastIndexFileNameStr = "lastNumList_\(self.year).\(self.monthsNum.0)\(self.monthsNum.1)"
        
        if YYxSimpleFactory_ObjC.readFromPlist(withArray: lastIndexFileNameStr) != nil {
            let array =  YYxSimpleFactory_ObjC.readFromPlist(withArray: lastIndexFileNameStr) as AnyObject as! [Int]
            print("\(lastIndexFileNameStr) = \(array)")
            for btnTag in array {
                let btn = self.view.viewWithTag(btnTag+self.tagComplementaryNum) as! UIButton
                btn.setTitleColor(UIColor(red: 1, green: 0.8431, blue: 0, alpha: 1.0) /* #ffd700 */, for: .normal)
            }
            
        }

    }
    func restore()  {
        //由於url內有專用資料因此在github上不放
       Toast(text: "sorry, no connect", delay: 0, duration: 2).show()
    }
    @objc func openListTable(){
        
        recordListTableView.isHidden = false
        closeRecordListBtn.isHidden = false
        recordListTableView.reloadData();
        Toast(text: "點二下即可刪除", delay: 0, duration: 2).show()

    }
    func editListView() {
        
        self.view.addSubview(recordListTableView)
        recordListTableView.isHidden = true
        recordListTableView.backgroundColor = .white
        recordListTableView.delegate = self
        recordListTableView.dataSource = self
        recordListTableView.layer.borderWidth = 1
        recordListTableView.layer.borderColor = UIColor.black.cgColor
        
        self.view.addSubview(closeRecordListBtn)
        closeRecordListBtn.isHidden = true
        closeRecordListBtn.backgroundColor = .white
        closeRecordListBtn.setImage(UIImage.init(named: "delete"), for: .normal)
        closeRecordListBtn.layer.cornerRadius = 20
        closeRecordListBtn.addTarget(self, action: #selector(closeListView), for: .touchUpInside)
        closeRecordListBtn.layer.borderWidth = 1
        closeRecordListBtn.layer.borderColor = UIColor.black.cgColor
        
        self.recordListTableView.snp.makeConstraints { (make) -> Void in
            
          make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(80, 50, 80, 50))      }

        self.closeRecordListBtn.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(recordListTableView.snp.top).offset(-20)
            make.right.equalTo(recordListTableView.snp.right).offset(20)
//            make.left.equalTo(recordListTableView.snp.left).offset(50)
            make.width.height.equalTo(40)     }

    }
   @objc func closeListView()  {
    // text color 歸零
    for tag in 1...9 {
        let theTagView = self.view.viewWithTag(tag+tagComplementaryNum)as! UIButton
        theTagView.setTitleColor(.black, for: .normal)
    }
    
    //重灌鍵盤 text color
    for tag in lastIndexList_Arr {
        let theTagView = self.view.viewWithTag(tag+tagComplementaryNum)as! UIButton
        theTagView.setTitleColor(UIColor(red: 1, green: 0.8431, blue: 0, alpha: 1.0) /* #ffd700 */, for: .normal)
    }

    
        recordListTableView.isHidden = true
        closeRecordListBtn.isHidden = true
    }
    


    func editNumberButton()  {
        for (_,subView) in self.keyboardContainerView.subviews.enumerated() {
            //            print(index)
            let Btn = subView as!UIButton
            Btn.addTarget(self, action: #selector(pressKeyboard(_:)), for: .touchUpInside)
//                        print(Btn.titleLabel?.text! ?? " numBtn.titleLabel is nil" )
            
            
            if Btn.currentTitle == "Rec" {
                
                Btn.addTarget(self, action: #selector(save), for: .touchUpInside)
            }
            if Btn.currentTitle == "Del" {
                
                 Btn.addTarget(self, action: #selector(delet), for: .touchUpInside)
            }
            if Btn.currentTitle != "Del" && Btn.currentTitle != "Rec"{
//                 給數字按鈕+ tag
                let tagValue = Int(Btn.currentTitle!)
                Btn.tag = tagValue!+tagComplementaryNum//按鈕tag 看來是不需要了
                           }
        }
        

    }
    @objc fileprivate func pressKeyboard(_ sender: UIButton) {
        // set animation when button press
        UIView.animateAndChain(withDuration: 0.05, delay: 0.0,
                               options: [], animations: {
                                sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil).animate(withDuration: 0.05, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        //show number text to display label
        
        if  sender.currentTitle != "Rec" {
            let textCurrentlyInDisplay = displayLabel.text ?? ""
            displayLabel.text = textCurrentlyInDisplay + sender.currentTitle!

        }
       
        
    }
    @objc fileprivate func delet(){
        displayLabel.text = ""
    }
    @objc fileprivate func save(){
        
        let lastIndexFileNameStr = "lastNumList_\(self.year).\(self.monthsNum.0)\(self.monthsNum.1)"

        // check only 3 numbers in dispalylabel
       
        if displayLabel.text!.characters.count == 3{
            
            //
            // save data in Array & combine with older Array
            receiptSaveFile_Arr.append(Int(displayLabel.text!)!)

            //
            //creat file name of date
            let fileNameStr = "\(year).\(monthsNum.0)\(monthsNum.1)"
           
            /* 假如第一位是0則存檔時會自動被忽略掉*/
            //save file in plist
            YYxSimpleFactory_ObjC.saveToPlist(with:yyxConvertToNSMutableArray(theArr: receiptSaveFile_Arr) , plistName: fileNameStr)
             print("後三碼資料array \(fileNameStr) = \(receiptSaveFile_Arr)")
            //
            // save lastNumArr from receiptSaveFile_Arr
            let lastNum = displayLabel.text!
            let  offsetString = giveMeLastString(InString: lastNum)
            //read old last index num array
            let readOldArray = YYxSimpleFactory_ObjC.readFromPlist(withArray: lastIndexFileNameStr) as AnyObject as! [Int]
            lastIndexList_Arr = readOldArray
            
            //check repeat: use set
            lastIndexList_Arr += [Int(offsetString)!]
            lastIndexList_Arr = Array(Set(lastIndexList_Arr))
            print("\(lastIndexFileNameStr) = \(lastIndexList_Arr)")
            //
            //save lastNumArr into plist
            YYxSimpleFactory_ObjC.saveToPlist(with:yyxConvertToNSMutableArray(theArr: lastIndexList_Arr), plistName: lastIndexFileNameStr)
            
            //
            //lastNumArr animate with keyboard: step 1
            let theTagView = self.view.viewWithTag(Int(offsetString)!+tagComplementaryNum)
            keyboardBtnFlip(theBtnView:theTagView as! UIButton)
            
            //歸零
            displayLabel.text = ""
            
            
//             text color 歸零
                    for tag in 1...9 {
//                        print("xxx\(tag+tagComplementaryNum)")
                        let theTagView = self.view.viewWithTag(tag+tagComplementaryNum)as! UIButton
                        theTagView.setTitleColor(.black, for: .normal)
                    }
            
                    //重灌鍵盤 text color
                    for tag in lastIndexList_Arr {
//                        print("xxx\(tag+tagComplementaryNum)")
                        let theTagView = self.view.viewWithTag(tag+tagComplementaryNum)as! UIButton
                        theTagView.setTitleColor(UIColor(red: 1, green: 0.8431, blue: 0, alpha: 1.0) /* #ffd700 */, for: .normal)
                    }
                    



        }else{
            let alertController = UIAlertController(title: "錯誤", message: "請輸入三位數字", preferredStyle: .alert) // 這裡因為控件都不存在改變的可能，所以一律使用let類型.UIAlertControllerStyle可以選擇.actionSheet或.alert
            
//            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "確定", style: .default, handler:{
                (UIAlertAction) -> Void in
                
                // 讀取lastNumList_arry
            
            let array =  YYxSimpleFactory_ObjC.readFromPlist(withArray: lastIndexFileNameStr) as AnyObject as! [Int]
                print("\(lastIndexFileNameStr) = \(array)")
                for btnTag in array {
                    let btn = self.view.viewWithTag(btnTag+self.tagComplementaryNum) as! UIButton
                    btn.setTitleColor(UIColor(red: 1, green: 0.8431, blue: 0, alpha: 1.0) /* #ffd700 */, for: .normal)
                }

//                YYxSimpleFactory_ObjC.readFromPlist(withArray: <#T##String!#>)
                //歸零
                self.displayLabel.text = ""
            })
//            alertController.addAction(cancelAction)
            alertController.addAction(okAction)// 當添加的UIAlertAction超過兩個的時候，會自動變成縱向分佈
            self.present(alertController, animated: true, completion: nil)
        }
    }
    func keyboardBtnFlip(theBtnView:UIButton)  {
        print("last index of \(theBtnView.tag - tagComplementaryNum)")
        theBtnView.titleLabel?.textColor = UIColor(red: 1, green: 0.8431, blue: 0, alpha: 1.0) /* #ffd700 */
        
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromLeft]
        
        UIView.transition(with: theBtnView, duration: 1.0, options: transitionOptions, animations: {})
        
    }

    func editSubViewSetting() {
        let fileNameStr = "\(year).\(monthsNum.0)\(monthsNum.1)"
        receiptSaveFile_Arr = YYxSimpleFactory_ObjC.readFromPlist(withArray: fileNameStr) as AnyObject as! [Int]
        print("tt readFromPlist \(fileNameStr)=\(receiptSaveFile_Arr)")
        
        
        displayLabel.font = UIFont.systemFont(ofSize: 100)
        displayLabel.textColor = UIColor(red: 1, green: 0.8431, blue: 0, alpha: 1.0) /* #ffd700 */
        
        restoreButton.setImage(UIImage.init(named: "restore"), for: UIControlState.normal)
        //        restoreButton.imageView?.contentMode = .scaleAspectFit
        restoreButton.backgroundColor = .orange
        restoreButton.layer.borderColor = UIColor.black.cgColor
        restoreButton.layer.borderWidth = 1
        restoreButton.addTarget(self, action: #selector(restore), for: .touchUpInside)
        
        upButton.setImage(UIImage.init(named: "list"), for: UIControlState.normal)
        upButton.backgroundColor = .orange
        upButton.layer.borderColor = UIColor.black.cgColor
        upButton.layer.borderWidth = 1
        upButton.addTarget(self, action: #selector(openListTable), for: .touchUpInside)
        
        downButton.setImage(UIImage.init(named: "direction"), for: UIControlState.normal)
        
        downButton.backgroundColor = .orange
        downButton.layer.borderColor = UIColor.black.cgColor
        downButton.layer.borderWidth = 1
        displayLabel.textAlignment = .center
        displayLabel.text = ""
        
        smallContainerView.addSubview(upButton)
        smallContainerView.addSubview(downButton)
        smallContainerView.addSubview(restoreButton)

    }
    func editViewWithSnapkit(){
        self.view.addSubview(self.bigContainerView)
        self.view.addSubview(self.displayLabel)
        self.view.addSubview(self.smallContainerView)
        self.view.addSubview(self.coverView)
       
        self.coverView.backgroundColor = .red
        self.displayLabel.backgroundColor = .darkGray
        
        
        

        self.keyboardContainerView.removeFromSuperview()
        self.bigContainerView.addSubview(self.keyboardContainerView)
        
        self.keyboardContainerView.snp.makeConstraints { (make) -> Void in
            
            make.edges.equalTo(self.bigContainerView).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            
        }
      

        let isIphone5 = UIScreen.main.bounds.size.width == CGFloat(bigContainerView_Width)
        if isIphone5 {
            
            if  String(describing: pageSetting_Dic["smallContainerView_position"]!) == "left"{
                iphone5_smallContainerViewInLeft()
            }
            if  String(describing: pageSetting_Dic["smallContainerView_position"]!) == "right"{
                iphone5_smallContainerViewInRight()
            }
            
            
            
        }else{//not iphone5 size
            
            if String(describing: pageSetting_Dic["smallContainerView_position"]!) == "left"{
               self.iphone6_smallContainerViewInLeft()
            }
            if  String(describing: pageSetting_Dic["smallContainerView_position"]!) == "right"{
                self.iphone6_smallContainerViewInRight()
            }
    
        }

    }
       
   
    func checkUserDefaultFileExit() {
       let userDefault =  UserDefaults.standard
        
        if (userDefault.dictionary(forKey: "pageSetting_Dic") == nil) {
            pageSetting_Dic["smallContainerView_position"] = "left"
            pageSetting_Dic["seversWasLoaded"] = false
            print("userDefault pageSetting_Dic init")
            save_UserDefaultInDictionary(theDic: pageSetting_Dic, theDicName: "pageSetting_Dic")
            
        }else{
            
            pageSetting_Dic = load_UserDefaultInDictionary(theDicName: "pageSetting_Dic")
        }
        
    }
    func editEachPageData(){
        
               /*test date*/
//        todayDate = Date(fromString: "16 January 2016 6:12:00", format: .custom("dd MMM yyyy HH:mm:ss"))
        switch todayDate.month() {
        case 1,2:
            if self.witchPage == 1 {
                monthsNum = (1,2)
                
            }
            if self.witchPage == 2 {
                monthsNum = (11,12)
                year-=1
            }
            if self.witchPage == 3 {
                monthsNum = (9,10)
                year-=1
            }
        case 3,4:
            if self.witchPage == 1 {
                monthsNum = (3,4)
            }
            if self.witchPage == 2 {
                monthsNum = (1,2)
            }
            if self.witchPage == 3 {
                monthsNum = (11,12)
                year-=1
            }
            
        case 5,6:
            if self.witchPage == 1 {
                monthsNum = (5,6)
            }
            if self.witchPage == 2 {
                monthsNum = (3,4)
            }
            if self.witchPage == 3 {
                monthsNum = (1,2)
            }

        case 7,8:
            if self.witchPage == 1 {
                monthsNum = (7,8)
            }
            if self.witchPage == 2 {
                monthsNum = (5,6)
            }
            if self.witchPage == 3 {
                monthsNum = (3,4)
            }
            
    
        case 9,10:
            if self.witchPage == 1 {
                monthsNum = (9,10)
            }
            if self.witchPage == 2 {
                monthsNum = (7,8)
            }
            if self.witchPage == 3 {
                monthsNum = (5,6)
                
            }
    
        case 11,12:
                if self.witchPage == 1 {
                    monthsNum = (11,12)
                    
            }
                if self.witchPage == 2 {
                    monthsNum = (9,10)
                  
                    
            }
                if self.witchPage == 3 {
                    monthsNum = (7,8)
                   
            }


        default:
            
            let problem = "你的哪個月份switch演算法有問題"
            print(problem)

        }
    }
    // - MARK: TableView delegate -
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
       
        var theString = String(receiptSaveFile_Arr[indexPath.row])
        
        //補上第一位的0
        if theString.characters.count != 3 {
            theString = "0"+theString
        }
        
        cell.textLabel?.text = theString
        cell.textLabel?.textAlignment = .center
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiptSaveFile_Arr.count
    }
    
    
    var ii = 0
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var allLastNumArr = Array<Int>()
        
        ii+=1//for點兩下功能
        if ii == 2 {
            ii = 0
            
            //刪除資料
            receiptSaveFile_Arr.remove(at: indexPath.row)
            print(receiptSaveFile_Arr)
            recordListTableView.reloadData()
            
            //重新計算最後一位的陣列
            for receiptNum in receiptSaveFile_Arr {
                let converStr = String(receiptNum)
               
                 allLastNumArr += [Int(giveMeLastString(InString: converStr))!]
            }
            
            //重灌資料給lastIndexList_Arr
            lastIndexList_Arr = Array(Set(allLastNumArr))
            print("cccccc\(lastIndexList_Arr)")
            
            
            // text color 歸零
            for tag in 1...9 {
                let theTagView = self.view.viewWithTag(tag+tagComplementaryNum)as! UIButton
                theTagView.setTitleColor(.black, for: .normal)
            }

            //重灌鍵盤 text color
            for tag in lastIndexList_Arr {
                let theTagView = self.view.viewWithTag(tag+tagComplementaryNum)as! UIButton
                theTagView.setTitleColor(UIColor(red: 1, green: 0.8431, blue: 0, alpha: 1.0) /* #ffd700 */, for: .normal)
            }
            
            //save file
            let fileNameStr = "\(year).\(monthsNum.0)\(monthsNum.1)"
            YYxSimpleFactory_ObjC.saveToPlist(with: yyxConvertToNSMutableArray(theArr: receiptSaveFile_Arr), plistName: fileNameStr)
            
            let lastIndexFileNameStr = "lastNumList_\(self.year).\(self.monthsNum.0)\(self.monthsNum.1)"
            YYxSimpleFactory_ObjC.saveToPlist(with: yyxConvertToNSMutableArray(theArr: lastIndexList_Arr), plistName: lastIndexFileNameStr)
        }
        
        
    }
    
    

}
