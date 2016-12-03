//
//  ViewController.h
//  CarSaleAdriano
//
//  Created by Faculdade Alfa on 03/12/16.
//  Copyright (c) 2016 Avantagem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong,nonatomic) IBOutlet UITableView *tabela;
@property (strong, nonatomic) NSArray *dados;
-(IBAction)atualizarTabela:(id)sender;


@end

