//
//  MovieListTests.m
//  MovieListTests
//
//  Created by T on 2014. 1. 14..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MovieCenter.h"

@interface MovieListTests : XCTestCase

@end

@implementation MovieListTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    MovieCenter *center = [MovieCenter sharedMovieCenter];
    
    NSInteger movieId = [center addMovieWithName:@"어벤져스"];
    NSString *movieName = [center getNameOfMovieAtId:movieId];
    XCTAssertEqualObjects(@"어벤져스", movieName, @"틀림");
    

//    NSString *actorName = [center getNameOfActorAtIndex:0 inMovie:0];
//    XCTAssertTrue([@"스칼렛요한슨" isEqualToString:actorName], @"Strings are not equal %@ %@", @"스칼렛요한슨", actorName);
}








@end
