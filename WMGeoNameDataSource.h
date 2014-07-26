//
//  WMGeoNameDataSource.h
//  WikiMapper
//
//  Created by Mohit Jain on 27/07/14.
//  Copyright (c) 2014 CodeBeerStartups. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapkit/Mapkit.h>

@interface WMGeoNameDataSource : NSObject

@property(copy,nonatomic)  NSString *queryFormat;

- (id)initWithQueryFormat:(NSString *)format;
- (void)fetchDataForCordinateRegion:(MKCoordinateRegion)cordinateRegion completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) handler;

@end
