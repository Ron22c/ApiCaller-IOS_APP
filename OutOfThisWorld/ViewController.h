//
//  ViewController.h
//  OutOfThisWorld
//
//  Created by Ranajit Chandra on 30/01/20.
//  Copyright © 2020 Ranajit Chandra. All rights reserved.
//

#import <UIKit/UIKit.h>
@import BrightcovePlayerSDK;

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UILabel *postId;
@property (strong, nonatomic) IBOutlet UILabel *userId;
@property (strong, nonatomic) IBOutlet UILabel *titleOfPost;
@property (strong, nonatomic) IBOutlet UILabel *body;
- (IBAction)fetchValue:(UIButton *)sender;
- (NSDictionary *)parseJsonResponse:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
