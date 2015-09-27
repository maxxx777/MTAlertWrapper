//
//  MTAlertWrapper.m
//
//  Created by MAXIM TSVETKOV on 16.06.15.
//

#import "MTAlertWrapper.h"

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

- (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelButtonTitle
        otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
             clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
          didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock
{
    [self setClickedCompletionBlock:clickedCompletionBlock];
    [self setDidDismissCompletionBlock:didDismissCompletionBlock];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:cancelButtonTitle
                                              otherButtonTitles:nil];
    for (NSString* title in otherButtonTitlesArray) {
        [alertView addButtonWithTitle:title];
    }

    alertView.tag = MTAlertWrapperPlainTextType;
    [alertView show];
}

- (void)showInputTextAlertViewWithTitle:(NSString *)title
                                message:(NSString *)message
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                 otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
                      clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                   didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock
{
    [self setClickedCompletionBlock:clickedCompletionBlock];
    [self setDidDismissCompletionBlock:didDismissCompletionBlock];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:cancelButtonTitle
                                              otherButtonTitles:nil];
    for (NSString* title in otherButtonTitlesArray) {
        [alertView addButtonWithTitle:title];
    }
    alertView.tag = MTAlertWrapperInputTextType;
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    UITextField *textField = [alertView textFieldAtIndex:0];
    [textField setAccessibilityLabel:@"Input Text Field"];
    textField.keyboardType = UIKeyboardTypeEmailAddress;
    
    [alertView show];
}

- (void)showRepeatRequestAlertWithTitle:(NSString *)title
                                message:(NSString *)message
                      clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                   didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock
{
    [self setClickedCompletionBlock:clickedCompletionBlock];
    [self setDidDismissCompletionBlock:didDismissCompletionBlock];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"Continue", nil)
                                              otherButtonTitles:NSLocalizedString(@"Repeat", nil), nil];
    alertView.tag = MTAlertWrapperPlainTextType;
    [alertView show];
}

- (void)showErrorAlertWithMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil)
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"Continue", nil)
                                              otherButtonTitles:nil];
    [alertView show];
}

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"Continue", nil)
                                              otherButtonTitles:nil];
    [alertView show];
}

- (void)showActionSheetInView:(UIView *)view
                    withTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
            clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
         didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock
{
    [self setClickedCompletionBlock:clickedCompletionBlock];
    [self setDidDismissCompletionBlock:didDismissCompletionBlock];
    
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
    [actionSheet showInView:view];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == MTAlertWrapperPlainTextType) {
        if (self.didDismissCompletionBlock) {
            self.didDismissCompletionBlock(buttonIndex, nil);
            [self setDidDismissCompletionBlock:nil];
        }
    } else if (alertView.tag == MTAlertWrapperInputTextType) {
        if (self.didDismissCompletionBlock) {
            UITextField *textInput = [alertView textFieldAtIndex:0];
            self.didDismissCompletionBlock(buttonIndex, textInput.text);
            [self setDidDismissCompletionBlock:nil];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == MTAlertWrapperPlainTextType) {
        if (self.clickedCompletionBlock) {
            self.clickedCompletionBlock(buttonIndex, nil);
            [self setClickedCompletionBlock:nil];
        }
    } else if (alertView.tag == MTAlertWrapperInputTextType) {
        if (self.clickedCompletionBlock) {
            UITextField *textInput = [alertView textFieldAtIndex:0];
            self.clickedCompletionBlock(buttonIndex, textInput.text);
            [self setClickedCompletionBlock:nil];
        }
    }
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (self.didDismissCompletionBlock) {
        self.didDismissCompletionBlock(buttonIndex, nil);
        [self setDidDismissCompletionBlock:nil];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.clickedCompletionBlock) {
        self.clickedCompletionBlock(buttonIndex, nil);
        [self setClickedCompletionBlock:nil];
    }
}

@end
