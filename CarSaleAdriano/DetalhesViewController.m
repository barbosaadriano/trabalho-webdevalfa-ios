//
//  DetalhesViewController.m
//  CarSaleAdriano
//
//  Created by Faculdade Alfa on 03/12/16.
//  Copyright (c) 2016 Avantagem. All rights reserved.
//

#import "DetalhesViewController.h"

@interface DetalhesViewController ()

@end

@implementation DetalhesViewController
@synthesize marca,modelo,ano,valor,item,index,inEdit;
- (void)viewDidLoad {
    [super viewDidLoad];
    filePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/dadostrabalho.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        dados = [NSMutableArray arrayWithContentsOfFile:filePath];
    } else {
        dados = [[NSMutableArray alloc] init];
    }
    if (item) {
        NSString *marcaStr = [item objectForKey:@"marca"];
        NSString *modeloStr = [item objectForKey:@"modelo"];
        NSString *anoStr = [item objectForKey:@"ano"];
        NSString *valorStr = [item objectForKey:@"valor"];
        marca.text = marcaStr;
        modelo.text = modeloStr;
        ano.text = anoStr;
        valor.text = valorStr;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

-(IBAction)gravar:(id)sender {
    if ([self validarForm]) {
        if (inEdit) {
            if ([dados objectAtIndex:(NSUInteger)index]!=nil) {
                [[dados objectAtIndex:(NSUInteger)index] setValue:marca.text forKey:@"marca"];
                [[dados objectAtIndex:(NSUInteger)index] setValue:modelo.text forKey:@"modelo"];
                [[dados objectAtIndex:(NSUInteger)index] setValue:ano.text forKey:@"ano"];
                [[dados objectAtIndex:(NSUInteger)index] setValue:valor.text forKey:@"valor"];
            }
        } else  {
             NSDictionary * it = [NSDictionary dictionaryWithObjectsAndKeys:marca.text,@"marca",modelo.text,@"modelo",ano.text,@"ano",valor.text,@"valor", nil];
            [dados addObject:it];
        }
        [dados writeToFile:filePath atomically:YES];
        [self voltar:self];
    }
}

-(BOOL)validarForm {
    return true;
}

@end
