//
//  ViewController.m
//  DemoProject
//
//  Created by Saurabh on 29/08/16.
//  Copyright © 2016 Aryavrat Infotech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)simpleAlert:(id)sender {
    [SJAlert showSimpleAlertWithTitle:@"Simple Alert" message:@"This is normal alert" actionTitle:@"This is action" onController:self];
}

- (IBAction)singleButtonAlert:(id)sender {
    [SJAlert showSingleButtonAlertWithTitle:@"Single Button Alert" message:@"This is single button action alert" actionTitle:@"This is action" onColtroller:self handler:^(BOOL success) {
        NSLog(@"This is single button action message");
    }];
}

- (IBAction)doubleButtonAlert:(id)sender {
    [SJAlert showDoubleButtonAlertWithTitle:@"Double Button Alert" message:@"This is double button action alert" actionTitle1:@"Action title first" actionTitle2:@"Action title second" alertStyle:UIAlertControllerStyleAlert onController:self handler1:^(BOOL success1) {
        NSLog(@"This is first button action message");
    } handler2:^(BOOL success2) {
        NSLog(@"This is second button action message");
    }];
}

- (IBAction)singleTextAlert:(id)sender {
    [SJAlert showSingleTextAlertWithTitle:@"Single text alert" message:@"This is single text alert" actionTitle:@"Action title" placeHolder:@"This is placeholder" onController:self handler:^(UITextField *text) {
        NSLog(@"The text you written in text field is:%@",text.text);
    }];
}

- (IBAction)doubleTextAlert:(id)sender {
    [SJAlert showDoubleTextAlertWithTitle:@"Double text alert" message:@"This is double text alert" actionTitle:@"action title" placeHolder1:@"First Placeholder" placeHolder2:@"Second Placeholder" isPassword:NO onController:self handler:^(UITextField *text1, UITextField *text2) {
        NSLog(@"This is your first text : %@ \n This is your second text: %@",text1.text,text2.text);
    }];
}

- (IBAction)customAlertUP:(id)sender {
    [SJAlert showAnimatableAlertWithMessage:@"This is custom up alert" height:60 fontSize:16 isUpDirection:YES backgroundColor:[UIColor redColor] textColor:[UIColor whiteColor] onController:self handler:^(BOOL success) {
        if(success){
            NSLog(@"Alert up show successfully");
        }
    }];
}

- (IBAction)customAlertDown:(id)sender {
  [SJAlert showAnimatableAlertWithMessage:@"This is custom down alert" height:60 fontSize:16 isUpDirection:NO backgroundColor:[UIColor blueColor] textColor:[UIColor whiteColor] onController:self handler:^(BOOL success) {
      if(success){
          NSLog(@"Alert down show successfully");
      }
  }];
}

@end
