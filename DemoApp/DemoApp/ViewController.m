//
//  ViewController.m
//  DemoApp
//
//  Created by MAXIM TSVETKOV on 23.09.15.
//  Copyright © 2015 MAXIM TSVETKOV. All rights reserved.
//

#import "ViewController.h"
#import "MTAlertWrapper.h"

@interface ViewController ()
{
    MTAlertWrapper *alertWrapper;
}

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

#pragma mark - IBActions

- (IBAction)buttonDidClickButtonPressed:(id)sender
{
    alertWrapper = [[MTAlertWrapper alloc] init];

    [alertWrapper showActionSheetInViewController:self
                                        withTitle:@"Action Sheet Title"
                                cancelButtonTitle:[self cancelButtonTitle]
                           otherButtonTitlesArray:[self otherButtonTitles]
                                clickedCompletion:^(NSInteger buttonIndex, NSString *actionTitle, NSString *inputText){
                          
                                    if (actionTitle) {
                                        buttonIndex = [self indexOfButtonWithTitle:actionTitle];
                                    }
                                    
                                    NSString *additionalText = @"when Button Did Click";

                                    [self showAlertWithButtonIndex:buttonIndex
                                                    additionalText:additionalText
                                             actionSheetDidDismiss:NO];
                                }
                                didDismissCompletion:nil];
}

- (IBAction)actionSheetDidDismissButtonPressed:(id)sender
{
    alertWrapper = [[MTAlertWrapper alloc] init];
    
    [alertWrapper showActionSheetInViewController:self
                                        withTitle:@"Action Sheet Title"
                                cancelButtonTitle:[self cancelButtonTitle]
                           otherButtonTitlesArray:[self otherButtonTitles]
                                clickedCompletion:nil
                             didDismissCompletion:^(NSInteger buttonIndex, NSString *actionTitle, NSString *inputText){
                       
                                 if (actionTitle) {
                                     buttonIndex = [self indexOfButtonWithTitle:actionTitle];
                                 }
                                 
                                 NSString *additionalText = @"when Action Sheet Did Dismiss";
                       
                                 [self showAlertWithButtonIndex:buttonIndex
                                                 additionalText:additionalText
                                          actionSheetDidDismiss:YES];
                                }];
}

#pragma mark - Helper

