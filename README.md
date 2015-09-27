MTAlertWrapper
====================

This class wraps calls of Alert/ActionSheet show. 

Overview
====================

This class hides imlementation of `UIAlertView`, `UIActionSheet` and `UIAlertController`. Also it gives custom use cases of alerts such as repeat request and error alert. You can use two types of handlers: **MTAlertWrapperClickedCompletionBlock** and **MTAlertWrapperDidDismissCompletionBlock**. The first is used after button did click and the second is after alert did dismiss.

Usage
====================

Copy files from repository into your project and include `MTAlertWrapper.h`.

Description
====================

```objective-c
- (void)showAlertInViewController:(UIViewController *)viewController
                        withTitle:(NSString *)title
                          message:(NSString *)message
                cancelButtonTitle:(NSString *)cancelButtonTitle
           otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
                clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
             didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock
```

show alert in given view controller with title, message, cancel button title, other button titles, handlers after button did click and after alert did dismiss.

```objective-c
- (void)showInputTextAlertInViewController:(UIViewController *)viewController
                                 withTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                    otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
                         clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                      didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock
```

show input text alert in given view controller with title, message, cancel button title, other button titles, handlers after button did click and after alert did dismiss.

```objective-c
- (void)showErrorAlertInViewController:(UIViewController *)viewController
                           withMessage:(NSString *)message
```

show error alert in given view controller with message.

```objective-c
- (void)showAlertInViewController:(UIViewController *)viewController
                        withTitle:(NSString *)title
                          message:(NSString *)message
```

show alert in given view controller with title and message.

```objective-c
- (void)showRepeatRequestAlertInViewController:(UIViewController *)viewController
                                     withTitle:(NSString *)title
                                       message:(NSString *)message
                             clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                          didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock
```

show repeat request alert in given view controller with title, message, handlers after button did click and after alert did dismiss.

```objective-c
- (void)showActionSheetInViewController:(UIViewController *)viewController
                              withTitle:(NSString *)title
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                 otherButtonTitlesArray:(NSArray *)otherButtonTitlesArray
                      clickedCompletion:(MTAlertWrapperClickedCompletionBlock)clickedCompletionBlock
                   didDismissCompletion:(MTAlertWrapperDidDismissCompletionBlock)didDismissCompletionBlock
```

show action sheet in given view controller with title, cancel button title, other button titles, handlers after button did click and after alert did dismiss.

Demo
====================

See DemoApp.
