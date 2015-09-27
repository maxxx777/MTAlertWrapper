//
//  MTAlertWrapper.m
//
//  Created by MAXIM TSVETKOV on 16.06.15.
//

#import "MTAlertWrapper.h"
#import "UIDevice+SystemVersion.h"

@interface MTAlertWrapper ()

@property (nonatomic, strong) MTAlertWrapperClickedCompletionBlock clickedCompletionBlock;
@property (nonatomic, strong) MTAlertWrapperDidDismissCompletionBlock didDismissCompletionBlock;

@end

@implementation MTAlertWrapper

- (void)dealloc
{
//    DLog(@"%@ deallocated: %p", NSStringFromClass([self class]), self);
}

#pragma mark - ETAlertViewWrapperInterface

- (void)showAlertInViewController:(UIViewController *)viewController
                        withTitle:(NSString *)title
                          message:(NSString *)message
                cancelButtonTitle:(NSString *)cancelButtonTitle
           otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
                clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
             didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock
{
    [self showAlertInViewController:viewController
                          withTitle:title
                            message:message
                  cancelButtonTitle:cancelButtonTitle
             otherButtonTitlesArray:otherButtonTitlesArray
                           textType:MTAlertWrapperTextTypePlain
                  clickedCompletion:clickedCompletionBlock
               didDismissCompletion:didDismissCompletionBlock];
}

- (void)showInputTextAlertInViewController:(UIViewController *)viewController
                                 withTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                    otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
                         clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                      didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock
{
    [self showAlertInViewController:viewController
                          withTitle:title
                            message:message
                  cancelButtonTitle:cancelButtonTitle
             otherButtonTitlesArray:otherButtonTitlesArray
                           textType:MTAlertWrapperTextTypeInput
                  clickedCompletion:clickedCompletionBlock
               didDismissCompletion:didDismissCompletionBlock];
}

- (void)showRepeatRequestAlertInViewController:(UIViewController *)viewController
                                     withTitle:(NSString *)title
                                       message:(NSString *)message
                             clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                          didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock
{
    [self showAlertInViewController:viewController
                          withTitle:title
                            message:message
                  cancelButtonTitle:NSLocalizedString(@"Continue", nil)
             otherButtonTitlesArray:@[NSLocalizedString(@"Repeat", nil)]
                           textType:MTAlertWrapperTextTypePlain
                  clickedCompletion:clickedCompletionBlock
               didDismissCompletion:didDismissCompletionBlock];
}

- (void)showErrorAlertInViewController:(UIViewController *)viewController
                           withMessage:(NSString *)message
{
    [self showAlertInViewController:viewController
                          withTitle:NSLocalizedString(@"Error", nil)
                            message:message
                  cancelButtonTitle:NSLocalizedString(@"Continue", nil)
             otherButtonTitlesArray:nil
                           textType:MTAlertWrapperTextTypePlain
                  clickedCompletion:nil
               didDismissCompletion:nil];
}

- (void)showAlertInViewController:(UIViewController *)viewController
                        withTitle:(NSString *)title
                          message:(NSString *)message
{
    [self showAlertInViewController:viewController
                          withTitle:title
                            message:message
                  cancelButtonTitle:NSLocalizedString(@"Continue", nil)
             otherButtonTitlesArray:nil
                           textType:MTAlertWrapperTextTypePlain
                  clickedCompletion:nil
               didDismissCompletion:nil];
}

