//
//  Document.h
//  COMP4601A1-Client
//
//  Created by Adam Donegan on 2015-01-24.
//  Copyright (c) 2015 Adam Donegan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Document : NSObject

{
    NSInteger *docId;
    NSInteger *score;
    NSString *name;
    NSString *description;
    NSMutableArray *tags;
    NSMutableArray *links;
}
@property (nonatomic) NSInteger *docId;
@property (nonatomic) NSInteger *score;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *description;
@property (nonatomic) NSMutableArray *tags;
@property (nonatomic) NSMutableArray *links;

-(id) init;
-(void)setDocId:(NSInteger *)dId;
-(void)setScore:(NSInteger *)s;
-(void)setName:(NSString *)n;
-(void)setDescription:(NSString *)d;
-(void)setTags:(NSMutableArray *)t;
-(void)setLinks:(NSMutableArray *)l;
-(void)addTag:(NSString *)tag;
-(void)removeTag:(NSString *)tag;
-(void)addLink:(NSString *)link;
-(void)removeLink:(NSString *)link;


@end
