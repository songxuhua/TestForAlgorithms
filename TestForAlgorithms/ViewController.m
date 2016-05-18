//
//  ViewController.m
//  TestForAlgorithms
//
//  Created by 宋华 on 16/5/18.
//  Copyright © 2016年 宋华. All rights reserved.
//

#import "ViewController.h"
#import "CustomMode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self sortArr];
        [self sortArr1];
    });
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)sortArr1 {
    NSMutableArray *customArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0 ; i < 100; i ++) {
        CustomMode *mode = [[CustomMode alloc] init];
        mode.customName = [NSString stringWithFormat:@"客户%ld",(long)i];
        mode.couponCode = [self arcdomStr];
        mode.couponPrice = arc4random()%8888 + 1;
        mode.consumeStatus = arc4random()%ConsumeStatus_noRejected;
        [customArr addObject:mode];
    }
    NSDate *date = [NSDate date];
    
    // 1.先按照书名进行排序
    // 这里的key写的是@property的名称
    NSSortDescriptor *statusDesc = [NSSortDescriptor sortDescriptorWithKey:@"consumeStatus" ascending:YES];
    // 2.再按照姓进行排序
    NSSortDescriptor *priceDesc = [NSSortDescriptor sortDescriptorWithKey:@"couponPrice" ascending:YES];
    // 按顺序添加排序描述器
    NSArray *descs = [NSArray arrayWithObjects:statusDesc, priceDesc, nil];
    NSArray *array2 = [customArr sortedArrayUsingDescriptors:descs];
    //        for (CustomMode *mode in array2) {
    //            NSLog(@"\nconsumeStatus is %d couponPrice is %f\n\n",mode.consumeStatus,mode.couponPrice);
    //        }
    NSLog(@"tmv2 is %f",[[NSDate date] timeIntervalSinceDate:date]);
}

- (void)sortArr {
    NSMutableArray *customArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0 ; i < 100; i ++) {
        CustomMode *mode = [[CustomMode alloc] init];
        mode.customName = [NSString stringWithFormat:@"客户%ld",(long)i];
        mode.couponCode = [self arcdomStr];
        mode.couponPrice = arc4random()%8888 + 1;
        mode.consumeStatus = arc4random()%ConsumeStatus_noRejected;
        [customArr addObject:mode];
    }
    NSDate *date = [NSDate date];
    NSArray *sortArr =  [customArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        CustomMode *mode1 = (CustomMode *)obj1;
        CustomMode *mode2 = (CustomMode *)obj2;
        if (mode1.consumeStatus > mode2.consumeStatus) {
            return NSOrderedDescending;
        } else if (mode1.consumeStatus == mode2.consumeStatus) {
            return (mode1.couponPrice > mode2.couponPrice);
        } else if (mode1.consumeStatus < mode2.consumeStatus) {
            return NSOrderedAscending;
        }
        return  NSOrderedSame;
    }];
    NSLog(@"tmv is %f",[[NSDate date] timeIntervalSinceDate:date]);
    
//    for (CustomMode *mode in sortArr) {
//        NSLog(@"consumeStatus is %d couponPrice is %f\n\n",mode.consumeStatus,mode.couponPrice);
//    }
}

- (NSString *)arcdomStr {
    NSMutableString *string = [[NSMutableString alloc] init];
    for (NSInteger i = 0; i < 8; i++) {
        [string appendFormat:@"%d",arc4random()%10];
    }
    return string;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
