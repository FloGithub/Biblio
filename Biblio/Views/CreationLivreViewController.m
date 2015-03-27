//
//  CreationLivreViewController.m
//  Biblio
//
//  Created by S2IFA on 27/03/2015.
//  Copyright (c) 2015 ISFA. All rights reserved.
//

#import "CreationLivreViewController.h"

@interface CreationLivreViewController(){
    
    IBOutlet UILabel *lblForm;
    
    IBOutlet UILabel *lblTitle;
    IBOutlet UITextField * txtTitre;
    
    IBOutlet UILabel * lblAuteur;
    IBOutlet UITextField * txtAuteur;
    
    
    IBOutlet UILabel * lblDescription;
    IBOutlet UITextField *txtDescription;
    
    IBOutlet UILabel * lblCouverture;
    IBOutlet UIButton * btnJoindre;
    
    IBOutlet UIButton * btnValider;
}


@end

@implementation CreationLivreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