- (void)showAlertWithButtonIndex:(NSInteger)buttonIndex
                  additionalText:(NSString *)additionalText
           actionSheetDidDismiss:(BOOL)isActionSheetDidDismiss
{
    alertWrapper = [[MTAlertWrapper alloc] init];
    
    NSString *alertTitle = [self otherButtonTitleAtIndex:buttonIndex];
    NSString *alertText = [NSString stringWithFormat:@"Alert Text %@", additionalText];
    
    switch (buttonIndex) {
        case 2:
        {
            [alertWrapper showAlertInViewController:self
                                          withTitle:alertTitle
                                            message:alertText
                                  cancelButtonTitle:[self cancelButtonTitle]
                             otherButtonTitlesArray:[self otherButtonTitles]
                                  clickedCompletion:^(NSInteger buttonIndex, NSString *actionTitle, NSString *inputText){
                                   
                                      if (actionTitle) {
                                          buttonIndex = [self indexOfButtonWithTitle:actionTitle];
                                      }
                                      
                                      if (!isActionSheetDidDismiss) {
                                          [self showAlertWithButtonIndex:buttonIndex
                                                          additionalText:additionalText
                                                   actionSheetDidDismiss:isActionSheetDidDismiss];
                                      }
                                   
                                    }
                               didDismissCompletion:^(NSInteger buttonIndex, NSString *actionTitle, NSString *inputText){
                                
                                   if (actionTitle) {
                                       buttonIndex = [self indexOfButtonWithTitle:actionTitle];
                                   }
                                   
                                   if (isActionSheetDidDismiss) {
                                       [self showAlertWithButtonIndex:buttonIndex
                                                       additionalText:additionalText
                                                actionSheetDidDismiss:isActionSheetDidDismiss];
                                   }
                                
                               }];
        }
            break;
        case 3:
        {
            [alertWrapper showInputTextAlertInViewController:self
                                                   withTitle:alertTitle
                                                     message:alertText
                                           cancelButtonTitle:[self cancelButtonTitle]
                                      otherButtonTitlesArray:@[@"Enter"]
                                           clickedCompletion:^(NSInteger buttonIndex, NSString *actionTitle, NSString *inputText){
                
                                            if (!isActionSheetDidDismiss) {
                                                
                                                if (actionTitle) {
                                                
                                                    if ([actionTitle isEqualToString:[self cancelButtonTitle]]) {
                                                        [self showAlertWithButtonIndex:0
                                                                        additionalText:additionalText
                                                                 actionSheetDidDismiss:isActionSheetDidDismiss];
                                                    } else if ([actionTitle isEqualToString:@"Enter"]) {
                                                        alertWrapper = [[MTAlertWrapper alloc] init];
                                                        [alertWrapper showAlertInViewController:self
                                                                                      withTitle:@"Input Text"
                                                                                        message:inputText];
                                                    }

                                                } else {
                                                
                                                    if (buttonIndex == 0) {
                                                        [self showAlertWithButtonIndex:0
                                                                        additionalText:additionalText
                                                                 actionSheetDidDismiss:isActionSheetDidDismiss];
                                                    } else if (buttonIndex == 1) {
                                                        alertWrapper = [[MTAlertWrapper alloc] init];
                                                        [alertWrapper showAlertInViewController:self
                                                                                      withTitle:@"Input Text"
                                                                                        message:inputText];
                                                    }
                                                    
                                                }
                                                
                                            }
                
                                         }
                                  didDismissCompletion:^(NSInteger buttonIndex, NSString *actionTitle, NSString *inputText){
            
                                            if (isActionSheetDidDismiss) {
                                                
                                                if (actionTitle) {
                                                    
                                                    if ([actionTitle isEqualToString:[self cancelButtonTitle]]) {
                                                        [self showAlertWithButtonIndex:0
                                                                        additionalText:additionalText
                                                                 actionSheetDidDismiss:isActionSheetDidDismiss];
                                                    } else if ([actionTitle isEqualToString:@"Enter"]) {
                                                        alertWrapper = [[MTAlertWrapper alloc] init];
                                                        [alertWrapper showAlertInViewController:self
                                                                                      withTitle:@"Input Text"
                                                                                        message:inputText];
                                                    }
                                                    
                                                } else {
                                                    
                                                    if (buttonIndex == 0) {
                                                        [self showAlertWithButtonIndex:0
                                                                        additionalText:additionalText
                                                                 actionSheetDidDismiss:isActionSheetDidDismiss];
                                                    } else if (buttonIndex == 1) {
                                                        alertWrapper = [[MTAlertWrapper alloc] init];
                                                        [alertWrapper showAlertInViewController:self
                                                                                      withTitle:@"Input Text"
                                                                                        message:inputText];
                                                    }
                                                    
                                                }
                                            }
            
                                      }];
        }
            break;
        case 4:
        {
            [alertWrapper showErrorAlertInViewController:self withMessage:alertText];
        }
            break;
        case 5:
        {
            [alertWrapper showRepeatRequestAlertInViewController:self
                                                       withTitle:alertTitle
                                                         message:alertText
                                               clickedCompletion:^(NSInteger buttonIndex, NSString *actionTitle, NSString *inputText){
                                           
                                           if (!isActionSheetDidDismiss) {
                                               
                                               if (actionTitle) {
                                                   
                                                   if ([actionTitle isEqualToString:@"Repeat"]) {
                                                       [self showAlertWithButtonIndex:5
                                                                       additionalText:additionalText
                                                                actionSheetDidDismiss:isActionSheetDidDismiss];
                                                   }
                                                   
                                               } else {
                                                   
                                                   if (buttonIndex == 1) {
                                                       [self showAlertWithButtonIndex:5
                                                                       additionalText:additionalText
                                                                actionSheetDidDismiss:isActionSheetDidDismiss];
                                                   }
                                                   
                                               }
                                               
                                           }
                                           
                                       }
                                            didDismissCompletion:^(NSInteger buttonIndex, NSString *actionTitle, NSString *inputText){
                                        
                                        if (isActionSheetDidDismiss) {
                                            
                                            if (actionTitle) {
                                                
                                                if ([actionTitle isEqualToString:@"Repeat"]) {
                                                    [self showAlertWithButtonIndex:5
                                                                    additionalText:additionalText
                                                             actionSheetDidDismiss:isActionSheetDidDismiss];
                                                }
                                                
                                            } else {
                                                
                                                if (buttonIndex == 1) {
                                                    [self showAlertWithButtonIndex:5
                                                                    additionalText:additionalText
                                                             actionSheetDidDismiss:isActionSheetDidDismiss];
                                                }
                                                
                                            }
                                        }
                                        
                                    }];
        }
            break;
        default:
        {
            [alertWrapper showAlertInViewController:self
                                          withTitle:alertTitle
                                            message:alertText];
        }
            break;
    }
}

- (NSArray *)otherButtonTitles
{
    return @[@"Alert with Text",
             @"Alert with Buttons",
             @"Alert with Input Text",
             @"Alert with Error Message",
             @"Alert with Repeat Request"];
}

- (NSString *)otherButtonTitleAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        return [self cancelButtonTitle];
    }
    return [[self otherButtonTitles] objectAtIndex:(buttonIndex-1)];
}

- (NSInteger)indexOfButtonWithTitle:(NSString *)buttonTitle
{
    if ([buttonTitle isEqualToString:[self cancelButtonTitle]]) {
        return 0;
    }
    return [[self otherButtonTitles] indexOfObject:buttonTitle] + 1;
}

- (NSString *)cancelButtonTitle
{
    return @"Cancel";
}

@end