- (void)showActionSheetInViewController:(UIViewController *)viewController
                              withTitle:(NSString *)title
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                 otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
                      clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                   didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock
{
    [self setClickedCompletionBlock:clickedCompletionBlock];
    [self setDidDismissCompletionBlock:didDismissCompletionBlock];
    
    if ([[UIDevice currentDevice] systemVersionIsGreaterThanOrEqualTo:@"9.0"]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                       message:nil
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * action) {
                                                                 
                                                                 if (self.clickedCompletionBlock) {
                                                                     self.clickedCompletionBlock(0, action.title, nil);
                                                                 }
                                                                 if (self.didDismissCompletionBlock) {
                                                                     self.didDismissCompletionBlock(0, action.title, nil);
                                                                 }
                                                                 
                                                             }];
        [alert addAction:cancelAction];
        
        for (NSString *otherButtonTitle in otherButtonTitlesArray) {
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:otherButtonTitle
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {
                                                                      
                                                                      if (self.clickedCompletionBlock) {
                                                                          self.clickedCompletionBlock(0, action.title, nil);
                                                                      }
                                                                      if (self.didDismissCompletionBlock) {
                                                                          self.didDismissCompletionBlock(0, action.title, nil);
                                                                      }
                                                                      
                                                                  }];
            
            [alert addAction:defaultAction];
            
        }
        
        [viewController presentViewController:alert
                                     animated:YES
                                   completion:nil];
        
    } else {
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                                 delegate:self
                                                        cancelButtonTitle:cancelButtonTitle
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles: nil];
        
        for (NSString *title in otherButtonTitlesArray) {
            [actionSheet addButtonWithTitle:title];
        }
        
        actionSheet.destructiveButtonIndex = -1;
        actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
        [actionSheet showInView:viewController.view];
        
    }
    
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == MTAlertWrapperTextTypePlain) {
        if (self.didDismissCompletionBlock) {
            self.didDismissCompletionBlock(buttonIndex, nil, nil);
            [self setDidDismissCompletionBlock:nil];
        }
    } else if (alertView.tag == MTAlertWrapperTextTypeInput) {
        if (self.didDismissCompletionBlock) {
            UITextField *textInput = [alertView textFieldAtIndex:0];
            self.didDismissCompletionBlock(buttonIndex, nil, textInput.text);
            [self setDidDismissCompletionBlock:nil];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == MTAlertWrapperTextTypePlain) {
        if (self.clickedCompletionBlock) {
            self.clickedCompletionBlock(buttonIndex, nil, nil);
            [self setClickedCompletionBlock:nil];
        }
    } else if (alertView.tag == MTAlertWrapperTextTypeInput) {
        if (self.clickedCompletionBlock) {
            UITextField *textInput = [alertView textFieldAtIndex:0];
            self.clickedCompletionBlock(buttonIndex, nil, textInput.text);
            [self setClickedCompletionBlock:nil];
        }
    }
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (self.didDismissCompletionBlock) {
        self.didDismissCompletionBlock(buttonIndex, nil, nil);
        [self setDidDismissCompletionBlock:nil];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.clickedCompletionBlock) {
        self.clickedCompletionBlock(buttonIndex, nil, nil);
        [self setClickedCompletionBlock:nil];
    }
}

#pragma mark - Helper

- (void)showAlertInViewController:(UIViewController *)viewController
                        withTitle:(NSString *)title
                          message:(NSString *)message
                cancelButtonTitle:(NSString *)cancelButtonTitle
           otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
                         textType:(NSUInteger)textType
                clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
             didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock
{
    [self setClickedCompletionBlock:clickedCompletionBlock];
    [self setDidDismissCompletionBlock:didDismissCompletionBlock];
    
    if ([[UIDevice currentDevice] systemVersionIsGreaterThanOrEqualTo:@"9.0"]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                       message:message
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * action) {

                                                                 if (self.clickedCompletionBlock) {
                                                                     self.clickedCompletionBlock(0, action.title, nil);
                                                                 }
                                                                 if (self.didDismissCompletionBlock) {
                                                                     self.didDismissCompletionBlock(0, action.title, nil);
                                                                 }
                                                             
                                                             }];
        [alert addAction:cancelAction];
        
        __weak UIAlertController *weakAlert = alert;
        NSNumber *hasInputText = @(textType == MTAlertWrapperTextTypeInput);
        __weak NSNumber *weakHasInputText = hasInputText;
        
        for (NSString *otherButtonTitle in otherButtonTitlesArray) {
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:otherButtonTitle
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {
                                                                  
                                                                      NSString *inputText;
                                                                      if ([weakHasInputText boolValue]) {
                                                                          UITextField *textField = [[weakAlert textFields] objectAtIndex:0];
                                                                          inputText = textField.text;
                                                                      }
                                                                      
                                                                      if (self.clickedCompletionBlock) {
                                                                          self.clickedCompletionBlock(0, action.title, inputText);
                                                                      }
                                                                      if (self.didDismissCompletionBlock) {
                                                                          self.didDismissCompletionBlock(0, action.title, inputText);
                                                                      }
                                                                      
                                                                  }];
            
            [alert addAction:defaultAction];
            
        }
        
        if (textType == MTAlertWrapperTextTypeInput) {
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                [textField setAccessibilityLabel:@"Input Text Field"];
            }];
        }
        
        [viewController presentViewController:alert
                                     animated:YES
                                   completion:nil];
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:cancelButtonTitle
                                              otherButtonTitles:nil];
        for (NSString *title in otherButtonTitlesArray) {
            [alert addButtonWithTitle:title];
        }
        
        if (textType == MTAlertWrapperTextTypeInput) {
            UITextField *textField = [alert textFieldAtIndex:0];
            [textField setAccessibilityLabel:@"Input Text Field"];
        }
        
        alert.tag = textType;
        [alert show];
        
    }
}

@end
