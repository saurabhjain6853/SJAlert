//
//  SJHelperClass.m
//  GlobalProject
//
//  Created by Saurabh on 08/07/16.
//  Copyright © 2016 Aryavrat Infotech. All rights reserved.
//

#import "SJAlert.h"

@implementation SJAlert
+(void)showSimpleAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle: (NSString *)actionTitle onController:(UIViewController *)controller{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [controller presentViewController:alert animated:YES completion:nil];
}

+(void)showSingleButtonAlertWithTitle: (NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle onColtroller:(UIViewController *)controller handler:(void(^)(BOOL))completionHander{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(completionHander)
        completionHander(YES);
    }];
    [alert addAction:action];
    [controller presentViewController:alert animated:YES completion:nil];
}

+(void)showDoubleButtonAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle1:(NSString *)actionTitle1 actionTitle2:(NSString *)actionTitle2 alertStyle:(UIAlertControllerStyle)style onController:(UIViewController *)controller handler1:(void(^)(BOOL success1))CompletionHandler1 handler2:(void(^)(BOOL success2))CompletionHandler2{
    
    UIAlertController *alert= [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    UIAlertAction *action1=[UIAlertAction actionWithTitle:actionTitle1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(CompletionHandler1)
        CompletionHandler1(YES);
    }];
    UIAlertAction *action2= [UIAlertAction actionWithTitle:actionTitle2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(CompletionHandler2)
        CompletionHandler2(YES);
    }];
    if(style==UIAlertControllerStyleActionSheet){
        UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
    }
    [alert addAction:action1];
    [alert addAction:action2];
    [controller presentViewController:alert animated:YES completion:nil];
}

+(void)showSingleTextAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle placeHolder:(NSString *)placeHolder onController:(UIViewController *)controller handler:(void (^)(UITextField *))CompletionHandler{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=placeHolder;
    }];
    UIAlertAction *action=[UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *text=alert.textFields.firstObject;
        if(CompletionHandler)
        CompletionHandler(text);
    }];
    [alert addAction:action];
    [controller presentViewController:alert animated:YES completion:nil];
}

+(void)showDoubleTextAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle placeHolder1:(NSString *)placeHolder1 placeHolder2:(NSString *)placeHolder2 isPassword:(BOOL)password onController:(UIViewController *)controller handler:(void(^)(UITextField *text1,UITextField *text2))completionHandler{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=placeHolder1;
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=placeHolder2;
        if(password)
            textField.secureTextEntry=YES;
    }];
    UIAlertAction *action=[UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *text1= alert.textFields.firstObject;
        UITextField *text2= alert.textFields.lastObject;
        if(completionHandler)
        completionHandler(text1,text2);
    }];
    [alert addAction:action];
    [controller presentViewController:alert animated:YES completion:nil];
}

+(void)showAnimatableAlertWithMessage:(NSString *)message height:(CGFloat)height fontSize:(CGFloat)fontSize isUpDirection:(BOOL)direction backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor onController:(UIViewController *)controller handler:(void(^)(BOOL success))completionHander{
    
    UIView *backgroundView= [[UIView alloc]initWithFrame:controller.view.frame];
    backgroundView.backgroundColor= [UIColor lightGrayColor];
    backgroundView.layer.opacity=0.3;
    
    [controller.view addSubview:backgroundView];
    if(direction){
    backgroundView.hidden=YES;
UILabel *textLable=[[UILabel alloc]initWithFrame:CGRectMake(0, -height, controller.view.frame.size.width, height)];
    
    textLable.text=message;
    textLable.backgroundColor=backgroundColor;
    textLable.textColor=textColor;
    textLable.textAlignment=NSTextAlignmentCenter;
    textLable.font=[UIFont boldSystemFontOfSize:fontSize];
    [controller.view addSubview:textLable];
    [UIView animateWithDuration:0.5 animations:^{
        backgroundView.hidden=NO;
      [textLable setFrame:CGRectMake(0, 0, controller.view.frame.size.width, textLable.frame.size.height)];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 delay:2.0 options:kNilOptions animations:^{
            
          [textLable setFrame:CGRectMake(0, -height, controller.view.frame.size.width, textLable.frame.size.height)];
        } completion:^(BOOL finished){
            backgroundView.hidden=YES;
            if(completionHander)
            completionHander(YES);
        }];
    }];
}
    else{
        backgroundView.hidden=YES;
        UILabel *textLable=[[UILabel alloc]initWithFrame:CGRectMake(0, controller.view.frame.size.height, controller.view.frame.size.width, height)];
        
        textLable.text=message;
        textLable.backgroundColor=backgroundColor;
        textLable.textColor=textColor;
        textLable.textAlignment=NSTextAlignmentCenter;
        textLable.font=[UIFont boldSystemFontOfSize:fontSize];
        [controller.view addSubview:textLable];
        [UIView animateWithDuration:0.5 animations:^{
            backgroundView.hidden=NO;

            [textLable setFrame:CGRectMake(0, controller.view.frame.size.height-height, controller.view.frame.size.width, textLable.frame.size.height)];
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.5 delay:2.0 options:kNilOptions animations:^{
    
                [textLable setFrame:CGRectMake(0, controller.view.frame.size.height, controller.view.frame.size.width, textLable.frame.size.height)];
            } completion:^(BOOL finished){
                backgroundView.hidden=YES;
                if(completionHander)
                completionHander(YES);
            }];
        }];
    }
}
@end
