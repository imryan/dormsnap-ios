//
//  DormsnapAPI.h
//  Dormsnap
//
//  Created by Ryan Cohen on 7/26/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSUniversity.h"
#import "DSResidence.h"
#import "DSPost.h"

#import <Foundation/Foundation.h>

@interface DormsnapAPI : NSObject

typedef void (^DSCreateDeleteHandler)(BOOL created, NSError *error);
typedef void (^DSUpdateHandler)(BOOL updated, NSError *error);

typedef void (^DSGetUserHandler)(DSUser *user, NSError *error);
typedef void (^DSGetPostHandler)(DSPost *post, NSError *error);

/**
 POST - Creates a new User
 
 @params User object
 */
extern NSString * const kDSAPICreateUser;

/**
 GET - Gets a User object by their ID
 
 @params User ID
 */
extern NSString * const kDSAPIGetUserById;

/**
 DELETE - Deletes a User object by their ID
 
 @params User ID
 */
extern NSString * const kDSAPIDeleteUserById;

/**
 PUT - Updates a User object by their ID
 
 @params User object
 */
extern NSString * const kDSAPIUpdateUser;

/**
 POST - Creates a new Post
 
 @params Post object
 */
extern NSString * const kDSAPICreatePost;

/**
 GET - Get a Post objects by its ID
 
 @params Post ID
 */
extern NSString * const kDSAPIGetPostById;

/**
 DELETE - Deletes a Post by its ID
 
 @params Post ID
 */
extern NSString * const kDSAPIDeletePostById;

/**
 Returns a new shared instance
 
 @return A shared instance of the API class
 */
+ (instancetype)sharedInstance;

/**
 Creates a new User object
 
 @return @c BOOL Success , @c NSError error
 */
- (void)createUser:(DSUser *)user completion:(DSCreateDeleteHandler)completion;

/**
 Gets a User object by its ID
 
 @return @c BOOL Success , @c NSError error
 */
- (void)getUserByIdentifier:(NSString *)identifier completion:(DSGetUserHandler)completion;

/**
 Updates a User object by its ID
 
 @return @c BOOL Success , @c NSError error
 */
- (void)updateUserByIdentifier:(NSString *)identifier completion:(DSUpdateHandler)completion;

/**
 Deletes a User object by its ID
 
 @return @c BOOL Success , @c NSError error
 */
- (void)deleteUserByIdentifier:(NSString *)identifier completion:(DSCreateDeleteHandler)completion;

/**
 Creates a new Post object
 
 @return @c BOOL Success , @c NSError error
 */
- (void)createPost:(DSPost *)post completion:(DSCreateDeleteHandler)completion;

/**
 Gets a Post object by its ID
 
 @return @c DSPost post , @c NSError error
 */
- (void)getPostWithIdentifier:(NSString *)identifier completion:(DSGetPostHandler)completion;

/**
 Deletes a Post object by its ID
 
 @return @c DSPost post , @c NSError error
 */
- (void)deletePostWithIdentifier:(NSString *)identifier completion:(DSCreateDeleteHandler)completion;

@end