//
//  PKMP4Status.m
//  PutioKit
//
//  Created by orta therox on 03/11/2012.
//  Copyright (c) 2012 PutIOKit. All rights reserved.
//

#import "PKMP4Status.h"

@implementation PKMP4Status

+ (id)objectWithDictionary:(NSDictionary *)dictionary {
    PKMP4Status *status = [super objectWithDictionary:dictionary];
    if (status) {
        NSString *statusType = dictionary[@"mp4"][@"status"];

        if ([statusType isEqualToString:@"COMPLETED"]) {
            status.mp4Status = PKMP4StatusCompleted;
        }
        else if ([statusType isEqualToString:@"CONVERTING"]) {
            status.mp4Status = PKMP4StatusConverting;
        }
        else if ([statusType isEqualToString:@"IN_QUEUE"]) {
            status.mp4Status = PKMP4StatusQueued;
        }
        else {
            status.mp4Status = PKMP4StatusUnknown;
        }

        status.progress = @( [dictionary[@"mp4"][@"percent_done"] floatValue] / 100 );

    }
    return status;
}

@end
