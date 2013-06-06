//
//  GameHistoryViewController.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <CoreData/CoreData.h>

@interface FCGameHistoryViewController : UITableViewController
    <NSFetchedResultsControllerDelegate> 

@property(strong, nonatomic) 
        NSFetchedResultsController *resultsController;

@end

