//
//  MDMenuBarController.m
//  QuickReminders
//
//  Created by Mert on 8/3/12.
//  Copyright (c) 2012 Mert Dumenci. All rights reserved.
//

#import "MDMenuBarController.h"

@interface MDMenuBarController (private)

-(void)toggleApp;
-(void)addToLoginItems;

@end

@implementation MDMenuBarController
@synthesize statusItem;

-(id)init {
    self = [super init];
    
    if (self) {
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"launchedBefore"]){
            // app has been launched before, do nothing
        }
        else {
            NSAlert * alert = [NSAlert alertWithMessageText:@"Startup" defaultButton:@"Yes" alternateButton:@"No" otherButton:nil informativeTextWithFormat:@"Should QuickReminders start at startup?"];
            alert.delegate = self;
            
            [self addToLoginItems];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"launchedBefore"];
        }
        
        statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:24.f];
        [statusItem setImage:[NSImage imageNamed:@"117-todo"]];
        [statusItem setAction:@selector(toggleApp)];
        [statusItem setTarget:self];
        [statusItem setEnabled:YES];
        [statusItem setHighlightMode:YES];
    }
    
    return self;
}

-(void) addToLoginItems {
	NSString * appPath = [[NSBundle mainBundle] bundlePath];
    
	// This will retrieve the path for the application
	// For example, /Applications/test.app
	CFURLRef url = (__bridge CFURLRef)[NSURL fileURLWithPath:appPath];
    
	// Create a reference to the shared file list.
    // We are adding it to the current user only.
    // If we want to add it all users, use
    // kLSSharedFileListGlobalLoginItems instead of 
    //kLSSharedFileListSessionLoginItems
	LSSharedFileListRef loginItems = LSSharedFileListCreate(NULL,
                                                            kLSSharedFileListSessionLoginItems, NULL);
	if (loginItems) {
		//Insert an item to the list.
		LSSharedFileListItemRef item = LSSharedFileListInsertItemURL(loginItems,
                                                                     kLSSharedFileListItemLast, NULL, NULL,
                                                                     url, NULL, NULL);
		if (item){
			CFRelease(item);
        }
	}	
    
	CFRelease(loginItems);
}

-(void)toggleApp {
    if (!isRemindersOn) {
        [[NSWorkspace sharedWorkspace] launchApplication:@"Reminders"];
        isRemindersOn = YES;
    }
    else {
        NSRunningApplication * remindersApp = [[NSRunningApplication runningApplicationsWithBundleIdentifier:@"com.apple.reminders"] objectAtIndex:0];
        [remindersApp terminate];
        isRemindersOn = NO;
    }
}
@end
