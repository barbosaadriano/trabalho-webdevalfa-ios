//
//  ViewController.m
//  CarSaleAdriano
//
//  Created by Faculdade Alfa on 03/12/16.
//  Copyright (c) 2016 Avantagem. All rights reserved.
//

#import "ViewController.h"
#import "DetalhesViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize dados,tabela;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self atualizarTabela:self];
}
- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    //número de linhas dentro da tabela
    return dados.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:@"Celula"];
    if (celula == nil) {
        celula = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Celula"];
    }
    @try {
        if ([dados  objectAtIndex:indexPath.row] != nil) {
            NSDictionary *item = [dados objectAtIndex:indexPath.row];
            celula.textLabel.text = [NSString  stringWithFormat:@"Marca: %@",[item objectForKey:@"marca"]];
            celula.detailTextLabel.text = [NSString stringWithFormat:@"Modelo: %@. Ano: %@. Valor: %@",[item objectForKey:@"modelo"], [item objectForKey:@"ano"],[item objectForKey:@"valor"]];
            
        }
    }
    @catch (NSException *exception) {}
    @finally {}
    return celula;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(IBAction)atualizarTabela:(id)sender {
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/dadostrabalho.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        dados = [NSMutableArray arrayWithContentsOfFile:filePath];
    }
    [tabela reloadData];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"telaDetalhe"]) {
        NSInteger row = [tabela.indexPathForSelectedRow row];
        NSDictionary *item = [dados objectAtIndex:row];
        DetalhesViewController *detalhes = segue.destinationViewController;
        detalhes.item = item;
        detalhes.inEdit = true;
        detalhes.index = row;
        [tabela deselectRowAtIndexPath:tabela.indexPathForSelectedRow animated:YES];
    }
}
-(void) viewDidAppear:(BOOL)animated {
    [self atualizarTabela:self];
}

@end
