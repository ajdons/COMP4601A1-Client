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
    NSString *identifier;
    NSString *score;
    NSString *name;
    NSString *text;
    NSString *tags;
    NSstring *links;
}
@property (nonatomic) NSString *identifier;
@property (nonatomic) NSString *score;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *text;
@property (nonatomic) NSString *tags;
@property (nonatomic) NSString *links;

-(id) init;
-(void)setDocId:(NSString *)dId;
-(void)setScore:(NSString *)s;
-(void)setName:(NSString *)n;
-(void)setDescription:(NSString *)d;
-(void)setTags:(NSString *)t;
-(void)setLinks:(NSString *)l;
-(void)addTag:(NSString *)tag;
-(void)removeTag:(NSString *)tag;
-(void)addLink:(NSString *)link;
-(void)removeLink:(NSString *)link;



@end
