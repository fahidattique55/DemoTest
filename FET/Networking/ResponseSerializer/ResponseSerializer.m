//
//  ResponseSerializer.m
//  FET
//
//  Created by Fahad Attique on 14/02/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

#import "ResponseSerializer.h"
#import "BaseResponse.h"


@implementation ResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    
    id responseObject =[super responseObjectForResponse:response data:data error:error];
    BaseResponse *respObj = [[BaseResponse alloc] initWithDictionary:responseObject];

    NSLog(@"%@", responseObject);
    
    return respObj;
}

@end
