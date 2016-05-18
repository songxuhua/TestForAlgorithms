//
//  CustomMode.h
//  TestForAlgorithms
//
//  Created by 宋华 on 16/5/18.
//  Copyright © 2016年 宋华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum {
    ConsumeStatus_verifying,
    ConsumeStatus_verifyFailed,
    ConsumeStatus_cashBack,
    ConsumeStatus_noRejected
} ConsumeStatus;

@interface CustomMode : NSObject

@property (nonatomic,copy)NSString *customName;
@property (nonatomic,copy)NSString *couponCode;
@property (nonatomic,assign)CGFloat couponPrice;
@property (nonatomic,assign)ConsumeStatus consumeStatus;


@end
