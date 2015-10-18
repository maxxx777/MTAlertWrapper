//
//  MTAlertWrapperInterface.h
//
//  Created by MAXIM TSVETKOV on 16.06.15.
//

#import "MTAlertWrapperConstants.h"

@protocol MTAlertWrapperInterface <NSObject>

- (void)showAlertInViewController:(UIViewController * _Nonnull)viewController
                        withTitle:(NSString * _Nonnull)title
                          message:(NSString * _Nonnull)message
                cancelButtonTitle:(NSString * _Nonnull)cancelButtonTitle
           otherButtonTitlesArray:(NSArray * _Nonnull)otherButtonTitlesArray
                clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
             didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock;
- (void)showInputTextAlertInViewController:(UIViewController * _Nonnull)viewController
                                 withTitle:(NSString * _Nonnull)title
                                   message:(NSString * _Nonnull)message
                         cancelButtonTitle:(NSString * _Nonnull)cancelButtonTitle
                    otherButtonTitlesArray:(NSArray * _Nonnull)otherButtonTitlesArray
                         clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                      didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock;
- (void)showErrorAlertInViewController:(UIViewController * _Nonnull)viewController
                           withMessage:(NSString * _Nonnull)message;
- (void)showAlertInViewController:(UIViewController * _Nonnull)viewController
                        withTitle:(NSString * _Nonnull)title
                          message:(NSString * _Nonnull)message;
- (void)showRepeatRequestAlertInViewController:(UIViewController * _Nonnull)viewController
                                     withTitle:(NSString * _Nonnull)title
                                       message:(NSString * _Nonnull)message
                             clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                          didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock;
- (void)showActionSheetInViewController:(UIViewController * _Nonnull)viewController
                              withTitle:(NSString * _Nonnull)title
                      cancelButtonTitle:(NSString * _Nonnull)cancelButtonTitle
                 otherButtonTitlesArray:(NSArray * _Nonnull)otherButtonTitlesArray
                      clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                   didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock;
- (void)showActionSheetInViewController:(UIViewController * _Nonnull)viewController
                          fromBarButton:(UIBarButtonItem * _Nullable)barButton
                               fromRect:(CGRect)rect
                              withTitle:(NSString * _Nonnull)title
                      cancelButtonTitle:(NSString * _Nonnull)cancelButtonTitle
                 otherButtonTitlesArray:(NSArray * _Nonnull)otherButtonTitlesArray
                      clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                   didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock;

@end
