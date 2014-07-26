//
//  WMGeoNameDataSource.m
//  WikiMapper
//
//  Created by Mohit Jain on 27/07/14.
//  Copyright (c) 2014 CodeBeerStartups. All rights reserved.
//

#import "WMGeoNameDataSource.h"

@implementation WMGeoNameDataSource


- (id)initWithQueryFormat:(NSString *)format{
    self = [super init];
    if(self){
        _queryFormat = [format copy];
    }
    return self;
}

- (void)fetchDataForCordinateRegion:(MKCoordinateRegion)cordinateRegion completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) handler{
    double west = cordinateRegion.center.longitude - cordinateRegion.span.longitudeDelta/2;
    double east = cordinateRegion.center.longitude +  cordinateRegion.span.longitudeDelta/2;
    double north = cordinateRegion.center.latitude - cordinateRegion.span.latitudeDelta/2;
    double south = cordinateRegion.center.latitude +  cordinateRegion.span.latitudeDelta/2;
    NSString *queryString = [NSString stringWithFormat:self.queryFormat, north, south, east, west];
    NSURL *queryUrl = [NSURL URLWithString:queryString];
    NSURLRequest *request = [NSURLRequest requestWithURL:queryUrl];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:handler];
}

@end
