//
//  GameHistoryViewController.m
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import "FCGameHistoryViewController.h"
#import "FCCardHistoryViewController.h"
#import "FCAppDelegate.h"

#import "GameResult.h"

@implementation FCGameHistoryViewController

@synthesize resultsController;

#pragma mark -
#pragma mark View lifecycle

-(NSFetchRequest*)requestForGameResults:
    (NSManagedObjectContext*) context
{
    NSEntityDescription* gameResultDesc =  
    [NSEntityDescription entityForName:@"GameResult" 
                inManagedObjectContext:context];
    
    NSFetchRequest* request = 
        [[NSFetchRequest alloc] init];
    
    [request setEntity:gameResultDesc];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]  
                               initWithKey:@"gameDate" 
                               ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    return request;
}


-(void)loadData
{
    FCAppDelegate* delegate = 
        [[UIApplication sharedApplication] delegate];

    NSManagedObjectContext* context =  
        delegate.dataContext;
    
    NSFetchRequest* request = [self requestForGameResults:context];
    
    self.resultsController =  
        [[NSFetchedResultsController alloc] 
          initWithFetchRequest:request 
          managedObjectContext:context 
          sectionNameKeyPath:nil 
          cacheName:@"GameResults"];
    self.resultsController.delegate = self; 
    
    NSError *error; 
    if (![self.resultsController performFetch:&error]) {
        NSLog(@"Fetch failed: %@", [error localizedDescription]);
    }
}



-(IBAction)doneWithHistory:(id)sender
{
    [self.navigationController.view removeFromSuperview];
    FCAppDelegate* delegate =  
    [[UIApplication sharedApplication] delegate];
    [delegate popView];
}

- (void)viewDidLoad 
{
    [super viewDidLoad];

    self.title = @"Game History";  
    self.navigationItem.rightBarButtonItem = 
        [[UIBarButtonItem alloc] 
          initWithBarButtonSystemItem: UIBarButtonSystemItemDone 
          target:self action: @selector(doneWithHistory:)];
    
    [self loadData];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait
//orientation. -
(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
interfaceOrientation { // Return YES for supported orientations return
(interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return [[self.resultsController sections] count];
}


- (NSInteger)tableView:(UITableView *)tableView 
     numberOfRowsInSection:(NSInteger)section 
{
    return [[[self.resultsController sections] objectAtIndex:section] 
            numberOfObjects];
}

-(void)fillCell:(UITableViewCell*)cell 
    withResultAtIndex:(NSIndexPath*)indexPath
{
    GameResult* gr = 
      [self.resultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text =  
        [NSString stringWithFormat:@"Game played on %@", 
          [NSDateFormatter localizedStringFromDate:gr.gameDate 
            dateStyle:NSDateFormatterShortStyle 
            timeStyle:NSDateFormatterNoStyle]];

    cell.detailTextLabel.text = 
        [NSString stringWithFormat:@"%d seconds long", 
          [gr.gameLength intValue]];
}


- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell =  
        [tableView 
         dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]  
                 initWithStyle:UITableViewCellStyleSubtitle 
                 reuseIdentifier:CellIdentifier];
        cell.accessoryType = 
            UITableViewCellAccessoryDisclosureIndicator;
    }
 
    [self fillCell:cell withResultAtIndex:indexPath]; 
    
    return cell;
}

 


/*
// Override to support conditional editing of the table view. -
(BOOL)tableView:(UITableView *)tableView
canEditRowAtIndexPath:(NSIndexPath *)indexPath { // Return NO if you do
not want the specified item to be editable. return YES; }
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {

if (editingStyle == UITableViewCellEditingStyleDelete) { // Delete the
row from the data source [tableView deleteRowsAtIndexPaths:[NSArray
arrayWithObject:indexPath] withRowAnimation:YES]; } else if
(editingStyle == UITableViewCellEditingStyleInsert) { // Create a new
instance of the appropriate class, insert it into the array, and add a
new row to the table view }   
}
*/


/* // Override to support rearranging the table view. -
(void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
toIndexPath:(NSIndexPath *)toIndexPath { } */


/* // Override to support conditional rearranging of the table view. -
(BOOL)tableView:(UITableView *)tableView
canMoveRowAtIndexPath:(NSIndexPath *)indexPath { // Return NO if you do
not want the item to be re-orderable. return YES; } */


#pragma mark -
#pragma mark Table view delegate


- (void)tableView:(UITableView *)tableView 
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FCCardHistoryViewController* vc = 
        [[FCCardHistoryViewController alloc]
            initWithNibName:@"FCCardHistoryViewController" bundle:nil];
    
    NSSortDescriptor* sort =  
        [[NSSortDescriptor alloc] 
            initWithKey:@"cardName" ascending:YES];

    GameResult* gr =  
        [self.resultsController objectAtIndexPath:indexPath];
    vc.results = [gr.cardResults sortedArrayUsingDescriptors:
                  [NSArray arrayWithObject:sort]];
    
    [self.navigationController 
        pushViewController:vc animated:YES];
}
 
#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in
//    use.
}

- (void)viewDidUnload {
    self.resultsController = nil;
}




@end

