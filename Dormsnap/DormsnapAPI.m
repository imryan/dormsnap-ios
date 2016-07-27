//
//  DormsnapAPI.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/26/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "DormsnapAPI.h"

@implementation DormsnapAPI

NSString * const kDSAPICreateUser     = @"https://dormsnap.co/api/user/add";
NSString * const kDSAPIGetUserById    = @"https://dormsnap.co/api/user/getById/%@";
NSString * const kDSAPIDeleteUserById = @"https://dormsnap.co/api/user/delete/%@";
NSString * const kDSAPIUpdateUser     = @"https://dormsnap.co/api/user/update";

NSString * const kDSAPICreatePost     = @"https://dormsnap.co/api/post/add";
NSString * const kDSAPIGetPostById    = @"https://dormsnap.co/api/post/getById/%@";
NSString * const kDSAPIDeletePostById = @"https://dormsnap.co/api/post/delete/%@";

#pragma mark - Initialization

+ (instancetype)sharedInstance {
    static DormsnapAPI *instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    
    return instance;
}

#pragma mark - Users

- (void)createUser:(DSUser *)user completion:(DSCreateDeleteHandler)completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameters = @{};
    
    [manager POST:kDSAPIUpdateUser parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        // Implementation now coming to a theater near you!
        
        completion(true, nil);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        completion(false, error);
    }];
}

- (void)getUserByIdentifier:(NSString *)identifier completion:(DSGetUserHandler)completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *endpoint = [NSString stringWithFormat:kDSAPIGetUserById, identifier];
    
    [manager GET:endpoint parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        // Implementation now coming to a theater near you!
        
        completion(nil, nil);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        completion(nil, error);
    }];
}

- (void)updateUserByIdentifier:(NSString *)identifier completion:(DSUpdateHandler)completion {
    // Implementation now coming to a theater near you!
}

- (void)deleteUserByIdentifier:(NSString *)identifier completion:(DSCreateDeleteHandler)completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *endpoint = [NSString stringWithFormat:kDSAPIDeleteUserById, identifier];
    
    [manager DELETE:endpoint parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        // Implementation now coming to a theater near you!
        
        completion(true, nil);
        
    } failure:^(NSURLSessionTask *task, NSError *error) {
        completion(false, error);
    }];
}

#pragma mark - Posts

- (void)createPost:(DSPost *)post completion:(DSCreateDeleteHandler)completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameters = @{};
    
    [manager POST:kDSAPICreatePost parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        // Implementation now coming to a theater near you!
        
        /*
         {
            "title": "testing",
            "user": 9,
            "residence": 3
         }
         */
        
        completion(true, nil);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        completion(false, error);
    }];
}

- (void)getPostWithIdentifier:(NSString *)identifier completion:(DSGetPostHandler)completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *endpoint = [NSString stringWithFormat:kDSAPIGetPostById, identifier];
    
    [manager GET:endpoint parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        // Implementation now coming to a theater near you!
        
        completion(nil, nil);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        completion(nil, error);
    }];
}

- (void)deletePostWithIdentifier:(NSString *)identifier completion:(DSCreateDeleteHandler)completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *endpoint = [NSString stringWithFormat:kDSAPIDeletePostById, identifier];
    
    [manager DELETE:endpoint parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        // Implementation now coming to a theater near you!
        
        completion(true, nil);
        
    } failure:^(NSURLSessionTask *task, NSError *error) {
        completion(false, error);
    }];
}

@end
