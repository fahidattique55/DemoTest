//
//  JokeTableViewCell.m
//  FET
//
//  Created by Fahad Attique on 14/02/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

#import "JokeTableViewCell.h"

@implementation JokeTableViewCell

@synthesize jokeDetails;

#pragma mark Life Cycle

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark Functions

+(NSString *)identifier {
    
    return NSStringFromClass(JokeTableViewCell.self);
}

-(void) configureWith:(Joke *) joke {

    jokeDetails.text = [joke joke];
}

@end
