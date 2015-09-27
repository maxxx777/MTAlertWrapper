//
//  DemoAppUITests.m
//  DemoAppUITests
//
//  Created by MAXIM TSVETKOV on 23.09.15.
//  Copyright © 2015 MAXIM TSVETKOV. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface DemoAppUITests : XCTestCase
{
    XCUIElement *actionSheetTitleSheet;
}
@property (nonatomic, strong) XCUIApplication *app;

@end

@implementation DemoAppUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    
    _app = [[XCUIApplication alloc] init];
    [self.app launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    actionSheetTitleSheet = self.app.sheets[@"Action Sheet Title"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    _app = nil;
    actionSheetTitleSheet = nil;
    
    [super tearDown];
}

- (void)testThatActionSheetWasShownAndDismissedAfterButtonDidClick
{
    [self buttonDidClickTap];
    
    [self doTestThatActionSheetWasShownAndDismissed];
}

- (void)testThatActionSheetWasShownAndDismissedAfterActionSheetDidDismiss
{
    [self actionSheetDidDismissTap];
    
    [self doTestThatActionSheetWasShownAndDismissed];
}

- (void)testThatAlertWithTextWasShownAndDismissedAfterButtonDidClick
{
    [self buttonDidClickTap];
    
    [self doTestThatAlertWithTextWasShownAndDismissed];
}

- (void)testThatAlertWithTextWasShownAndDismissedAfterActionSheetDidDismiss
{
    [self actionSheetDidDismissTap];
    
    [self doTestThatAlertWithTextWasShownAndDismissed];
}

- (void)testThatAlertWithButtonsWasShownAndDismissedAfterButtonDidClick
{
    [self buttonDidClickTap];
    
    [self doTestThatAlertWithButtonsWasShownAndDismissed];
}

- (void)testThatAlertWithButtonsWasShownAndDismissedAfterActionSheetDidDismiss
{
    [self actionSheetDidDismissTap];
    
    [self doTestThatAlertWithButtonsWasShownAndDismissed];
}

- (void)testThatAlertWithInputTextWasShownAndDismissedAfterButtonDidClick
{
    [self buttonDidClickTap];
    
    [self doTestThatAlertWithInputTextWasShownAndDismissed];
}

- (void)testThatAlertWithInputTextWasShownAndDismissedAfterActionSheetDidDismiss
{
    [self actionSheetDidDismissTap];
    
    [self doTestThatAlertWithInputTextWasShownAndDismissed];
}

- (void)testThatAlertWithErrorMessageWasShownAndDismissedAfterButtonDidClick
{
    [self buttonDidClickTap];
    
    [self doTestThatAlertWithErrorMessageWasShownAndDismissed];
}

- (void)testThatAlertWithErrorMessageWasShownAndDismissedAfterActionSheetDidDismiss
{
    [self actionSheetDidDismissTap];
    
    [self doTestThatAlertWithErrorMessageWasShownAndDismissed];
}

- (void)testThatAlertWithRepeatRequestWasShownAndDismissedAfterButtonDidClick
{
    [self buttonDidClickTap];
    
    [self doTestThatAlertWithRepeatRequestWasShownAndDismissed];
}

- (void)testThatAlertWithRepeatRequestWasShownAndDismissedAfterActionSheetDidDismiss
{
    [self actionSheetDidDismissTap];
    
    [self doTestThatAlertWithRepeatRequestWasShownAndDismissed];
}

#pragma mark - Helper

- (void)buttonDidClickTap
{
    [self.app.toolbars.buttons[@"ButtonDidClick"] tap];
}

- (void)actionSheetDidDismissTap
{
    [self.app.toolbars.buttons[@"ActionSheetDidDismiss"] tap];
}

- (void)continueButtonTapOnAlert:(XCUIElement *)alert
{
    [alert.buttons[@"Continue"] tap];
    XCTAssertEqual([self.app.alerts count], 0);
}

- (void)doTestThatActionSheetWasShownAndDismissed
{
    XCTAssert(actionSheetTitleSheet.exists);
    
    [actionSheetTitleSheet.buttons[@"Cancel"] tap];
    
    XCUIElement *alertCancel = self.app.alerts[@"Cancel"];
    XCTAssert(alertCancel.exists);
    
    [self continueButtonTapOnAlert:alertCancel];
}

- (void)doTestThatAlertWithTextWasShownAndDismissed
{
    [actionSheetTitleSheet.collectionViews.buttons[@"Alert with Text"] tap];
    
    XCUIElement *alertWithText = self.app.alerts[@"Alert with Text"];
    XCTAssert(alertWithText.exists);
    
    [self continueButtonTapOnAlert:alertWithText];
}

- (void)doTestThatAlertWithButtonsWasShownAndDismissed
{
    [actionSheetTitleSheet.collectionViews.buttons[@"Alert with Buttons"] tap];
    
    XCUIElement *alertWithButtons = self.app.alerts[@"Alert with Buttons"];
    XCTAssert(alertWithButtons.exists);
    
    [alertWithButtons.buttons[@"Cancel"] tap];
    
    XCUIElement *alertCancel = self.app.alerts[@"Cancel"];
    XCTAssert(alertCancel.exists);
    
    [self continueButtonTapOnAlert:alertCancel];
}

- (void)doTestThatAlertWithInputTextWasShownAndDismissed
{
    //input text
    
    [actionSheetTitleSheet.collectionViews.buttons[@"Alert with Input Text"] tap];
    
    XCUIElement *alertWithInputText = self.app.alerts[@"Alert with Input Text"];
    XCTAssert(alertWithInputText.exists);
    
    [alertWithInputText.textFields[@"Input Text Field"] typeText:@"input text"];
    
    [alertWithInputText.buttons[@"Enter"] tap];
    
    XCUIElement *alertDisplayedInputText = self.app.alerts[@"Input Text"];
    XCTAssert(alertDisplayedInputText.exists);
    
    [self continueButtonTapOnAlert:alertDisplayedInputText];
    
    //cancel alert
    
    [self buttonDidClickTap];
    
    [actionSheetTitleSheet.collectionViews.buttons[@"Alert with Input Text"] tap];
    
    alertWithInputText = self.app.alerts[@"Alert with Input Text"];
    XCTAssert(alertWithInputText.exists);
    
    [alertWithInputText.buttons[@"Cancel"] tap];
    
    XCUIElement *alertCancel = self.app.alerts[@"Cancel"];
    XCTAssert(alertCancel.exists);
    
    [self continueButtonTapOnAlert:alertCancel];
}

- (void)doTestThatAlertWithErrorMessageWasShownAndDismissed
{
    [actionSheetTitleSheet.collectionViews.buttons[@"Alert with Error Message"] tap];
    
    XCUIElement *alertWithErrorMessage = self.app.alerts[@"Error"];
    XCTAssert(alertWithErrorMessage.exists);
    
    [self continueButtonTapOnAlert:alertWithErrorMessage];
}

- (void)doTestThatAlertWithRepeatRequestWasShownAndDismissed
{
    [actionSheetTitleSheet.collectionViews.buttons[@"Alert with Repeat Request"] tap];
    
    XCUIElement *alertWithRepeatRequest = self.app.alerts[@"Alert with Repeat Request"];
    XCTAssert(alertWithRepeatRequest.exists);
    
    [alertWithRepeatRequest.buttons[@"Repeat"] tap];
    XCTAssert(alertWithRepeatRequest.exists);
    
    [self continueButtonTapOnAlert:alertWithRepeatRequest];
}

@end
