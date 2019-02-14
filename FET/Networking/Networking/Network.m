//
//  Network.m
//  FET
//
//  Created by Fahad Attique on 14/02/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

#import "Network.h"
#import "ResponseSerializer.h"

@implementation Network

#pragma mark Singleton

+(instancetype)manager {
    
    Network * manager = [[self alloc] initWithBaseURL:kBaseUrl];
    [manager setResponseSerializer:[ResponseSerializer serializer]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    return manager;
}

#pragma mark Life Cycle

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

@end
