//
//  ViewController.m
//  OutOfThisWorld
//
//  Created by Ranajit Chandra on 30/01/20.
//  Copyright © 2020 Ranajit Chandra. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSDictionary *)parseJsonResponse:(NSString *)urlString
{
    __block NSMutableDictionary *result = [[NSMutableDictionary alloc]init];
    dispatch_semaphore_t semaphoe = dispatch_semaphore_create(0);
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:urlString]
           completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error!= nil){
            result = nil;
            NSLog(@"%@", error);
        }
        if(data!=nil){
            result = [self getResponseDataDict:data withError:error];
        }
        dispatch_semaphore_signal(semaphoe);
    }]resume];
    dispatch_semaphore_wait(semaphoe, DISPATCH_TIME_FOREVER);
    return result;
    
}

- (NSMutableDictionary *) getResponseDataDict:(NSData*)data withError:(NSError *)error {
    NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData: data
                                               options: NSJSONReadingMutableContainers
                                                 error: nil];
    return result;
}

- (IBAction)fetchValue:(UIButton *)sender {
    NSString *idPostOne = [NSString stringWithFormat:@"%@", self.textField.text];
    NSLog(@"%@", idPostOne);
    
    if(idPostOne == NULL || [idPostOne  isEqual: @""] || idPostOne == nil){
        NSLog(@"INSIDE THE ALART METHOD");
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"ERROR"
                                       message:@"PLEASE PUT MESSAGE ID"
                                       preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
           handler:^(UIAlertAction * action) {}];

        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }

    NSDictionary *result = [self parseJsonResponse:[@"https://jsonplaceholder.typicode.com/posts/" stringByAppendingString:idPostOne]];
    
    NSDictionary *user = [self parseJsonResponse:[@"https://jsonplaceholder.typicode.com/users/" stringByAppendingString:[NSString stringWithFormat:@"%@", [result valueForKey:@"userId"]]]];
    
    Model *model = [[Model alloc] init];
    model.title= [result valueForKey:@"title"];
    model.body= [result valueForKey:@"body"];
    model.userId= [user valueForKey:@"name"];
    model.postId= [result valueForKey:@"id"];


    self.body.text = model.body;
    self.titleOfPost.text = model.title;
    self.userId.text = [NSString stringWithFormat:@"%@",model.userId];
    self.postId.text = [NSString stringWithFormat:@"%@",model.postId];
}
@end
