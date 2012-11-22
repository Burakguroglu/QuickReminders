//
//  MDMenuBarController.h
//  QuickReminders
//
//  Created by Mert on 8/3/12.
//  Copyright (c) 2012 Mert Dumenci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface MDMenuBarController : NSObject <NSAlertDelegate> {
    BOOL isRemindersOn;
}

@property (nonatomic, strong) NSStatusItem * statusItem;

@end
