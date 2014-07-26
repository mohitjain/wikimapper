//
//  WMGeoName.h
//  WikiMapper
//
//  Created by Mohit Jain on 27/07/14.
//  Copyright (c) 2014 CodeBeerStartups. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface WMGeoName : NSObject <MKAnnotation>

@property(copy, nonatomic)NSString *title;
@property(copy, nonatomic)NSString *summary;
@property(strong, nonatomic)NSURL *wikipediaURL;
@property(assign, nonatomic)double latitude;
@property(assign, nonatomic)double longitude;

+ (NSArray *)createObjectsFromDictionary:(NSDictionary *)dict;


@end
