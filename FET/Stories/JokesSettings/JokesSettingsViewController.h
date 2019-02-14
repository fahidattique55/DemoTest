//
//  JokesSettingsViewController.h
//  FET
//
//  Created by Fahad Attique on 15/02/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JokesSettingsDelegate;

@interface JokesSettingsViewController : UIViewController

@property(nonatomic, strong) NSString * numOfJokes;
@property (weak, nonatomic) id <JokesSettingsDelegate> delegate;

@end




@protocol JokesSettingsDelegate <NSObject>

- (void)jokesSettingsViewController:(JokesSettingsViewController *)settingsViewController didProvideNumberOfJokes:(NSString *) numberOfJokes;

@end

NS_ASSUME_NONNULL_END
