//
//  MDAppDelegate.h
//  QuickReminders
//
//  Created by Mert on 8/3/12.
//  Copyright (c) 2012 Mert Dumenci. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MDMenuBarController.h"

@interface MDAppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) MDMenuBarController * menubarController;

@end
