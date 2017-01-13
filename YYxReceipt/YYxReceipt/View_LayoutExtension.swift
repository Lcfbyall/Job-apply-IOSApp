//
//  VC_LayoutExtension.swift
//
//
//  Created by young lu on 2016/12/12.
//
//

import Foundation
extension theMonthViewController{
    func iphone6_smallContainerViewInLeft()  {
        self.bigContainerView.snp.makeConstraints { (make) -> Void in
            
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.height.equalTo(bigContainerView_Height)
            make.width.equalTo(bigContainerView_Width)
        }
        
        self.smallContainerView.snp.makeConstraints { (make) -> Void in
            
            make.left.equalTo(self.view.snp.left).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
            //            make.top.equalTo(self.coverView.snp.bottom).offset(0)
            make.right.equalTo(self.bigContainerView.snp.left).offset(0)
            /*
             sliderHeight: CGFloat = 44
             iphone info bar = 20
             */
            make.height.equalTo(UIScreen.main.bounds.size.height-CGFloat(bigContainerView_Height)-44-20)
            
        }
        self.displayLabel.snp.makeConstraints { (make) -> Void in
            
            make.left.equalTo(self.smallContainerView.snp.right).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
//            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.coverView.snp.top).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
//            make.width.equalTo(displayLabelWidth)
        }
        
        
        //實機測試時第一次偏移跑出來的掩蓋Veiw
        self.coverView.snp.makeConstraints { (make) -> Void in
            
            //            make.top.equalTo(self.view.snp.top).offset(0)
            make.left.equalTo(self.smallContainerView.snp.left).offset(0)
            make.right.equalTo(self.smallContainerView.snp.right).offset(0)
            make.bottom.equalTo(self.smallContainerView.snp.top).offset(0)
            make.height.equalTo(20)
        }
        
        //smallContainerView的子View
        
        upButton.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(smallContainerView.snp.top).offset(0)
            make.right.equalTo(smallContainerView.snp.right).offset(0)
            make.left.equalTo(smallContainerView.snp.left).offset(0)
            make.bottom.equalTo(restoreButton.snp.top).offset(0)
            make.height.equalTo(downButton)
            make.height.equalTo(restoreButton)
        }
        upButton.addTarget(self, action: #selector(upBtnPressInLeft_showTablet), for: .touchUpInside)
        
        
        self.restoreButton.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(upButton.snp.bottom).offset(0)
            make.right.equalTo(smallContainerView.snp.right).offset(0)
            make.left.equalTo(smallContainerView.snp.left).offset(0)
            make.bottom.equalTo(downButton.snp.top).offset(0)
            make.height.equalTo(upButton)
            make.height.equalTo(downButton)

            
        }

