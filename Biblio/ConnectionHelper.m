//
//  ConnectionHelper.m
//  Biblio
//
//  Created by Florence Goetz on 27/02/2015.
//  Copyright (c) 2015 ISFA. All rights reserved.
//

#import "ConnectionHelper.h"

@implementation ConnectionHelper


// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#pragma mark - CONNEXION  LIFE
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


// ============================================================================
/**
 * initWithRequest @override
 *
 * @brief Returns an initialized URL connection
 * @param (NSURLRequest *) - The request which to initiate the connexion with
 * @return (id) - The URL connection for the URL request
 */
// ============================================================================
- (id)initWithRequest:(NSURLRequest *)request {
    if ((self = [super initWithRequest:request delegate:self startImmediately:NO])) {
    }
    return self;
}



// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#pragma mark - CONNEXION  DELEGATE
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


// ============================================================================
/**
 * connection didReceiveAuthenticationChallenge @override
 *
 * @brief Sent when a connection must authenticate a challenge
 * @param (NSURLConnection *) - The connection sending the message
 * @param (NSURLAuthenticationChallenge *) - The challenge that connection
 * must authenticate
 */
// ============================================================================
-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    self.challenge = challenge;
    if( self.onAuthentication ) {
        self.onAuthentication();
    }
}


// ============================================================================
/**
 * connection didFailWithError @override
 *
 * @brief Sent when a connection fails to load
 * @param (NSURLConnection *) - The connection sending the message
 * @param (NSError *) - Details why the connection fails to load
 */
// ============================================================================
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    //ILog(@" > Did fail \n\tConnection: %@ \n\tError: %@ %@", connection.currentRequest.URL.absoluteString, [error localizedDescription], [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    self.connexionError = error;
    if( self.onFailure ) {
        self.onFailure();
    }
}


// ============================================================================
/**
 * connection didReceiveResponse @override
 *
 * @brief Sent when the connection has received sufficient data to construct
 * the URL
 * @param (NSURLConnection *) - The connection sending the message
 * @param (NSURLResponse *) - The URL response for the connection's request
 */
// ============================================================================
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // ILog(@" > Did receive response %@ \n%@", connection.currentRequest.URL.absoluteString, response);
    self.connexion = connection;
    self.connexionResponse = response;
    self.responseData = [[NSMutableData alloc] init];
    if( self.onConnexionResponse ) {
        
        self.onConnexionResponse();
    }
}



// ============================================================================
/**
 * connection didReceiveData @override
 *
 * @brief Sent as a connection loads data incrementally
 * @param (NSURLConnection *) - The connection sending the message
 * @param (NSURLResponse *) - The newly available data
 */
// ============================================================================
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // ILog(@" > Did receive data %@", connection.currentRequest.URL.absoluteString);
    [self.responseData appendData:data];
}


// ============================================================================
/**
 * connection didReceiveData @override
 *
 * @brief Sent when a connection has finished loading successfully
 * @param (NSURLConnection *) - The connection sending the message
 */
// ============================================================================
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //ILog(@" > Did finish loading %@ %@", connection.currentRequest.URL.absoluteString, [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    if( self.onSuccess ) {
        self.onSuccess();
    }
}


// ============================================================================
/**
 * connectionShouldUseCredentialStorage @override
 *
 * @brief Sent to determine whether the URL loader should consult the
 * credential storage
 * @param (NSURLConnection *) - The connection sending the message
 */
// ============================================================================
- (BOOL)connectionShouldUseCredentialStorage:(NSURLConnection *)connection {
    return YES;
}


// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#pragma mark - CONNEXION  CALLBACK
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

// ============================================================================
/**
 * setSuccessBlock
 *
 * @brief Set the callback block for the method triggered when a connection
 * has finished loading successfully
 * @param (successCallBack) - The block to initialize the method with
 */
// ============================================================================
-(void) setSuccessBlock:(successCallBack) block {
    self.onSuccess = block;
}


// ============================================================================
/**
 * setFailureBlock
 *
 * @brief Set the callback block for the method triggered when a connection
 * has failed loading
 * @param (successCallBack) - The block to initialize the method with
 */
// ============================================================================
-(void) setFailureBlock:(failureCallBack) block {
    self.onFailure = block;
}


// ============================================================================
/**
 * setAuthenticationBlock
 *
 * @brief Set the callback block for the method triggered when an authetication
 * is requested
 * @param (successCallBack) - The block to initialize the method with
 */
// ============================================================================
-(void) setAuthenticationBlock:(authenticationCallBack) block {
    self.onAuthentication = block;
}


// ============================================================================
/**
 * setConnexionResponseBlock
 *
 * @brief Set the callback block for the method triggered when a response has
 * been received
 * @param (successCallBack) - The block to initialize the method with
 */
// ============================================================================
-(void) setConnexionResponseBlock:(connexionResponseCallBack) block {
    self.onConnexionResponse = block;
}



@end