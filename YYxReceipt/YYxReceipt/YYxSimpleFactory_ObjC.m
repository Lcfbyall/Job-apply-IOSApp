//
//  YYxSimpleFactory_ObjC.m
//  YYxSimpleFactory_ObjC
//
//  Created by young lu on 2016/6/2.
//  Copyright © 2016年 young lu. All rights reserved.
//

#import "YYxSimpleFactory_ObjC.h"


@implementation YYxSimpleFactory_ObjC

#pragma mark - Plist save&load_MutableArray
+(void)saveToPlistWithArray:(NSMutableArray*)array plistName:(NSString*)plistName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",plistName]];
    
    //
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableArray *plistArray;
    if ([fileManager fileExistsAtPath: filePath]) //檢查檔案是否存在
    {
        
//        [YYxSimpleFactory_ObjC readFromPlistWithArray:filePath];
        
        plistArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    }else{
        plistArray = [[NSMutableArray alloc] init];
    }
    
    
    plistArray = [NSMutableArray arrayWithObject:array];
    
    
    //存檔
    if ([plistArray writeToFile:filePath atomically: YES]) {
        NSLog(@"writePlist success");
//        NSLog(@"YYXfile path = %@",filePath);
    } else {
        NSLog(@"writePlist fail");
        
    }
    
}

+(NSMutableArray *)readFromPlistWithArray:(NSString*)plistName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath= [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",plistName]];
    
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSMutableArray *plistArray;
    
    if ([fileManager fileExistsAtPath: filePath]) //檢查檔案是否存在
    {
        plistArray = [NSMutableArray arrayWithContentsOfFile:filePath];
        NSLog(@"read plist file");
        //        NSLog(@"plistArray = %@",[NSMutableArray arrayWithContentsOfFile:filePath]);
    }else{
//        plistArray = NULL;
        plistArray = [[NSMutableArray alloc] init];
        [plistArray addObject:[NSMutableArray new]];
    }
    return  [plistArray objectAtIndex:0];
    
}

