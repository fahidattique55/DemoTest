//
//  JokeTableViewCell.h
//  FET
//
//  Created by Fahad Attique on 14/02/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Joke.h"

NS_ASSUME_NONNULL_BEGIN

@interface JokeTableViewCell : UITableViewCell

+(NSString*)identifier;
-(void) configureWith:(Joke *) joke;

@property (weak, nonatomic) IBOutlet UILabel *jokeDetails;

@end

NS_ASSUME_NONNULL_END
