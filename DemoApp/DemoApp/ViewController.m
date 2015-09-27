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
    
    [alertWrapper showActionSheetInView:self.view
                              withTitle:@"Action Sheet Title"
                      cancelButtonTitle:[self cancelButtonTitle]
                 otherButtonTitlesArray:[self otherButtonTitles]
                      clickedCompletion:^(NSInteger buttonIndex, NSString *text){
                          
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
    
    [alertWrapper showActionSheetInView:self.view
                              withTitle:@"Action Sheet Title"
                      cancelButtonTitle:[self cancelButtonTitle]
                 otherButtonTitlesArray:[self otherButtonTitles]
                      clickedCompletion:nil
                   didDismissCompletion:^(NSInteger buttonIndex, NSString *text){
                       
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
    NSLog(@"clicked button index: %d", buttonIndex);
    
    alertWrapper = [[MTAlertWrapper alloc] init];
    
    NSString *alertTitle = [self otherButtonTitleAtIndex:buttonIndex];
    NSString *alertText = [NSString stringWithFormat:@"Alert Text %@", additionalText];
    
    switch (buttonIndex) {
        case 2:
        {
            [alertWrapper showAlertViewWithTitle:alertTitle
                                         message:alertText
                               cancelButtonTitle:[self cancelButtonTitle]
                          otherButtonTitlesArray:[self otherButtonTitles]
                               clickedCompletion:^(NSInteger buttonIndex, NSString *text){
                                   
                                   if (!isActionSheetDidDismiss) {
                                       [self showAlertWithButtonIndex:buttonIndex
                                                       additionalText:additionalText
                                                actionSheetDidDismiss:isActionSheetDidDismiss];
                                   }
                                   
                               }
                            didDismissCompletion:^(NSInteger buttonIndex, NSString *text){
                                
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
            [alertWrapper showInputTextAlertViewWithTitle:alertTitle
                                                  message:alertText
                                        cancelButtonTitle:[self cancelButtonTitle]
                                   otherButtonTitlesArray:@[@"Enter"]
                                        clickedCompletion:^(NSInteger buttonIndex, NSString *text){
                
                                            if (!isActionSheetDidDismiss) {
                                                
                                                if (buttonIndex == 0) {
                                                    [self showAlertWithButtonIndex:0
                                                                    additionalText:additionalText
                                                             actionSheetDidDismiss:isActionSheetDidDismiss];
                                                } else if (buttonIndex == 1) {
                                                    alertWrapper = [[MTAlertWrapper alloc] init];
                                                    [alertWrapper showAlertWithTitle:@"Input Text"
                                                                             message:text];
                                                }
                                                
                                            }
                
                                         }
                                      didDismissCompletion:^(NSInteger buttonIndex, NSString *text){
            
                                            if (isActionSheetDidDismiss) {
                                                
                                                if (buttonIndex == 0) {
                                                    [self showAlertWithButtonIndex:0
                                                                    additionalText:additionalText
                                                             actionSheetDidDismiss:isActionSheetDidDismiss];
                                                } else if (buttonIndex == 1) {
                                                    alertWrapper = [[MTAlertWrapper alloc] init];
                                                    [alertWrapper showAlertWithTitle:@"Input Text"
                                                                             message:text];
                                                }
                                            }
            
                                      }];
        }
            break;
        case 4:
        {
            [alertWrapper showErrorAlertWithMessage:alertText];
        }
            break;
        case 5:
        {
            [alertWrapper showRepeatRequestAlertWithTitle:alertTitle
                                                  message:alertText
                                        clickedCompletion:^(NSInteger buttonIndex, NSString *text){
                                           
                                           if (!isActionSheetDidDismiss) {
                                               
                                               switch (buttonIndex) {
                                                   case 0:
                                                       break;
                                                   case 1:
                                                   {
                                                       [self showAlertWithButtonIndex:5
                                                                       additionalText:additionalText
                                                                actionSheetDidDismiss:isActionSheetDidDismiss];
                                                   }
                                                       break;
                                                   default:
                                                       break;
                                               }
                                           }
                                           
                                       }
                                     didDismissCompletion:^(NSInteger buttonIndex, NSString *text){
                                        
                                        if (isActionSheetDidDismiss) {
                                            switch (buttonIndex) {
                                                case 0:
                                                    break;
                                                case 1:
                                                {
                                                    [self showAlertWithButtonIndex:5
                                                                    additionalText:additionalText
                                                             actionSheetDidDismiss:isActionSheetDidDismiss];
                                                }
                                                    break;
                                                default:
                                                    break;
                                            }
                                        }
                                        
                                    }];
        }
            break;
        default:
        {
            [alertWrapper showAlertWithTitle:alertTitle
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

- (NSString *)cancelButtonTitle
{
    return @"Cancel";
}

@end
