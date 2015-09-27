//
//  MTAlertWrapperInterface.h
//
//  Created by MAXIM TSVETKOV on 16.06.15.
//

#import "MTAlertWrapperConstants.h"

@protocol MTAlertWrapperInterface <NSObject>

- (void)showAlertInViewController:(UIViewController *)viewController
                        withTitle:(NSString *)title
                          message:(NSString *)message
                cancelButtonTitle:(NSString *)cancelButtonTitle
           otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
                clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
             didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock;
- (void)showInputTextAlertInViewController:(UIViewController *)viewController
                                 withTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                    otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
                         clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                      didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock;
- (void)showErrorAlertInViewController:(UIViewController *)viewController
                           withMessage:(NSString *)message;
- (void)showAlertInViewController:(UIViewController *)viewController
                        withTitle:(NSString *)title
                          message:(NSString *)message;
- (void)showRepeatRequestAlertInViewController:(UIViewController *)viewController
                                     withTitle:(NSString *)title
                                       message:(NSString *)message
                             clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                          didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock;
- (void)showActionSheetInViewController:(UIViewController *)viewController
                              withTitle:(NSString *)title
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                 otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
                      clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                   didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock;

@end
