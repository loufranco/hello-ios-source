//
//  CardHistoryViewController.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//


#import <UIKit/UIKit.h>
#import "GameResult.h"
#import "CardResult.h"

@interface FCCardHistoryViewController : UITableViewController {
    NSArray *results;
}

@property(strong, nonatomic) NSArray *results;

@end

