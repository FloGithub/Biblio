//
//  Utilisateur.h
//  Biblio
//
//  Created by S2IFA on 05/03/2015.
//  Copyright (c) 2015 ISFA. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Utilisateur : NSObject

@property (nonatomic,strong) NSString * ident;
@property (nonatomic,strong) NSString * firstname;
@property (nonatomic,strong) NSString * lastname;
@property (nonatomic,strong) NSString * pass;
@property (nonatomic) BOOL * isAdmin;
@property (nonatomic) BOOL * isActif;
@end
