//
//  BaseResponse.m
//  FET
//
//  Created by Fahad Attique on 14/02/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

#import "BaseResponse.h"
#import "Joke.h"

@implementation BaseResponse

#pragma mark Mapping

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _jokes = [[NSMutableArray alloc] init];
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([value isKindOfClass:[NSNull class]]) {
        [super setValue:nil forKey:key];
    }
    else if ([key isEqualToString:@"value"]) {
        if ([value isKindOfClass:[NSArray class]]) {
            NSArray *jokes = value;
            for (id jokeDictionary in jokes) {
                Joke * joke = [[Joke alloc] initWithDictionary:(NSDictionary*)jokeDictionary];
                [[self jokes] addObject:joke];
            }
        }
        else {
            [super setValue:nil forKey:key];
        }
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
