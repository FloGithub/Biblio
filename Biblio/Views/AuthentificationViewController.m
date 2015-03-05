//
//  AuthentificationViewController.m
//  Biblio
//
//  Created by Rahma et Ahmed on 27/02/2015. (interface)
//  Created by Shuai et Faro on 27/02/2015. (envoi au serveur de la requête)
//  Created by Diouldé et ? et ? on 27/02/2015. (traitement de la réponse du serveur)
//  Copyright (c) 2015 ISFA. All rights reserved.
//

#import "AuthentificationViewController.h"
#import "Constante.h"
#import "Authent.h"
#import "ConnectionHelper.h"

@interface AuthentificationViewController (){
    IBOutlet UILabel * ident ;
    IBOutlet UILabel * pass ;
    IBOutlet UITextField * champlogin;
    IBOutlet UITextField * champpass ;
    IBOutlet UIButton * connexion;
}

@end

@implementation AuthentificationViewController
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#pragma mark - CONTROLLER LIFE CYCLE
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

// ============================================================================
/**
 * viewDidLoad
 *
 * @brief Called after the controller’s view is loaded into memory
 */
// ============================================================================
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(connectioWithServerNotificationReceived:)
                                                 name:@"myTestNotification"
                                               object:nil];
}


// ============================================================================
/**
 * didReceiveMemoryWarning
 *
 * @brief The app receives a memory warning
 */
// ============================================================================
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)authentUser {
    Authent * authent = [[Authent alloc]init];
    authent.login = champlogin.text;
    authent.pass = champpass.text;
    
    NSDictionary * dico = @ {@"login":authent.login, @"pass":authent.pass};
    
    NSError * error ;
    NSData * dataToSend = [NSJSONSerialization dataWithJSONObject:dico options:NSUTF8StringEncoding error:&error];
    
    
    // initialisation de l'URL qui va etre appelée.
    NSURL * url=[NSURL URLWithString:[NSString stringWithFormat:@"%@/user", kAdressServer]];
    // initialisation de la requète d'appel du serveur
    NSMutableURLRequest * request= [NSMutableURLRequest requestWithURL:url];
    // définition du type de méthode envoyée
    [request setHTTPMethod:@"POST"];
    // ajout des headers à la requète
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"Basic aXNmYTppc2ZhMjAxNQ==" forHTTPHeaderField:@"Authorization"];
    [request setHTTPBody:dataToSend];
    
    ConnectionHelper * connection = [[ConnectionHelper alloc] initWithRequest:request];
    
    [connection setSuccessBlock:^{
        NSLog(@"OK!");
    }];
    
    [connection setFailureBlock:^{
        NSLog(@"KO!");
    }];
    
    [connection start];
    
}

- (IBAction)temp:(id)sender{
    [self authentUser];
}

- (void) receiveTestNotification:(NSNotification *) notification {
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"myTestNotification"])
        NSLog (@"Successfully received the test notification!");
}


- (void) connectioWithServerNotificationReceived:(NSNotification *) notification {
    if ([[notification name] isEqualToString:@"myTestNotification"])
        NSLog (@"Notification is successfully received!");
    else NSLog (@" enter your identifier and you passwod");
    
}

// ============================================================================
/**
 * TOTO
 *
 * @brief cette methode nous sert à tester notre classe en attendant de rassembler 
 * les partis de tout les groupes
 * @param (id) - The object sender for this action
 * @return (IBAction) - Qualifiers used by Interface Builder to synchronize
 * actions
 */
// ============================================================================
- (IBAction)TOTO:(id)sender {  //
    
    // All instances of TestClass will be notified
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"myTestNotification"
     object:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
