//
//  Document.m
//  COMP4601A1-Client
//
//  Created by Adam Donegan on 2015-01-24.
//  Copyright (c) 2015 Adam Donegan. All rights reserved.
//

#import "Document.h"

@implementation Document

@synthesize identifier;
@synthesize score;
@synthesize name;
@synthesize text;
@synthesize tags;
@synthesize links;


-(id) init{
    self = [super init];
    
    if(self){
        identifier = [[NSString alloc] init];
        score = [[NSString alloc]init];
        name = [[NSString alloc] init];
        text = [[NSString alloc]init];
        tags = [[NSString alloc] init];
        links = [[NSString alloc] init];
    }
    return self;
}

-(void)setDocId:(NSString *)dId
{
    identifier = dId;
}

-(void)setScore:(NSString *)s
{
    score = s;
}

-(void)setName:(NSString *)n
{
    name = n;
}

-(void)setDescription:(NSString *)d
{
    text = d;
}

-(void)setTags:(NSString *)t
{
    tags  = t;
}

-(void)setLinks:(NSString *)l
{
    links = l;
}

@end
