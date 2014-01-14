//
//  ActorViewController.m
//  MovieList
//
//  Created by T on 2014. 1. 14..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import "ActorViewController.h"
#import "MovieCenter.h"
#import "ViewController.h"

@interface ActorViewController () <UITableViewDataSource, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ActorViewController{
    MovieCenter *_movieCenter;
    int _id;

}

- (IBAction)addActor:(id)sender {
    // TODO alert view
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"배우추가" message:@"배우 이름을 입력하세요" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"확인", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.firstOtherButtonIndex == buttonIndex) {
        UITextField *textField = [alertView textFieldAtIndex:0];
        NSString *userInput = textField.text;
      //  ViewController *vc = [[ViewController alloc]init];
        
        [_movieCenter addActorWithName:userInput inMovie:self.movieIndex];
        [self.table reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   // ViewController *vc = [[ViewController alloc]init];
    return [_movieCenter getNumberOfActorsInMovie:self.movieIndex];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ACTOR_CELL" forIndexPath:indexPath];
    
    cell.textLabel.text = [_movieCenter getNameOfActorAtIndex:indexPath.row inMovie:self.movieIndex];
    return cell;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _movieCenter = [MovieCenter sharedMovieCenter];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
