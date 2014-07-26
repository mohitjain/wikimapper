//
//  WMViewController.m
//  WikiMapper
//
//  Created by Mohit Jain on 26/07/14.
//  Copyright (c) 2014 CodeBeerStartups. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "WMViewController.h"
#import "WMGeoNameDataSource.h"
#import "WMGeoName.h"

@interface WMViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) WMGeoNameDataSource *geoNameDataSource;

@end

@implementation WMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.geoNameDataSource = [[WMGeoNameDataSource alloc] initWithQueryFormat:@"http://api.geonames.org/wikipediaBoundingBoxJSON?north=%f&south=%f&east=%f&west=%f&username=jainmohit27"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    MKMapRect mapRect = mapView.visibleMapRect;
    MKCoordinateRegion cordinateRegion = MKCoordinateRegionForMapRect(mapRect);
    [self fetchDateForCordinateRegion:cordinateRegion];
}

- (void)fetchDateForCordinateRegion:(MKCoordinateRegion)cordinateRegion{
    [self.geoNameDataSource fetchDataForCordinateRegion:cordinateRegion completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(data){
            NSError *jsonError = nil;
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            if(results){
                NSArray *geoNames = [WMGeoName createObjectsFromDictionary:results];
                [self.mapView addAnnotation:geoNames];
            }
            else{
                NSLog(@"Got Error during JSON Parsing %@, %@", jsonError.localizedDescription, jsonError.localizedFailureReason);
            }
        }else
        {
            NSLog(@"Error during fetch data from geo names %@, %@", connectionError.localizedDescription, connectionError.localizedFailureReason);
        }
    }];
}

@end
