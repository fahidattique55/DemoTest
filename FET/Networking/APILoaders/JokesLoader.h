//
//  JokesLoader.h
//  FET
//
//  Created by Fahad Attique on 14/02/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Network.h"
#import "BaseResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface JokesLoader : NSObject

+ (id)shared;

- (void)getRandomJokes:(NSString *)amount success:(nullable void (^)( BaseResponse * _Nullable  responseObject))success failure:(nullable void (^)( NSError * _Nullable error))failure;

@end

NS_ASSUME_NONNULL_END
