//
//  SJHelperClass.h
//  GlobalProject
//
//  Created by Saurabh on 08/07/16.
//  Copyright © 2016 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SJAlert : NSObject
/**
 *  Show the simple alert.
 *
 *  @param title       Title of the alert.
 *  @param message     Message you want to show.
 *  @param actionTitle Title of button.
 *  @param controller  In which controller you want to present.
 */
+(void)showSimpleAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle: (NSString *)actionTitle onController:(UIViewController *)controller;

/**
 *  Show the alert with one button action.
 *
 *  @param title            Title of the alert.
 *  @param message          Message you want to show.
 *  @param actionTitle      Title of button.
 *  @param controller       In which controller you want to present.
 *  @param completionHander Call when button did clicked.
 */
+(void)showSingleButtonAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle onColtroller:(UIViewController *)controller handler:(void(^)(BOOL success))completionHander;


/**
 *  Show the alert with two button action and support both style alert and action sheet style.
 *
 *  @param title              Title of alert or action sheet.
 *  @param message            Message you want to show on alert or
                              action sheet.
 *  @param actionTitle1       Title of button 1.
 *  @param actionTitle2       Title of button 2.
 *  @param style              In which style you want to show alert or
                              action sheet.
 *  @param controller         In which controller you want to show.
 *  @param CompletionHandler1 Call when button 1 did clicked.
 *  @param CompletionHandler2 Call when button 2 did clicked.
 */
+(void)showDoubleButtonAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle1:(NSString *)actionTitle1 actionTitle2:(NSString *)actionTitle2 alertStyle:(UIAlertControllerStyle)style onController:(UIViewController *)controller handler1:(void(^)(BOOL success1))CompletionHandler1 handler2:(void(^)(BOOL success2))CompletionHandler2;

/**
 *  Show the alert with a text field.
 *
 *  @param title             Title of the alert.
 *  @param message           Alert message you want to show.
 *  @param actionTitle       Title of button.
 *  @param placeHolder       Place holder of text field.
 *  @param controller        In which controller you want to show.
 *  @param CompletionHandler Call when button did clicked.
 */
+(void)showSingleTextAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle placeHolder:(NSString *)placeHolder onController:(UIViewController *)controller handler:(void(^)(UITextField *text))CompletionHandler;

/**
 *  Show the alert with two text field, the second text filed is either text or password.
 *
 *  @param title             Title of the alert.
 *  @param message           Alert message you want to show.
 *  @param actionTitle       Title of button.
 *  @param placeHolder1      Place holder of text field 1.
 *  @param placeHolder2      Place holder of text filed 2.
 *  @param password          Define the second text field secure or not
 *  @param controller        In which controller you want to present.
 *  @param completionHandler Call when button did clicked.
 */
+(void)showDoubleTextAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle placeHolder1:(NSString *)placeHolder1 placeHolder2:(NSString *)placeHolder2 isPassword:(BOOL)password onController:(UIViewController *)controller handler:(void(^)(UITextField *text1,UITextField *text2))completionHandler;

/**
 *  This show the custom Alert with animation in both direction up and down.
 *
 *  @param message         Message text you want to show.
 *  @param height          Height of the custom view.
 *  @param fontSize        Size of the text font.
 *  @param direction       In which direction you want to show either  
                           up or down.
 *  @param backgroundColor Background color of the custom view.
 *  @param textColor       Text color of the text.
 *  @param controller      In which controller you want to present.
 *  @param completionhand  Call when animation completed.
 */
+(void)showAnimatableAlertWithMessage:(NSString *)message height:(CGFloat)height fontSize:(CGFloat)fontSize isUpDirection:(BOOL)direction backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor onController:(UIViewController *)controller handler:(void(^)(BOOL success))completionHander;
@end
