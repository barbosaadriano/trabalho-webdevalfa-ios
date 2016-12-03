//
//  DetalhesViewController.h
//  CarSaleAdriano
//
//  Created by Faculdade Alfa on 03/12/16.
//  Copyright (c) 2016 Avantagem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalhesViewController : UIViewController<UITextFieldDelegate>{
    NSString *filePath;
    NSMutableArray *dados;
}

@property (strong, nonatomic) IBOutlet UITextField *marca;
@property (strong, nonatomic) IBOutlet UITextField *modelo;
@property (strong, nonatomic) IBOutlet UITextField *ano;
@property (strong, nonatomic) IBOutlet UITextField *valor;
@property (strong, nonatomic) NSDictionary *item;
@property (nonatomic) NSInteger index;
@property (nonatomic) BOOL inEdit;


-(IBAction)voltar:(id)sender;
-(IBAction)gravar:(id)sender;

@end
