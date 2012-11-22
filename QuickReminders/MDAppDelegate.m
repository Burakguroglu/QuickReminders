//
//  MDAppDelegate.m
//  QuickReminders
//
//  Created by Mert on 8/3/12.
//  Copyright (c) 2012 Mert Dumenci. All rights reserved.
//

#import "MDAppDelegate.h"

@implementation MDAppDelegate
@synthesize menubarController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.menubarController = [[MDMenuBarController alloc] init];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{
    // Explicitly remove the icon from the menu bar
    self.menubarController = nil;
    return NSTerminateNow;
}

@end
