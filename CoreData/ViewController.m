//
//  ViewController.m
//  CoreData
//
//  Created by Eric Giannini on 12/3/15.
//  Copyright © 2015 Unicorn Mobile, LLC. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ChoreMO.h"


@interface ViewController ()

@property(nonatomic) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITextField *choreTextField;
@property (weak, nonatomic) IBOutlet UILabel *persistedData;

// Btns
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (weak, nonatomic) IBOutlet UIButton *dltBtn;
@property (weak, nonatomic) IBOutlet UILabel *placeholderCntLbl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _appDelegate = [[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view, typically from a nib.
    [self updateLogList];
    
    [_addBtn setTitle:@"Add a new chore!" forState:UIControlStateNormal];
    [_dltBtn setTitle:@"Delete an old chore!" forState:UIControlStateNormal];
    [_placeholderCntLbl setText: nil];
    [self updatePlaceholderCntLbl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updatePlaceholderCntLbl {
    
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Chores"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetchig Person objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    NSString *numOfItemsInArray = [NSString stringWithFormat:@"Chores: %lu", (unsigned long)[results count]];
    [_placeholderCntLbl setText:numOfItemsInArray];
}

- (IBAction)choreTap:(id)sender {
    ChoreMO *c = [[self appDelegate] createChoreMO];
    c.chore_name = [[self choreTextField] text];
    [[self appDelegate] saveContext];
    [self updateLogList];
    [self updatePlaceholderCntLbl];
    
}
- (IBAction)choreDeleteTap:(id)sender {
    
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Chores"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetchig Person objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    for (ChoreMO *c in results) {
        [moc deleteObject:c];
    }
    
    [[self appDelegate] saveContext];
    [self updateLogList];
    [self updatePlaceholderCntLbl];

    
}

- (void) updateLogList {
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Chores"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetchig Person objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    NSMutableString *buffer =[NSMutableString stringWithString:@""];
    
    for (ChoreMO *c in results) {
        [buffer appendFormat:@"\n%@", c.chore_name, nil];
    }
    
    self.persistedData.text = buffer;
}

@end
