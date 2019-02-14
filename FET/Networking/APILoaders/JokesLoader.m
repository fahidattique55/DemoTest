//
//  JokesLoader.m
//  FET
//
//  Created by Fahad Attique on 14/02/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

#import "JokesLoader.h"

@implementation JokesLoader

#pragma mark Singleton

+ (id)shared {
    static JokesLoader * shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

#pragma mark APIs

- (void)getRandomJokes:(NSString *)amount success:(nullable void (^)( BaseResponse * _Nullable  responseObject))success failure:(nullable void (^)( NSError * _Nullable error))failure {
    
    NSString * url = [[NSString stringWithFormat:@"jokes/random/"] stringByAppendingString:amount];
    
    [Network.manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        BaseResponse * response = (BaseResponse *) responseObject;
        success(response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}


@end
