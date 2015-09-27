//
//  MTAlertWrapperConstants.h
//
//  Created by MAXIM TSVETKOV on 16.06.15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MTAlertWrapperTextType) {
    MTAlertWrapperTextTypePlain = 1,
    MTAlertWrapperTextTypeInput
};

typedef void (^MTAlertWrapperDidDismissCompletionBlock)(NSInteger buttonIndex, NSString *actionTitle, NSString *inputText);
typedef void (^MTAlertWrapperClickedCompletionBlock)(NSInteger buttonIndex, NSString *actionTitle, NSString *inputText);
