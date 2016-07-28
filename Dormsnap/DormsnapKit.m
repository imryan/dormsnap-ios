//
//  DormsnapAPI.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/26/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "DormsnapKit.h"

@implementation DormsnapKit

NSString * const kDSKitCreateUser     = @"http://dormsnap.co/api/user/add";
NSString * const kDSKitGetUserById    = @"http://dormsnap.co/api/user/getById/%@";
NSString * const kDSKitDeleteUserById = @"http://dormsnap.co/api/user/delete/%@";
NSString * const kDSKitUpdateUser     = @"http://dormsnap.co/api/user/update";

NSString * const kDSKitCreatePost     = @"http://dormsnap.co/api/post/add";
NSString * const kDSKitGetPostById    = @"http://dormsnap.co/api/post/getById/%@";
NSString * const kDSKitDeletePostById = @"http://dormsnap.co/api/post/delete/%@";

#pragma mark - Initialization

+ (instancetype)sharedInstance {
    static DormsnapKit *instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    
    return instance;
}

#pragma mark - Users

- (void)createUser:(DSUser *)user completion:(DSCreateDeleteHandler)completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameters = @{ @"token" : user.token };
    
    [manager POST:kDSKitCreateUser parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"Response: %@", responseObject);
        
        if ([responseObject[@"token"] length] > 0) {
            completion(true, nil);
        }
        
        completion(false, nil);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        completion(false, error);
    }];
}

- (void)getUserByIdentifier:(NSString *)identifier completion:(DSGetUserHandler)completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *endpoint = [NSString stringWithFormat:kDSKitGetUserById, identifier];
    
    [manager GET:endpoint parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        DSUser *user = [[DSUser alloc] initWithIdentifer:responseObject[@"id"] token:responseObject[@"token"]];
        completion(user, nil);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        completion(nil, error);
    }];
}

- (void)updateUser:(DSUser *)user completion:(DSUpdateHandler)completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameters = @{ @"id"    : user.identifier,
                                  @"token" : user.token
                                };
    
    [manager PUT:kDSKitUpdateUser parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if (responseObject[@"id"] != nil && responseObject[@"token"] != nil) {
            completion(true, nil);
        }
        
        completion(false, nil);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(false, error);
    }];
}

- (void)deleteUserByIdentifier:(NSString *)identifier completion:(DSCreateDeleteHandler)completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *endpoint = [NSString stringWithFormat:kDSKitDeleteUserById, identifier];
    
    [manager DELETE:endpoint parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        if (responseObject[@"id"] != nil && responseObject[@"token"] != nil) {
            completion(true, nil);
        }
        
        completion(false, nil);
        
    } failure:^(NSURLSessionTask *task, NSError *error) {
        completion(false, error);
    }];
}

#pragma mark - Posts

- (void)createPost:(DSPost *)post completion:(DSCreateDeleteHandler)completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameters = @{};
    
    [manager POST:kDSKitCreatePost parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
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
    NSString *endpoint = [NSString stringWithFormat:kDSKitGetPostById, identifier];
    
    [manager GET:endpoint parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        // Implementation now coming to a theater near you!
        
        completion(nil, nil);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        completion(nil, error);
    }];
}

- (void)deletePostWithIdentifier:(NSString *)identifier completion:(DSCreateDeleteHandler)completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *endpoint = [NSString stringWithFormat:kDSKitDeletePostById, identifier];
    
    [manager DELETE:endpoint parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        // Implementation now coming to a theater near you!
        
        completion(true, nil);
        
    } failure:^(NSURLSessionTask *task, NSError *error) {
        completion(false, error);
    }];
}

@end