        downButton.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(restoreButton.snp.bottom).offset(0)
            make.right.equalTo(smallContainerView.snp.right).offset(0)
            make.left.equalTo(smallContainerView.snp.left).offset(0)
            make.bottom.equalTo(smallContainerView.snp.bottom).offset(0)
            make.height.equalTo(upButton)
            make.height.equalTo(restoreButton)
            
        }
        self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        downButton.addTarget(self, action: #selector(iphone6GoRight), for: .touchUpInside)
        
    }
    func upBtnPressInLeft_showTablet() {
        
        
        //show tablet view
        
        //set delete slider
        
        //press back btn, reload keyboard data: step 2
    }
    func iphone6GoRight() {
//        // text color 歸零
//        for tag in 1...9 {
//            print("xxx\(tag+tagComplementaryNum)")
//            let theTagView = self.view.viewWithTag(tag+tagComplementaryNum)as! UIButton
//            theTagView.setTitleColor(.black, for: .normal)
//        }
//        
//        //重灌鍵盤 text color
//        for tag in lastIndexList_Arr {
//            print("xxx\(tag+tagComplementaryNum)")
//            let theTagView = self.view.viewWithTag(tag+tagComplementaryNum)as! UIButton
//            theTagView.setTitleColor(UIColor(red: 1, green: 0.8431, blue: 0, alpha: 1.0) /* #ffd700 */, for: .normal)
//        }
//        
//        print("sss")
        
        self.displayLabel.snp.remakeConstraints { (make) -> Void in
            
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.smallContainerView.snp.left).offset(0)
            make.top.equalTo(self.coverView.snp.top).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
        }

        
        self.bigContainerView.snp.remakeConstraints { (make) -> Void in
            
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.left.equalTo(self.view.snp.left).offset(0)
            make.height.equalTo(bigContainerView_Height)
            make.width.equalTo(bigContainerView_Width)
        }
        
        self.smallContainerView.snp.remakeConstraints { (make) -> Void in
            
            make.right.equalTo(self.view.snp.right).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
            //            make.top.equalTo(self.coverView.snp.bottom).offset(0)
            make.left.equalTo(self.bigContainerView.snp.right).offset(0)
            /*
             sliderHeight: CGFloat = 44
             iphone info bar = 20
             */
            make.height.equalTo(UIScreen.main.bounds.size.height-CGFloat(bigContainerView_Height)-44-20)
            
        }
      
        
        pageSetting_Dic["smallContainerView_position"] = "right"
        save_UserDefaultInDictionary(theDic: pageSetting_Dic, theDicName: "pageSetting_Dic")
        
        // 這樣第一次才會轉
        self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        UIView.animate(withDuration: 1) { () -> Void in
            self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * -2)
            self.view.layoutIfNeeded()
        }
        
        downButton.removeTarget(self, action: #selector(iphone6GoRight), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(iphone6GoLeft), for: .touchUpInside)
        
        
        
    }
    func iphone6_smallContainerViewInRight(){
        self.bigContainerView.snp.makeConstraints { (make) -> Void in
            
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.left.equalTo(self.view.snp.left).offset(0)
            make.height.equalTo(bigContainerView_Height)
            make.width.equalTo(bigContainerView_Width)
        }
        
        self.smallContainerView.snp.makeConstraints { (make) -> Void in
            
            make.right.equalTo(self.view.snp.right).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
            make.left.equalTo(self.bigContainerView.snp.right).offset(0)
            /*
             sliderHeight: CGFloat = 44
             iphone info bar = 20
             */
            make.height.equalTo(UIScreen.main.bounds.size.height-CGFloat(bigContainerView_Height)-44-20)
            
        }
        self.displayLabel.snp.makeConstraints { (make) -> Void in
            
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.smallContainerView.snp.left).offset(0)
            make.top.equalTo(self.coverView.snp.top).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
        }
        
        
        //實機測試時第一次偏移跑出來的掩蓋Veiw
        self.coverView.snp.makeConstraints { (make) -> Void in
            
            //            make.top.equalTo(self.view.snp.top).offset(0)
            make.left.equalTo(self.smallContainerView.snp.left).offset(0)
            make.right.equalTo(self.smallContainerView.snp.right).offset(0)
            make.bottom.equalTo(self.smallContainerView.snp.top).offset(0)
            make.height.equalTo(20)
        }
        
        //smallContainerView的子view
        smallContainerView.addSubview(upButton)
        
        smallContainerView.addSubview(restoreButton)
        
        downButton.addTarget(self, action: #selector(iphone6GoLeft), for: .touchUpInside)
        smallContainerView.addSubview(downButton)
        
        upButton.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(smallContainerView.snp.top).offset(0)
            make.right.equalTo(smallContainerView.snp.right).offset(0)
            make.left.equalTo(smallContainerView.snp.left).offset(0)
            make.bottom.equalTo(restoreButton.snp.top).offset(0)
            make.height.equalTo(downButton)
            make.height.equalTo(restoreButton)
            
        }
        self.restoreButton.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(upButton.snp.bottom).offset(0)
            make.right.equalTo(smallContainerView.snp.right).offset(0)
            make.left.equalTo(smallContainerView.snp.left).offset(0)
            make.bottom.equalTo(downButton.snp.top).offset(0)
            make.height.equalTo(upButton)
            make.height.equalTo(downButton)
            
            
        }

        
        downButton.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(restoreButton.snp.bottom).offset(0)
            make.right.equalTo(smallContainerView.snp.right).offset(0)
            make.left.equalTo(smallContainerView.snp.left).offset(0)
            make.bottom.equalTo(smallContainerView.snp.bottom).offset(0)
            make.height.equalTo(upButton)
            make.height.equalTo(restoreButton)
        }
        
        
    }
    func iphone6GoLeft(){
        
        self.displayLabel.snp.remakeConstraints { (make) -> Void in
            
            make.left.equalTo(self.smallContainerView.snp.right).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            //            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.coverView.snp.top).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
            //            make.width.equalTo(displayLabelWidth)
        }

        self.bigContainerView.snp.remakeConstraints { (make) -> Void in
            
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.height.equalTo(bigContainerView_Height)
            make.width.equalTo(bigContainerView_Width)
        }
        
        self.smallContainerView.snp.remakeConstraints { (make) -> Void in
            
            make.left.equalTo(self.view.snp.left).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
            //            make.top.equalTo(self.coverView.snp.bottom).offset(0)
            make.right.equalTo(self.bigContainerView.snp.left).offset(0)
            /*
             sliderHeight: CGFloat = 44
             iphone info bar = 20
             */
            make.height.equalTo(UIScreen.main.bounds.size.height-CGFloat(bigContainerView_Height)-44-20)
            
        }
        

        
        pageSetting_Dic["smallContainerView_position"] = "left"
        save_UserDefaultInDictionary(theDic: pageSetting_Dic, theDicName: "pageSetting_Dic")
        
        self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * -2)
        UIView.animate(withDuration: 1) { () -> Void in
            self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            self.view.layoutIfNeeded()
        }
        
        downButton.removeTarget(self, action: #selector(iphone6GoLeft), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(iphone6GoRight), for: .touchUpInside)
        
        
    }
    
}
extension theMonthViewController{
    func iphone5_smallContainerViewInLeft() {
        
        self.bigContainerView.snp.makeConstraints { (make) -> Void in
            
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.height.equalTo(bigContainerView_Height_Iphone5_Height)
            make.width.equalTo(bigContainerView_Width)
            
            
        }
        self.smallContainerView.snp.makeConstraints { (make) -> Void in
            
            make.left.equalTo(self.view.snp.left).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
            make.width.equalTo(60)
            /*
             sliderHeight: CGFloat = 44
             iphone info bar = 20
             */
            make.height.equalTo(UIScreen.main.bounds.size.height-CGFloat(bigContainerView_Height_Iphone5_Height)-44-20)
            
        }
        self.displayLabel.snp.makeConstraints { (make) -> Void in
            
            //            make.left.equalTo(self.view.snp.left).offset(100)
            //            make.right.equalTo(self.smallContainerView.snp.left).offset(0)
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.coverView.snp.top).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
            make.width.equalTo(displayLabelWidth_Iphoe5)
        }
        
        
        //實機測試時第一次偏移跑出來的掩蓋Veiw

