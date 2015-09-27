//
//  MTAlertWrapperInterface.h
//
//  Created by MAXIM TSVETKOV on 16.06.15.
//

#import "MTAlertWrapperConstants.h"

@protocol MTAlertWrapperInterface <NSObject>

- (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelButtonTitle
        otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
             clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
          didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock;
- (void)showInputTextAlertViewWithTitle:(NSString *)title
                                message:(NSString *)message
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                 otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
                      clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                   didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock;
- (void)showErrorAlertWithMessage:(NSString *)message;
- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message;
- (void)showRepeatRequestAlertWithTitle:(NSString *)title
                                message:(NSString *)message
                      clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                   didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock;
- (void)showActionSheetInView:(UIView *)view
                    withTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
            clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
         didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock;

@end
