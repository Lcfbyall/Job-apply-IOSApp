## Job-apply-IOSApp

[![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)](https://github.com/omaralbeik/swifterSwift)
[![Xcode](https://img.shields.io/badge/Xcode-8.0-blue.svg)](https://developer.apple.com/xcode)
[![MIT](https://img.shields.io/badge/License-MIT-red.svg)](https://opensource.org/licenses/MIT)
## Objective
此專案為給面試官作為參考用途,使用前請記得重新安裝cocapod，相關lib名稱請參考podFile

## Describe
此專案為一個快速輸入並記錄紙本發票後三碼的IOS App，以一個TabViewController為RootController包三個不同月份ViewController，以滑動方式或點選月份來決定記錄的月份，輸入完成後以plist做存取，根據iphone機型使用SnapKit做動態版面變化，並設計有左右移動鍵盤方便單手操作。
    在紀錄完成後發票最後一碼會使用EasyAnimation讓特定鍵盤旋轉且案件號碼顏色變成金色，以顯示有該尾數的發票號碼。
    最後以Alamofire連接伺服器，並以SwiftyJSON解析request的中獎號碼，然後以得到的中獎號碼做比對來確認中獎與否，用Toaster來回應使用者


**API由於包含一些私人key因此，在此專案上並不提供串接伺服器URL**

## Third Party Used
 - SnapKit
 - EasyAnimation
 - AFDateHelper
 - Toaster
 - Alamofire
 - SwiftyJSON


## Demo
![](DemoGif/iphone5.gif)
![](DemoGif/iphone6.gif)
