//
//  RandomJokesViewController.m
//  FET
//
//  Created by Fahad Attique on 14/02/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

#import "RandomJokesViewController.h"
#import "JokesLoader.h"
#import "BaseResponse.h"
#import "Joke.h"
#import "JokeTableViewCell.h"
#import "JokesSettingsViewController.h"

@interface RandomJokesViewController () <UITableViewDataSource, UITableViewDelegate, JokesSettingsDelegate>

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UITableView *jokesTableView;

#pragma mark - Properties

@property(nonatomic, strong) BaseResponse * jokesData;
@property(nonatomic, strong) NSString * numOfJokes;

@end


@implementation RandomJokesViewController

@synthesize jokesTableView;
@synthesize numOfJokes;

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self configureViews];
    [self showJokesEditingScreen:nil];
}

#pragma mark - Functions

-(void) configureViews {
    
    [jokesTableView registerNib:[UINib nibWithNibName:JokeTableViewCell.identifier bundle:nil] forCellReuseIdentifier:JokeTableViewCell.identifier];
    jokesTableView.rowHeight = UITableViewAutomaticDimension;
    jokesTableView.estimatedRowHeight = 44;
    numOfJokes = @"";
}

-(void) getRandomJokesList {
    
    __weak RandomJokesViewController *weakSelf = self;
    [JokesLoader.shared getRandomJokes:numOfJokes success:^(BaseResponse * _Nullable responseObject) {
        
        RandomJokesViewController *strongSelf = weakSelf;
        strongSelf.jokesData = responseObject;
        [[strongSelf jokesTableView] reloadData];
        
    } failure:^(NSError * _Nullable error) {
        
        //  Show error in alert controller
    }];
}

#pragma mark - IBActions

- (IBAction)showJokesEditingScreen:(id)sender {
 
    UINavigationController * jokesSettingsNavVC = [[UIStoryboard storyboardWithName:@"Jokes" bundle:nil] instantiateViewControllerWithIdentifier:@"JokesSettingsNav"];
    JokesSettingsViewController * settingsVC = [[jokesSettingsNavVC viewControllers] firstObject];
    settingsVC.numOfJokes = [self numOfJokes];
    settingsVC.delegate = self;
    [self presentViewController:jokesSettingsNavVC animated:true completion:nil];
}


#pragma mark - TableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JokeTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:JokeTableViewCell.identifier];
    Joke * joke = [[[self jokesData] jokes] objectAtIndex:indexPath.row];
    [cell configureWith:joke];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return [[[self jokesData] jokes] count];
}


#pragma mark - JokesSettingsDelegate

- (void)jokesSettingsViewController:(JokesSettingsViewController *)settingsViewController didProvideNumberOfJokes:(NSString *) numberOfJokes {
    
    numOfJokes = numberOfJokes;
    [self getRandomJokesList];
}

@end
