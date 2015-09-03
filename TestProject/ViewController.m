//
//  ViewController.m
//  TestProject
//
//  Created by 中山　貴仁 on 2015/09/03.
//  Copyright (c) 2015年 Nakayama Takahito. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    //ここで宣言した変数をメンバ変数と呼ぶ
    int number; //integer
    int x;
    int y;
    
    IBOutlet UILabel *label;
    IBOutlet UITextField *text;
    IBOutlet UIButton *plusButton;
    
    UIView *view;
    
    int directionX;
    int directionY;

    
    //変数の名前をきめるときのルール
    /*
     キャメルケースで書く
     １、アッパーキャメルケース LifeIsTech
      2、ローワーキャメルケース lifeIsTech
     */
    
}

-(IBAction)plus;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    text.delegate = self;
    
    
    
    //変数の有効範囲のことをスコープという
    //あるメソッドの中でしか使えない変数をローカル変数と呼ぶ
    view = [UIView new];
    view.frame = CGRectMake(0, 0, 100, 100);
    view.backgroundColor = [UIColor blueColor];
    view.layer.cornerRadius = 80;
    view.clipsToBounds = YES;
    view.center = self.view.center;
    [self.view addSubview:view];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                      target:self
                                                    selector:@selector(update)
                                                    userInfo:nil
                                                     repeats:YES];
    [timer fire];
    
    directionX = 1;
    directionY = 1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - メソッド
-(IBAction)plus{
    
    number += 1;
    
    label.text = [NSString stringWithFormat:@"%d",number];
    label.textColor = [UIColor redColor];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [text resignFirstResponder];
    return  YES;
}

-(void)update{
    
    
//    x = arc4random_uniform(self.view.bounds.size.width);
//    y = arc4random_uniform(self.view.bounds.size.height);
//
//
//    view.center = CGPointMake(x, y);
    
    view.center = CGPointMake(view.center.x + directionX, view.center.y + directionY);
    if (view.center.x > self.view.bounds.size.width) {
        
        directionX *= -1;
        
    }else if (view.center.x < 0){
        
        directionX *= -1;
    }
    
    if (view.center.y > self.view.bounds.size.height) {
        
        directionY *= -1;
        
    }else if (view.center.y < 0){
        
        directionY *= -1;
    }

    
    
    
}


@end