        self.coverView.snp.makeConstraints { (make) -> Void in
            
            //            make.top.equalTo(self.view.snp.top).offset(0)
            make.left.equalTo(self.smallContainerView.snp.left).offset(0)
            make.right.equalTo(self.smallContainerView.snp.right).offset(0)
            make.bottom.equalTo(self.smallContainerView.snp.top).offset(0)
            make.height.equalTo(20)
        }
        
        
       
        
        upButton.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(smallContainerView.snp.top).offset(0)
            make.right.equalTo(smallContainerView.snp.right).offset(0)
            make.left.equalTo(smallContainerView.snp.left).offset(0)
            make.bottom.equalTo(restoreButton.snp.top).offset(0)
            make.height.equalTo(downButton)
            make.height.equalTo(restoreButton)
            
        }
        self.restoreButton.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(upButton.snp.bottom).offset(0)
            make.right.equalTo(smallContainerView.snp.right).offset(0)
            make.left.equalTo(smallContainerView.snp.left).offset(0)
            make.bottom.equalTo(downButton.snp.top).offset(0)
            make.height.equalTo(upButton)
            make.height.equalTo(downButton)
            
            
        }

        downButton.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(restoreButton.snp.bottom).offset(0)
            make.right.equalTo(smallContainerView.snp.right).offset(0)
            make.left.equalTo(smallContainerView.snp.left).offset(0)
            make.bottom.equalTo(smallContainerView.snp.bottom).offset(0)
            make.height.equalTo(upButton)
            make.height.equalTo(restoreButton)
            
        }
        self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        downButton.addTarget(self, action: #selector(iphone5GoRight), for: .touchUpInside)
        
    }
    func iphone5GoRight(){
        self.smallContainerView.snp.remakeConstraints { (make) -> Void in
            
            make.right.equalTo(self.view.snp.right).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
            make.width.equalTo(60)
            /*
             sliderHeight: CGFloat = 44
             iphone info bar = 20
             */
            make.height.equalTo(UIScreen.main.bounds.size.height-CGFloat(bigContainerView_Height_Iphone5_Height)-44-20)
            
            
        }
        
        

        //data save in Dic with userdefault 2 step
        pageSetting_Dic["smallContainerView_position"] = "right"
        save_UserDefaultInDictionary(theDic: pageSetting_Dic, theDicName: "pageSetting_Dic")
        
        // 這樣第一次才會轉
        self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        UIView.animate(withDuration: 1) { () -> Void in
            self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2)
            self.view.layoutIfNeeded()
        }
        
        downButton.removeTarget(self, action: #selector(iphone5GoRight), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(iphone5GoLeft), for: .touchUpInside)
        
        
    }
    func iphone5_smallContainerViewInRight(){
        self.bigContainerView.snp.makeConstraints { (make) -> Void in
            
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.height.equalTo(bigContainerView_Height_Iphone5_Height)
            make.width.equalTo(bigContainerView_Width)
            
            
        }
        self.smallContainerView.snp.makeConstraints { (make) -> Void in
            
            make.right.equalTo(self.view.snp.right).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
            make.width.equalTo(60)
            /*
             sliderHeight: CGFloat = 44
             iphone info bar = 20
             */
            make.height.equalTo(UIScreen.main.bounds.size.height-CGFloat(bigContainerView_Height_Iphone5_Height)-44-20)
            
            
        }
        self.displayLabel.snp.makeConstraints { (make) -> Void in
            
            //            make.left.equalTo(self.view.snp.left).offset(100)
            //            make.right.equalTo(self.smallContainerView.snp.left).offset(0)
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.coverView.snp.top).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
            make.width.equalTo(displayLabelWidth_Iphoe5)
        }
       
        //實機測試時第一次偏移跑出來的掩蓋Veiw

        self.coverView.snp.makeConstraints { (make) -> Void in
            
            //            make.top.equalTo(self.view.snp.top).offset(0)
            make.left.equalTo(self.smallContainerView.snp.left).offset(0)
            make.right.equalTo(self.smallContainerView.snp.right).offset(0)
            make.bottom.equalTo(self.smallContainerView.snp.top).offset(0)
            make.height.equalTo(20)
        }
        
        //        upButton.addTarget(self, action: #selector(), for: .touchUpInside)
        smallContainerView.addSubview(upButton)
        
        self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2)
        downButton.addTarget(self, action: #selector(iphone5GoLeft), for: .touchUpInside)
        smallContainerView.addSubview(downButton)
        
        
        
        upButton.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(smallContainerView.snp.top).offset(0)
            make.right.equalTo(smallContainerView.snp.right).offset(0)
            make.left.equalTo(smallContainerView.snp.left).offset(0)
            make.bottom.equalTo(restoreButton.snp.top).offset(0)
            make.height.equalTo(downButton)
            make.height.equalTo(restoreButton)
            
        }
        self.restoreButton.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(upButton.snp.bottom).offset(0)
            make.right.equalTo(smallContainerView.snp.right).offset(0)
            make.left.equalTo(smallContainerView.snp.left).offset(0)
            make.bottom.equalTo(downButton.snp.top).offset(0)
            make.height.equalTo(upButton)
            make.height.equalTo(downButton)
            
            
        }

        downButton.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(restoreButton.snp.bottom).offset(0)
            make.right.equalTo(smallContainerView.snp.right).offset(0)
            make.left.equalTo(smallContainerView.snp.left).offset(0)
            make.bottom.equalTo(smallContainerView.snp.bottom).offset(0)
            make.height.equalTo(upButton)
            make.height.equalTo(restoreButton)
            
        }
        
    }
    func iphone5GoLeft(){
        self.smallContainerView.snp.remakeConstraints{ (make) -> Void in
            
            make.left.equalTo(self.view.snp.left).offset(0)
            make.bottom.equalTo(self.bigContainerView.snp.top).offset(0)
            make.width.equalTo(60)
            /*
             sliderHeight: CGFloat = 44
             iphone info bar = 20
             */
            make.height.equalTo(UIScreen.main.bounds.size.height-CGFloat(bigContainerView_Height_Iphone5_Height)-44-20)
            
        }
            
        downButton.removeTarget(self, action: #selector(iphone5GoLeft), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(iphone5GoRight), for: .touchUpInside)
        
        //data save in Dic with userdefault 2 step
        pageSetting_Dic["smallContainerView_position"] = "left"
        save_UserDefaultInDictionary(theDic: pageSetting_Dic, theDicName: "pageSetting_Dic")
        
        UIView.animate(withDuration: 1) { () -> Void in
            self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            self.view.layoutIfNeeded()
        }
        
    }
    
}
