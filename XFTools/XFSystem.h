//
//  XFSystemp.h
//  XFTools
//
//  Created by 谢帆 on 16/12/1.
//  Copyright © 2016年 谢帆. All rights reserved.
//

#ifndef XFSystemp_h
#define XFSystemp_h


/**<获取类实例*/
#define GetClassInstance(cls_name) [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:cls_name]

/**<屏幕宽度*/
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width

/**<屏幕高度*/
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

/**<获取应用当前版本号*/
#define PCReleaseVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define PCReleaseVersionString [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//============== 工具 =======================

/**<操作系统iOS7*/
#define iOS7 (([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) ? YES : NO)
/**<操作系统iOS8*/
#define iOS8 (([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) ? YES : NO)
//操作系统iOS9
#define iOS9 (([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) ? YES : NO)
//操作系统iOS10
#define iOS10 (([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) ? YES : NO)

#define iPhone4        (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)480) < DBL_EPSILON)

#define iPhone5        (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)568) < DBL_EPSILON)
#define iPhone6        (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
#define iPhone6Plus    (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)

/**<判断字符串是否为空*/
#define STRINGHASVALUE(str)		(str && [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0)

/**<主要是客户端测试用 是否输出日志*/
#ifndef DEBUG
#define NSLog(...);
#endif

/**<判断字符串是否为nil，否则设置为空，为程序健壮性考虑*/
#define N(x) (x && x.length > 0) ? x : @""
#endif /* XFSystemp_h */
