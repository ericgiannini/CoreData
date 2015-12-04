//
//  ViewController.m
//  CoreData
//
//  Created by Eric Giannini on 12/3/15.
//  Copyright © 2015 Unicorn Mobile, LLC. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@interface ViewController ()

@property(nonatomic) AppDelegate *appDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _appDelegate = [[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
