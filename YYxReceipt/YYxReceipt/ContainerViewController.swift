//
//  DemoViewController.swift
//  SlidingContainerViewController
//
//  Created by Cem Olcay on 10/04/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit
import EasyAnimation
import AFDateHelper
class ContainerViewController: UIViewController, SlidingContainerViewControllerDelegate{
    
    var slidingContainerViewController:SlidingContainerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 20)!
        ]
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        
//        let settingpage = viewControllerWithColorAndTitle(UIColor.white, title: "First View Controller")
        
        let ReceiptPage1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "theMonthViewController") as! theMonthViewController
        ReceiptPage1.witchPage = 1
//        print(ReceiptPage1.monthsNum)
//        print(ReceiptPage1.year)
        let ReceiptPage2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "theMonthViewController") as! theMonthViewController
        ReceiptPage2.witchPage = 2
//        print(ReceiptPage2.monthsNum)
//        print(ReceiptPage2.year)
       
        let ReceiptPage3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "theMonthViewController") as! theMonthViewController
        ReceiptPage3.witchPage = 3
//        print(ReceiptPage3.monthsNum)
//        print(ReceiptPage3.year)
        
        slidingContainerViewController = SlidingContainerViewController (
            parent: self,
//            contentViewControllers: [settingpage, ReceiptPage1, ReceiptPage2, ReceiptPage3],
            contentViewControllers: [ReceiptPage1, ReceiptPage2, ReceiptPage3],

            titles: [editePageTitle().page1Title, editePageTitle().page2Title, editePageTitle().page3Title])
        
        view.addSubview(slidingContainerViewController.view)
        
        slidingContainerViewController.sliderView.appearance.outerPadding = 0
        slidingContainerViewController.sliderView.appearance.innerPadding = 50
        slidingContainerViewController.sliderView.appearance.fixedWidth = true
        slidingContainerViewController.setCurrentViewControllerAtIndex(0)
    }
        func viewControllerWithColorAndTitle (_ color: UIColor, title: String) -> UIViewController {
        
        let vc = UIViewController ()
        vc.view.backgroundColor = color
        
        let label = UILabel (frame: vc.view.frame)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont (name: "HelveticaNeue-Light", size: 25)
        label.text = title
        
        label.sizeToFit()
        label.center = view.center
        
        vc.view.addSubview(label)
        
        return vc
    }
    
    func editePageTitle() ->(page1Title:String,page2Title:String,page3Title:String) {
        var page1MonthsTitle = String()
        var page2MonthsTitle = String()
        var page3MonthsTitle = String()
        let todayDate = Date()
        
        switch todayDate.month() {
            
        case 1,2:
            
            page1MonthsTitle = "1月"+"2月"
            page2MonthsTitle = "11月"+"12月"
            page3MonthsTitle = "10月"+"9月"
            return (page1MonthsTitle,page2MonthsTitle,page3MonthsTitle)
            
        case 3,4:
            
            page1MonthsTitle = "3月"+"4月"
            page2MonthsTitle = "1月"+"2月"
            page3MonthsTitle = "11月"+"12月"
            return (page1MonthsTitle,page2MonthsTitle,page3MonthsTitle)
        case 5,6:
            
            page1MonthsTitle = "5月"+"6月"
            page2MonthsTitle = "3月"+"4月"
            page3MonthsTitle = "2月"+"1月"
            return (page1MonthsTitle,page2MonthsTitle,page3MonthsTitle)
        case 7,8:
            
            page1MonthsTitle = "7月"+"8月"
            page2MonthsTitle = "5月"+"6月"
            page3MonthsTitle = "4月"+"3月"
            return (page1MonthsTitle,page2MonthsTitle,page3MonthsTitle)
        case 9,10:
            
            page1MonthsTitle = "9月"+"10月"
            page2MonthsTitle = "7月"+"8月"
            page3MonthsTitle = "5月"+"6月"
            return (page1MonthsTitle,page2MonthsTitle,page3MonthsTitle)
        case 11,12:
            
            page1MonthsTitle = "11月"+"12月"
            page2MonthsTitle = "9月"+"10月"
            page3MonthsTitle = "7月"+"8月"
           
            return (page1MonthsTitle,page2MonthsTitle,page3MonthsTitle)
        default:
            
            let problem = "你的哪個月份switch演算法有問題"
            print(problem)
            
        }
        return ("fail","fail","fail")

    }
    // MARK: SlidingContainerViewControllerDelegate
    
    func slidingContainerViewControllerDidShowSliderView(_ slidingContainerViewController: SlidingContainerViewController) {
        
    }
    
    func slidingContainerViewControllerDidHideSliderView(_ slidingContainerViewController: SlidingContainerViewController) {
        
    }
    
    func slidingContainerViewControllerDidMoveToViewController(_ slidingContainerViewController: SlidingContainerViewController, viewController: UIViewController) {
        
    }
    
    func slidingContainerViewControllerDidMoveToViewControllerAtIndex(_ slidingContainerViewController: SlidingContainerViewController, index: Int) {
        
    }
    
    
}
