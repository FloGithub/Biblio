//
//  CreationUtilisateurViewController.m
//  Biblio
//
//  Created by Vahik et Lotfi on 27/02/2015.
//  Copyright (c) 2015 ISFA. All rights reserved.
//

#import "CreationUtilisateurViewController.h"
#import "Constante.h"
#import "Utilisateur.h"
#import "ConnectionHelper.h"

@interface CreationUtilisateurViewController (){
    IBOutlet UILabel *lTitle;
    
    IBOutlet UILabel * lPrenom;
    IBOutlet UITextField * prenom;
    
    IBOutlet UILabel * lNom;
    IBOutlet UITextField *nom;
    
    IBOutlet UILabel * lLogin;
    IBOutlet UITextField *login;
    
    IBOutlet UILabel * lMotdepasse;
    IBOutlet UITextField *mdp;
    
    IBOutlet UILabel * lCmotdepasse;
    IBOutlet UITextField *tCMdp;
    
    IBOutlet UIButton * but;
}

@end

@implementation CreationUtilisateurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    lTitle.text = @"Formulaire d'inscription";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createUser{
    // initialisation de l'URL qui va etre appelée.
    NSURL * url=[NSURL URLWithString:[NSString stringWithFormat:@"%@/user", kAdressServer]];
    // initialisation de la requète d'appel du serveur
    NSMutableURLRequest * request= [NSMutableURLRequest requestWithURL:url];
    // définition du type de méthode envoyée
    [request setHTTPMethod:@"PUT"];
    // ajout des headers à la requète
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"Basic aXNmYTppc2ZhMjAxNQ==" forHTTPHeaderField:@"Authorization"];
    // body
    // login = ident
    Utilisateur * user = [[Utilisateur alloc] init];
    user.ident = login.text;
    user.firstname = prenom.text;
    user.lastname = nom.text;
    user.pass = mdp.text;
    user.isAdmin = false; // ou 0
    user.isActif = 0;
    NSError *error;
    
    
    NSDictionary * dico = @{@"id":login.text,@"firstname":prenom.text,@"lastname":nom.text,
                            @"pass":mdp.text,@"isAdmin":@FALSE,@"isActif":@TRUE};

    
    NSData * dataToSend = [NSJSONSerialization dataWithJSONObject:dico options:NSUTF8StringEncoding error:&error];
    [request setHTTPBody:dataToSend];

    ConnectionHelper * cHelper= [[ConnectionHelper alloc] initWithRequest:request];
    
    //succes
    
    [cHelper setSuccessBlock:^{
        NSLog(@"c'est ok!!!!!");
    
    }];
    
    //
    [cHelper setFailureBlock:^{
        NSLog(@"failed !!!!!");
        
    }];
    
    [cHelper start];

}

-(IBAction) provisoir :(id)sender {
    
    
    [self createUser];
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction) onClick1: (id) sender {
    //NSString *chaine
    NSLog(@"User clicked %@", sender);
    //on teste si les valeurs des deux champs *mdp et *tCMdp sont les mêmes
    //sinon on renvois un message d'erreur
    if([mdp.text isEqualToString:tCMdp.text])
        NSLog (@"password identiques ");
        else NSLog (@" les deux password sont différents");
}

@end
