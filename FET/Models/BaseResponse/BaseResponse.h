//
//  BaseResponse.h
//  FET
//
//  Created by Fahad Attique on 14/02/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseResponse : NSObject

@property (strong, nonatomic) NSString * type;
@property (strong, nonatomic) NSMutableArray * jokes;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
