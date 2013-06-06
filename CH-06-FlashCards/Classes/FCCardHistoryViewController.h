//
//  CardHistoryViewController.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameResult.h"
#import "CardResult.h"

@interface FCCardHistoryViewController : UITableViewController 

@property(strong, nonatomic) NSArray *results;

@end