#pragma mark - Plist save&load_Dictionary
+(void)saveToPlistWithDictionary:(NSDictionary*)dic plistName:(NSString*)plistName{
    //取得檔案路徑
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistFlieName = [NSString stringWithFormat:@"/%@.plist",plistName];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:plistFlieName];
    
    //
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *plistDict;
    if ([fileManager fileExistsAtPath: filePath]) //檢查檔案是否存在
    {
        
        plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    }else{
        plistDict = [[NSMutableDictionary alloc] init];
    }
    
    
    plistDict = [NSDictionary dictionaryWithDictionary:dic];
    
    
    //存檔
    if ([plistDict writeToFile:filePath atomically: YES]) {
        NSLog(@"writePlist success");
    } else {
        NSLog(@"writePlist fail");
        
    }
    
    
}
+(NSMutableDictionary *)readFromPlistWithDictionary:(NSString*)plistName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath= [paths objectAtIndex:0];
    NSString *filePath = [ documentsDirectoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",plistName]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSMutableDictionary *plistDic;
    
    if ([fileManager fileExistsAtPath: filePath]) //檢查檔案是否存在
    {
        plistDic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
        
    }else{
        plistDic = NULL;
        NSLog(@"YYX####### read plistDic = NULL");
    }
    return  plistDic;
}
+(NSMutableArray *)readOnlyPlistfile :(NSString *)fileName{
    NSString* path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSMutableArray* plistArr = [[NSMutableArray alloc] initWithContentsOfFile:path];
    return plistArr;
}
//#pragma mark - image save&load
//+(void)savePNGImageInDocumentsDirectory:(UIImage*)image setName:(NSString *)imageName{
//    NSString* path = [[self documentsDirectoryPath] stringByAppendingPathComponent:
//                      [NSString stringWithFormat:@"%@.png",imageName] ];
//    NSData* data = UIImagePNGRepresentation(image);
//    [data writeToFile:path atomically:YES];
//}
//+(UIImage*)loadPNGImageFromDocumentsDirectoryWithName:(NSString *)imageName{
//    NSString* path = [[self documentsDirectoryPath] stringByAppendingPathComponent:
//                      [NSString stringWithFormat:@"%@.png",imageName] ];
//    UIImage* image = [UIImage imageWithContentsOfFile:path];
//    return image;
//}
//
//#pragma mark - web
//+(void)loadWebView:(UIWebView *)webView withAddressStr:(NSString *)url setScalesPageToFit:(BOOL)setbool{
//    
//    webView.scalesPageToFit = setbool;
//    NSURL *nsUrl = [NSURL URLWithString:url];
//    NSURLRequest *webRequest = [NSURLRequest requestWithURL:nsUrl];
//    [webView loadRequest:webRequest];
//}
//#pragma mark - view movemoent
//+(void)movementAnimationWithView:(UIView *)view witchMovingDirection:(YYXMovementAnimation)direction whatDurationTime:(double)timeNumber{
//    
//    double y = view.frame.origin.y;
//    double x =view.frame.origin.x;
//    double width = view.frame.size.width;
//    double height = view.frame.size.height;
//    
//    switch (direction) {
//        case YYXMovementVerticalUp:
//        {
//            [UIView animateWithDuration:timeNumber animations:^{
//                
//                
//                [view setFrame:CGRectMake(0, -height , 0, height)];
//                
//            } completion:^(BOOL finished){
//                
//            }];
//            
//        }
//            break;
//        case YYXMovementVerticalDown:
//        {
//            [UIView animateWithDuration:timeNumber animations:^{
//                
//                
//                [view setFrame:CGRectMake(0, height*2 , 0, height)];
//                
//            } completion:^(BOOL finished){
//                
//            }];
//            
//        }
//            break;
//        case YYXMovementLeft:
//        {
//            [UIView animateWithDuration:timeNumber animations:^{
//                
//                
//                [view setFrame:CGRectMake(-width, y , 0, height)];
//                
//            } completion:^(BOOL finished){
//                
//            }];
//        }
//            break;
//        case YYXMovementRight:
//        {
//            [UIView animateWithDuration:timeNumber animations:^{
//                
//                
//                [view setFrame:CGRectMake(width*2, y , 0, height)];
//                
//            } completion:^(BOOL finished){
//                
//            }];
//            break;
//            
//        }
//    }
//    
//    
//}
//#pragma mark - adjust string -
//+(void )resolveCoordinatesStringToFloat:(NSString *)CoordinatesString{
//    //NSString *exampleStr = @"(123,345)"
//   NSRange search = [CoordinatesString rangeOfString:@","];
//   NSString *CoordinatesStr_X = [[CoordinatesString substringFromIndex:1] substringToIndex:search.location-1];
//    NSString *CoordinatesStr_Y = [[CoordinatesString substringFromIndex:search.location+1]substringToIndex:[CoordinatesString substringFromIndex:search.location+1].length-1];
//    
//    NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
//    format.numberStyle = NSNumberFormatterDecimalStyle;
//    
//    NSNumber *CoordinatesNum_X = [format numberFromString:CoordinatesStr_X];
//    float CoordinatesFloat_X = [CoordinatesNum_X floatValue];
//    NSNumber *CoordinatesNum_Y = [format numberFromString:CoordinatesStr_Y];
//    float CoordinatesFloat_Y = [CoordinatesNum_Y floatValue];
//    
//    NSLog(@"x = %.1f, y = %.1f",CoordinatesFloat_X,CoordinatesFloat_Y);
//    
//    
//
//}
//+(NSString *)assembleStringfromStringArr:(NSMutableArray *)StringArr{
//    NSString *assembleStr = [StringArr componentsJoinedByString:@"\n"];
//    return assembleStr;
//}
//+(void)stringDividedInto2Character:(NSString *)importString{
//    NSInteger sep_count    = 2;
//    NSUInteger stringCount = [importString length];
//    NSString *aString = [NSString new];
//    for (NSInteger i = 0; i <= stringCount-sep_count; i = i+sep_count) {
//        NSRange range = NSMakeRange(i, sep_count);
//        aString = [importString substringWithRange:range];
//        
//    }
//    
//}
//
//+(NSData *)dataFromHexString:(NSString *)string
//{
//    string = [string lowercaseString];
//    NSMutableData *data= [NSMutableData new];
//    unsigned char whole_byte;
//    char byte_chars[3] = {'\0','\0','\0'};
//    int i = 0;
//    int length = string.length;
//    while (i < length-1) {
//        char c = [string characterAtIndex:i++];
//        if (c < '0' || (c > '9' && c < 'a') || c > 'f')
//            continue;
//        byte_chars[0] = c;
//        byte_chars[1] = [string characterAtIndex:i++];
//        whole_byte = strtol(byte_chars, NULL, 16);
//        [data appendBytes:&whole_byte length:1];
//    }
//    return data;
//}
//#pragma mark - file manager with plistFile -
//+ (void)createFileWithFileName :(NSString *)fileName type:(NSString *)typeName{
//    //取得路徑
//    NSString *filePath = [YYxSimpleFactory_ObjC documentsDirectoryPath];
//    
//    // 1. 無資料夾
//    filePath = [filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",fileName,typeName]];
//    
//    if ( [[NSFileManager defaultManager] fileExistsAtPath:filePath]){
//        NSLog(@"檔案已經存在");
//    }else{
//        NSLog(@"檔案尚未建立");
//        // 利用陣列將檔案儲存
//        NSMutableArray *array =[[NSMutableArray alloc] init];
//        [array addObject:@"內文文字"];
//        [array writeToFile:filePath atomically:YES];
//        NSLog(@"檔案已經建立");
//    }
//}
//
//+(BOOL)readFileWithFileName :(NSString *)fileName type:(NSString *)typeName{
//    NSString *filePath = [[YYxSimpleFactory_ObjC documentsDirectoryPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",fileName,typeName]];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    if ([fileManager fileExistsAtPath: filePath]) //檢查檔案是否存在
//    {
//        NSLog(@"file exsit ");
//        return true;
//    }else{
//        NSLog(@"no plist file");
//        return false;
//        
//    }
//    
//}
//+(void)createDirectoryWithDirName:(NSString *) dirName{
//    NSString *filePath = [YYxSimpleFactory_ObjC documentsDirectoryPath];
//    NSString *dirPath = [filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",dirName]];
//    
//    
//    if ( [[NSFileManager defaultManager] fileExistsAtPath:dirPath]){
//        NSLog(@"資料夾已經存在");
//    }else{
//        NSLog(@"資料夾尚未建立");
//        [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
//        NSLog(@"資料夾已經建立");
//    }
//}
//+(void)createFilewitchDirectName:(NSString *)DirName WithFileName:(NSString *)createFileName type:(NSString *)typeName{
//    //取得路徑
//    NSString *filePath = [YYxSimpleFactory_ObjC documentsDirectoryPath];
//    
//    // 2. 有資料夾（要先建立資料夾，否則無法建立檔案）
//    filePath = [filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",DirName]];
//    filePath = [filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",createFileName,typeName]];
//    
//    
//    if ( [[NSFileManager defaultManager] fileExistsAtPath:filePath]){
//        NSLog(@"檔案已經存在");
//    }else{
//        NSLog(@"檔案尚未建立");
//        // 利用陣列將檔案儲存
//        NSMutableArray *array =[[NSMutableArray alloc] init];
//        [array addObject:@"內文文字"];
//        [array writeToFile:filePath atomically:YES ];
//        NSLog(@"檔案已經建立");
//    }
//}
//- (NSArray *)checkDirFileNumber:(NSString *) DirName{
//    //本機端資料夾叫Documents
//    //檔案列表、資料夾列表、檔案用列表,檢查資料夾與檔案數量
//    NSArray *fileList = [[NSArray alloc] init];
//    NSMutableArray *totalArray = [[NSMutableArray alloc] init];
//    NSMutableArray *dirArray = [[NSMutableArray alloc] init];
//    NSMutableArray *newfileList = [[NSMutableArray alloc] init];
//    
//    // 檢查檔案(其實包含資料夾)
//    NSString *filePath = [YYxSimpleFactory_ObjC documentsDirectoryPath];
//    
//    // 1. 無資料夾
//    filePath = [filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",DirName]];
//    fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:filePath error:nil];
//    NSLog(@"資料夾加檔案為=%@", fileList);
//    
//    //將陣列複製到另一個陣列中進行存取
//    newfileList = [fileList mutableCopy];
//    
//    // 檢查資料夾
//    BOOL isdir = NO;
//    for (NSString *file in fileList) {
//        NSString *newpath = [[YYxSimpleFactory_ObjC documentsDirectoryPath] stringByAppendingPathComponent:file];
//        [[NSFileManager defaultManager] fileExistsAtPath:newpath isDirectory:&isdir];
//        if (isdir) {
//            [dirArray addObject:file]; // 判斷為資料夾並儲存
//            [newfileList removeObject:file]; //將該陣列的該筆資料刪除
//        }
//        isdir = NO;
//    }
//    
//    [totalArray addObject:dirArray];
//    [totalArray addObject:newfileList];
//    NSLog(@"total(資料夾陣列, 檔案陣列) = %@", totalArray);
//    
//    return totalArray;
//}
//
//
//
//
//#pragma mark - other:home paths
//+(NSString *)documentsDirectoryPath{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    return documentsDirectory;
//}
//+(NSString *)documentsDirectoryPath_inProjectWithFileName:(NSString *)fileName{//位於專案檔內
//    NSString *documentsDirectory = [[NSBundle mainBundle]pathForResource:fileName ofType:@"plist"];
//    return documentsDirectory;
//}
////回傳 APP 的沙箱路徑
//+(NSString *) sandBoxHomePath{
//    return NSHomeDirectory();
//}
//+(void)copyFileToAPP_FromProjectFileName:(NSString *)fileName ofType:(NSString *)typeName{
////    path1
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *APPFilePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:
//    [NSString stringWithFormat:@"%@.%@",fileName,typeName]];
////    path2
//    NSString *projectFilePath = [[NSBundle mainBundle]pathForResource:fileName ofType:typeName];
//    
////    file copy
//    NSFileManager *fileManager = [NSFileManager new];
//    [fileManager copyItemAtPath:projectFilePath toPath:APPFilePath error:nil];
//    
//}
//+(UIColor *)randomColor{
//    
//    NSInteger aRedValue = arc4random()%255;
//    NSInteger aGreenValue = arc4random()%255;
//    NSInteger aBlueValue = arc4random()%255;
//    
//    UIColor *randomColor = [UIColor colorWithRed:aRedValue/255.0f green:aGreenValue/255.0f blue:aBlueValue/255.0f alpha:1.0f];
//    
//    return randomColor;
//}
//+(NSString *)presentlyTimerForString{
//    
//    NSDateFormatter *dateFormatter = [NSDateFormatter new];
//    [dateFormatter setDateFormat:@"H:m:s"];//時分秒
//    //     [dateFormatter setDateFormat:@"H:m"];//時分
//    
//    NSDate *today = [NSDate date];
//    //    NSLog(@"date for now =%@",[dateFormatter stringFromDate:today]);
//    
//    return [dateFormatter stringFromDate:today];
//}
//
//
//+(void)sendEMail_toBehindtravelerWithMessage:(NSString *)message{
//    
//    NSString *to = @"behindtraveler@gmail.com";
//    NSString *subject = @"APP log to you";
//    
//    NSString *mailStr= [NSString stringWithFormat:@"mailto:%@?subject=%@",to,subject];
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:mailStr]];
//    
//}
//+(void)openEmail{
////    1.不用副執行緒開會很慢
//    /**可能原因
//     Had the exact same symptoms that you described: worked fine on iOS6, but ~10 second hang on iOS7. Turns out to be a threading issue.
//     
//     We were issuing the  [UIApplication sharedApplication] openURL directly from the AppDelegate method applicationDidBecomeActive(). Moving this to a background thread instantly solved the problem:
//     
//     from http://stackoverflow.com/questions/19356488/openurl-freezes-app-for-over-10-seconds
//     **/
////    2.執行起來會有Unable to simultaneously satisfy constraints.警告
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSString *to = @"inmy21@gmail.com";
//        NSString *subject = @"APP log to you";
//        NSString *str = [NSString stringWithFormat:@"mailto:%@?subject=%@",to,subject]; // some URL
//        //
//        NSString *result = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//        
//        NSLog(@"%@",result);
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:result]];
//        
//        
//    });
//
//}
//+(NSArray *)readJsonFileWithPath:(NSString *)filePath{
//    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
//    NSArray *jasonObj_Arr = [NSJSONSerialization dataWithJSONObject:jsonData options:NSJSONReadingMutableContainers error:nil];
//    
//    for (NSDictionary *DicBox in jasonObj_Arr) {
////        NSDictionary *tel = [DicBox objectForKey:@"電話"]; 需要確定arr裡面的資料型態不然讀出來會carsh
//    
//    }
//    return jasonObj_Arr;
//}

@end
