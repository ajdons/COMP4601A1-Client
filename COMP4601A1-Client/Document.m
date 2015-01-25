//
//  Document.m
//  COMP4601A1-Client
//
//  Created by Adam Donegan on 2015-01-24.
//  Copyright (c) 2015 Adam Donegan. All rights reserved.
//

#import "Document.h"

@implementation Document

@synthesize docId;
@synthesize score;
@synthesize name;
@synthesize description;
@synthesize tags;
@synthesize links;


-(id) init{
    self = [super init];
    
    if(self){
        name = [[NSString alloc] init];
        description = [[NSString alloc]init];
        tags = [[NSMutableArray alloc] init];
        links = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)setDocId:(NSInteger *)dId
{
    docId = dId;
}

-(void)setScore:(NSInteger *)s
{
    score = s;
}

-(void)setName:(NSString *)n
{
    name = n;
}

-(void)setDescription:(NSString *)d
{
    description = d;
}

-(void)setTags:(NSMutableArray *)t
{
    tags  = t;
}

-(void)setLinks:(NSMutableArray *)l
{
    links = l;
}

-(void)addTag:(NSString *)tag;
{
    [tags addObject:tag];
}

-(void)removeTag:(NSString *)tag
{
    [tags removeObject:tag];
}

-(void)addLink:(NSString *)link
{
    [links addObject:link];
}

-(void)removeLink:(NSString *)link
{
    [links removeObject:link];
}
@end
