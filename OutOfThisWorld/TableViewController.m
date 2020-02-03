//
//  TableViewController.m
//  OutOfThisWorld
//
//  Created by Ranajit Chandra on 29/01/20.
//  Copyright © 2020 Ranajit Chandra. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#define KEY @"key1"

@interface TableViewController ()

@end

@implementation TableViewController
ViewController *view;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.planets = [[NSMutableArray alloc] init];
    [self.planets addObject:@"satun"];
    [self.planets addObject:@"Earth"];
    [self.planets addObject:@"Mars"];
    [self.planets addObject:@"Jupiter"];
    [self.planets addObject:@"Uranus"];
    [self.planets addObject:@"Neptune"];
    [self.planets addObject:@"Venus"];
    [self.planets addObject:@"Mercury"];
    view = [[ViewController alloc] init];
    
    self.clearsSelectionOnViewWillAppear = YES;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
// SOME MUTABLE ARRAY PRACTICE EXAMPLE CODE
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
//    [dict setValue:@"this is the value 1" forKey:KEY];
//    [dict setValue:@"this is the value 2" forKey:@"key2"];
//    [dict setValue:@"this is the value 3" forKey:@"key3"];
//
//    NSDictionary *secondDict = @{@"key1":@1,
//                                 @"key2":@"valueTwo"};
//    NSLog(@"%@", [dict valueForKey:KEY]);
//    NSNumber *intNum = [NSNumber numberWithInt:23];
//    NSNumber *floatNum = [NSNumber numberWithFloat:23.456];
//    NSNumber *boolNum = [NSNumber numberWithBool:NO];
//    NSNumber *charNum = [NSNumber numberWithChar:(char)"a"];
//    NSArray *arr = @[@"12", @"1234"];
//    NSMutableArray *mutearr = [@[] mutableCopy];
//    [mutearr addObject:@22];
//    NSDictionary *dictTwo = @{
//        @"key":@"value",
//        @"KEY2":@"VALUE2"};
//    NSLog(@"%@", [@"hello" capitalizedString]);
//
//    NSLog(@"%@,%@,%@,%@,%@,%@,%@", intNum, floatNum, boolNum, charNum, arr, dictTwo, mutearr);

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[view parseJsonResponse:@"https://jsonplaceholder.typicode.com/posts"] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *allkey = [[(NSArray *)[view parseJsonResponse:@"https://jsonplaceholder.typicode.com/posts"]
    objectAtIndex:1]allKeys];

    return [allkey count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NSArray *allkey = [[(NSArray *)[view parseJsonResponse:@"https://jsonplaceholder.typicode.com/posts"]
    objectAtIndex:1]allKeys];
    NSLog(@"%@ SECTION",[NSString stringWithFormat:@"%ld",(long)indexPath.section]);
    NSLog(@"%@ ROW",[NSString stringWithFormat:@"%ld",indexPath.row]);
    
    NSLog(@"%@",[NSString stringWithFormat:@"%@",[[(NSArray *)[view parseJsonResponse:@"https://jsonplaceholder.typicode.com/posts"]
    objectAtIndex:indexPath.section]
                 valueForKey:[allkey objectAtIndex:indexPath.row]]]);
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[(NSArray *)[view parseJsonResponse:@"https://jsonplaceholder.typicode.com/posts"]
        objectAtIndex:indexPath.section]
        valueForKey:[allkey objectAtIndex:indexPath.row]]];
    return cell;
}

@end
