//
//  WMGeoName.m
//  WikiMapper
//
//  Created by Mohit Jain on 27/07/14.
//  Copyright (c) 2014 CodeBeerStartups. All rights reserved.
//

#import "WMGeoName.h"

@implementation WMGeoName


+ (NSArray *)createObjectsFromDictionary:(NSDictionary *)dict {
    NSArray *rawGeoNames = dict[@"geonames"];
    NSMutableArray *geoNames = [NSMutableArray arrayWithCapacity:[rawGeoNames count]];
    
    for (NSDictionary *dict in rawGeoNames) {
        WMGeoName *geoName = [[self alloc] init];
        geoName.title = dict[@"title"];
        geoName.summary = dict[@"summary"];
        NSString *urlString = [NSString stringWithFormat:@"http://%@", dict[@"wikipediaUrl"]];
        geoName.wikipediaURL = [NSURL URLWithString:urlString];
        
        NSString *latitude = dict[@"lat"];
        geoName.latitude = [latitude doubleValue];
        NSString *longtitude = dict[@"lng"];
        geoName.longitude = [longtitude doubleValue];
        [geoNames addObject:geoName];
        
    }
    
    return geoNames;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@ : %@", [super description], [self title]];
}

- (NSString *)subtitle{
    return self.summary;
}

- (CLLocationCoordinate2D)coordinate{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.latitude;
	coordinate.longitude = self.longitude;
    return coordinate;
}

@end
