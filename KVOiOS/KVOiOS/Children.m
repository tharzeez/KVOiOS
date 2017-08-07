//
//  Children.m
//  KVOiOS
//
//  Created by Tharzeez on 7/25/17.
//  Copyright © 2017 tharzeez. All rights reserved.
//

#import "Children.h"

@implementation Children

-(instancetype)init{
    if([super init]){
        self.name=@"";
        self.age=@0;
        
    }
    
    return self;
}

-(void)changeName:(NSString *)name withAge:(NSNumber *)age{
    
   
    [self setValue:name forKey:@"name"];
    [self setValue:age forKey:@"age"];
    
    
    
}

@end

