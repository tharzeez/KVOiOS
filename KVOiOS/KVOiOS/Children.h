//
//  Children.h
//  KVOiOS
//
//  Created by Tharzeez on 7/25/17.
//  Copyright © 2017 tharzeez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Children : NSObject

@property (strong,nonatomic ) Children *child;
@property (strong ,nonatomic)NSString * name;
@property (strong ,nonatomic)NSNumber *age;

-(void)changeName:(NSString *)name withAge:(NSNumber *)age;
@end
