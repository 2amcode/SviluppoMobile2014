//
//  AMViewController.m
//  Lezione1_a
//
//  Created by Andrea Maschio on 02/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import "AMViewController.h"  //-> importo il file header
#import "NSString+Additions.h"

@interface AMViewController () //-> utile per ridichiarare l’interfaccia con eventuali campi (ivar) privati

@end

@implementation AMViewController //-> inizia l’implementazione della classe
@synthesize value = _value; //-> sintetizzo la property. Questo genera gli accessor e non è più richiesto recentemente

- (void)viewDidLoad //metodo chiamato quando la vista "è stata" caricata, notare "did"
{
    [super viewDidLoad];
    AMViewDidAppearDelegate * del = [[AMViewDidAppearDelegate alloc]init];
    self.delegate = del;
    //entrambi validi
    self.value = @"Hello, world!";
    
    [self setValue:@"Hello again, world!"];
    
    NSString __unused * value1 = self.value;
    
    NSString __unused * value2 = [self value];
    
    //Categories
    NSString * test= @"Stringa%20con%20spazi";
    NSLog(@"%@", [test escapedString]);
	
}
-(void)viewWillAppear:(BOOL)animated{ //metodo chiamato quando la vista "sta per" apparire, notare "will"
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{ //metodo chiamato quando la vista "è appena" apparsa, notare "did"
    [super viewDidAppear:animated];
    if([self.delegate respondsToSelector:@selector(viewHasBeenLoaded:)]){
        [self.delegate performSelector:@selector(viewHasBeenLoaded:) withObject:self.view];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // metodo chiamato quando iOs "reclama memoria"
}

-(void)setValue:(NSString*)value{
    //imposto la “ivar”
    _value = value;
    //eseguo altro codice
}

-(NSString*)value:(NSString*)value{
    //Eseguo altro codice
    //Restituisco la ivar
    return _value;
}

@end