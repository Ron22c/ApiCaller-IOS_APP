//
//  Model.h
//  OutOfThisWorld
//
//  Created by Ranajit Chandra on 30/01/20.
//  Copyright © 2020 Ranajit Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *body;
@property(nonatomic) id _Nullable userId;
@property(nonatomic) id _Nullable postId;
@end

NS_ASSUME_NONNULL_END
