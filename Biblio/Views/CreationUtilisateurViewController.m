//
//  CreationUtilisateurViewController.m
//  Biblio
//
//  Created by Vahik et Lotfi on 27/02/2015.
//  Copyright (c) 2015 ISFA. All rights reserved.
//

#import "CreationUtilisateurViewController.h"

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
