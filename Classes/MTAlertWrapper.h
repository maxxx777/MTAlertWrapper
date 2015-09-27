//
//  MTAlertWrapper.h
//
//  Created by MAXIM TSVETKOV on 16.06.15.
//

#import "MTAlertWrapperInterface.h"

@interface MTAlertWrapper : NSObject
<
    UIAlertViewDelegate,
    UIActionSheetDelegate,
    MTAlertWrapperInterface
>

@end
