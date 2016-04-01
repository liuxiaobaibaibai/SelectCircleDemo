//
//  ViewController.m
//  SelectCircleDemo
//
//  Created by huhaifeng on 16/3/15.
//  Copyright © 2016年 huhaifeng. All rights reserved.
//
#define RGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#import "ViewController.h"
#import "CircleSelectView.h"


@interface ViewController ()<CircleSelecteDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CircleSelectView * view =[[CircleSelectView alloc]initWithFrame:CGRectMake(100, 50, 300, 300)];
    [view setViewDelegate:self];
    [self.view addSubview:view];

}
- (void)viewWillAppear:(BOOL)animated{

}

#pragma mark --CircleButtonClick
- (void)ButtonClick:(NSInteger)Tag{
    
    NSArray * array =@[@"一",@"二",@"三",@"四",@"五",@"六"];
    NSString * msg =[array objectAtIndex:Tag];
    [self MsgShowVC:msg];
}

- (void)DefaultReturnButton:(UIButton *)button{
    
    self.showLabel.text =[NSString stringWithFormat:@"已选中的是:%@",[button titleForState:UIControlStateNormal]];
}
#pragma mark --CircleDelegate
- (NSArray *)buttonHeightImageWithItems{
    
    return @[];
}

- (NSArray *)buttonImageWithItems{
    return @[];
}

- (NSArray *)buttonTitleWithItems{
    return @[@"一",@"二",@"三",@"四",@"五",@"六"];
}

- (NSArray *)weakSelfColors{
    
    return @[RGBColor(255, 0, 0),RGBColor(255, 153, 0),RGBColor(221, 221, 221),RGBColor(0, 0, 0),RGBColor(255, 153, 0),RGBColor(221, 221, 221)];
}

- (NSInteger)buttonWithNumbers{
    return 6;
}

- (CGSize)buttonWithSIze{
    
    return CGSizeMake(60, 60);
}

- (void)MsgShowVC:(NSString *)msg{
    
    
     #if __IPHONE_OS_VERSION_MAX_ALLOWED <= __IPHONE_8_0
     UIAlertView *alerV = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
     alertV.tag =2200;
     alertV.delegate =self;
     [alerV show];
     #else
     UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];

     UIAlertAction *actCancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

     }];
     UIAlertAction *sureCancle = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

     }];
     
     [alerVC addAction:actCancle];
     [alerVC addAction:sureCancle];
     [self presentViewController:alerVC animated:YES completion:nil];
     #endif
    
}
@end
