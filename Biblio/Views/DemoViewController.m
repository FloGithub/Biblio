//
//  DemoViewController.m
//  Biblio
//
//  Created by Florence Goetz on 05/03/2015.
//  Copyright (c) 2015 ISFA. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController () {
    IBOutlet UITextField *tfDemo;
    IBOutlet UILabel *lDemo;
}

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialiser une chaine de caractères
    NSString *chaine = @"Ceci est une chaîne de caractères.";
    
    // Concaténer 3 éléments pour en faire une chaîne de caractères
    [NSString stringWithFormat:@"Première chaine. %@ %i", chaine, 3]; // Résultat = "Première chaine. Ceci est une chaîne de caractères. 3"
    
    // Récupérer le contenu d'un champ de texte et le mettre dans un label
    lDemo.text = tfDemo.text;
    
    // Appeler une autre méthode
    [self deuxiemeMethode];
    
    // Initialiser un tableau
    NSArray *listePays = @[@"France",@"Allemagne", @"Angleterre",@"Italie"];
    
    // Afficher dans un label le 2ème élément du tableau
    lDemo.text = [listePays objectAtIndex:1];
    
    // Foreach
    for (NSString *pays in listePays) {
        lDemo.text = pays;
    }
    
    // Initialiser un dictionnaire
    NSDictionary *dicoFrance = @{@"nom":@"France",@"capitale":@"Paris",@"monnaie":@"€",@"continent":@"Europe"};
    
    // Afficher la capitale dans un label
    lDemo.text = [dicoFrance objectForKey:@"capitale"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)deuxiemeMethode {
    
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
