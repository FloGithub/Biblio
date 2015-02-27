//
//  ConnectionHelper.h
//  Biblio
//
//  Created by Florence Goetz on 27/02/2015.
//  Copyright (c) 2015 ISFA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectionHelper : NSURLConnection  <NSURLConnectionDataDelegate>
// Connection
@property(nonatomic, strong) NSURLConnection *connexion;

// Connection error
@property(nonatomic, strong) NSError *connexionError;

// Connection response
@property(nonatomic, strong) NSURLResponse *connexionResponse;

// Request data
@property(nonatomic, strong) NSMutableData *responseData;

// Response String
@property(nonatomic, strong) NSString *responseString;

// Challenge
@property(nonatomic, strong) NSURLAuthenticationChallenge *challenge;

/// Overrided contructor
- (id)initWithRequest:request;

/// Block typedef
typedef void (^successCallBack)();
typedef void (^failureCallBack)();
typedef void (^authenticationCallBack)();
typedef void (^connexionResponseCallBack)();


/// Block implementaion
@property(nonatomic, copy) successCallBack onSuccess;
@property(nonatomic, copy) failureCallBack onFailure;
@property(nonatomic, copy) authenticationCallBack onAuthentication;
@property(nonatomic, copy) connexionResponseCallBack onConnexionResponse;

/// Block assignation
-(void) setSuccessBlock:(successCallBack) block;
-(void) setFailureBlock:(failureCallBack) block;
-(void) setAuthenticationBlock:(authenticationCallBack) block;
-(void) setConnexionResponseBlock:(connexionResponseCallBack) block;


@end
