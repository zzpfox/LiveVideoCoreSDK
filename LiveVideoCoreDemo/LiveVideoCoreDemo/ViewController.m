//
//  ViewController.m
//  LiveVideoCoreDemo
//
//  Created by Alex.Shi on 16/3/2.
//  Copyright © 2016年 com.Alex. All rights reserved.
//

#import "ViewController.h"
#import "LiveShowViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    LiveShowViewController* _LiveShowViewController;
    UITextField* _RtmpUrlTextField;
    UIButton* _StartButton;
}

-(void) UIInit{
    double fScreenW = [UIScreen mainScreen].bounds.size.width;
    
    float fRtmpUrlTextFieldX = 10;
    float fRtmpUrlTextFieldY = 100;
    float fRtmpUrlTextFieldW = fScreenW-2*fRtmpUrlTextFieldX;
    float fRtmpUrlTextFieldH = 30;
    _RtmpUrlTextField = [[UITextField alloc] initWithFrame:CGRectMake(fRtmpUrlTextFieldX, fRtmpUrlTextFieldY, fRtmpUrlTextFieldW, fRtmpUrlTextFieldH)];
    _RtmpUrlTextField.backgroundColor = [UIColor lightGrayColor];
    [_RtmpUrlTextField setTextColor:[UIColor whiteColor]];
    _RtmpUrlTextField.layer.masksToBounds = YES;
    _RtmpUrlTextField.layer.cornerRadius  = 5;
    _RtmpUrlTextField.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_RtmpUrlTextField];
    
    float fStartButtonW = 70;
    float fStartButtonH = 30;
    float fStartButtonX = fScreenW/2-fStartButtonW/2;
    float fStartButtonY = fRtmpUrlTextFieldY+fRtmpUrlTextFieldH+10;
    _StartButton = [[UIButton alloc] initWithFrame:CGRectMake(fStartButtonX, fStartButtonY, fStartButtonW, fStartButtonH)];
    _StartButton.backgroundColor = [UIColor blueColor];
    _StartButton.layer.masksToBounds = YES;
    _StartButton.layer.cornerRadius  = 5;
    [_StartButton setTitle:@"开始直播" forState:UIControlStateNormal];
    [_StartButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _StartButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    [_StartButton addTarget:self action:@selector(OnStartLiveClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_StartButton];
}

-(void)OnStartLiveClicked:(id)sender{
    NSLog(@"Start live Rtmp:%@", _RtmpUrlTextField.text);
    _LiveShowViewController = [[LiveShowViewController alloc] init];
    
    [_LiveShowViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    _LiveShowViewController.RtmpUrl = [NSURL URLWithString:_RtmpUrlTextField.text];
    
    [self presentModalViewController:_LiveShowViewController animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self UIInit];
    
    _RtmpUrlTextField.text = @"rtmp://192.168.30.163/live/123456";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//隐藏键盘的方法
-(void)hidenKeyboard
{
    [_RtmpUrlTextField resignFirstResponder];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![_RtmpUrlTextField isExclusiveTouch]) {
        [_RtmpUrlTextField resignFirstResponder];
    }
}
@end
