//
//  YYxSimpleFactory_ObjC.h
//  YYxSimpleFactory_ObjC
//
//  Created by young lu on 2016/6/2.
//  Copyright © 2016年 young lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YYXMovementAnimation)
{
    YYXMovementVerticalUp,
    YYXMovementVerticalDown,
    YYXMovementLeft,
    YYXMovementRight,
};
@interface YYxSimpleFactory_ObjC : NSObject
//plist 不適用手動new plist讀取
#pragma mark - Plist save&load_Array
// example:YYxSimpleFactory_ObjC.saveToPlist(with:swiftArray_ConvertToNSMutableArray(theArr: swiftArrs) , plistName: "fileName")
+(void)saveToPlistWithArray:(NSMutableArray*)array plistName:(NSString*)plistName;
+(NSMutableArray *)readFromPlistWithArray:(NSString*)plistName;
#pragma mark - Plist save&load_Dictionary
#pragma mark - Image save&load_本地端
#pragma mark - Image save&load_URL
#pragma mark - Load Web
#pragma mark - Animation_View movemoent
#pragma mark - Random Color
#pragma mark - 轉換 HexString to NSdata
#pragma mark - 現在時間
#pragma mark - file path:documentsDirectoryPath
#pragma mark - file path:專案內的_inProjectWithFileName此檔案read-only
#pragma mark - 陣列結合成1字串:assembleStringfromStringArr
#pragma mark - 複製專案檔案到app:copyFileToAPP
//+(void)openEmail;
@end
