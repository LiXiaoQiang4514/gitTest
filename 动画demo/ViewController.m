//
//  ViewController.m
//  动画demo
//
//  Created by LiXiaoQiang on 2017/2/13.
//  Copyright © 2017年 BSD. All rights reserved.
//

#import "ViewController.h"
#import <Lottie/Lottie.h>

@interface ViewController ()

@property (nonatomic, strong) LAAnimationView *animationView;

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UIButton *button1;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.animationView = [LAAnimationView animationNamed:@"TwitterHeart"];
    self.animationView.contentMode = UIViewContentModeScaleAspectFill;
    //循环播放
    self.animationView.loopAnimation = YES;
    [self.view addSubview:self.animationView];
   //直接开启播放
//    [self.animationView playWithCompletion:^(BOOL animationFinished) {
//        
//    }];
    
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button setTitle:@"点击播放动画" forState:UIControlStateNormal];
    self.button.frame = CGRectMake(20, 300, 375 - 40, 40);

    [self.button addTarget:self action:@selector(paly:) forControlEvents:UIControlEventTouchUpInside];
    self.button.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.button];
    
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button1.frame = CGRectMake(20, 400, 375 - 40, 40);
    [self.button1 setTitle:@"点击暂停动画" forState:UIControlStateNormal];
    [self.button1 addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    self.button1.backgroundColor = [UIColor cyanColor];

    [self.view addSubview:self.button1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.animationView play];
//}
//
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    [self.animationView pause];
//}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect lottieRect = CGRectMake(0, 0, self.view.bounds.size.width*0.5, self.view.bounds.size.height * 0.3);
    
    self.animationView.frame = lottieRect;
    self.animationView.center = CGPointMake(self.view.bounds.size.width*0.5, 100);
    
}

- (void)paly:(UIButton *)button
{
    NSLog(@"点击了播放动画");
    self.animationView.animationProgress = 0;
    [self.animationView play];
    
}

- (void)pause
{
    [self.animationView pause];
}


@end
