//
//  MTAlertWrapperConstants.h
//
//  Created by MAXIM TSVETKOV on 16.06.15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^MTAlertWrapperDidDismissCompletionBlock)(NSInteger buttonIndex, NSString *text);
typedef void (^MTAlertWrapperClickedCompletionBlock)(NSInteger buttonIndex, NSString *text);

static const NSUInteger MTAlertWrapperPlainTextType          = 1;
static const NSUInteger MTAlertWrapperInputTextType          = 2;
