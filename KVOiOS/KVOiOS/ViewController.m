//
//  ViewController.m
//  KVOiOS
//
//  Created by Tharzeez on 7/25/17.
//  Copyright © 2017 tharzeez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

 static void *child1Context =&child1Context;
static void *child1childContext =&child1childContext;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.child1 =[[Children alloc]init];
    NSLog(@"%@",self.child1.name);
  
    [self.child1 setValue:@23 forKey:@"age"];
    
   // self.child1.name=@"mohammed";
    
    NSLog(@" pointer %p",child1Context);
    
    NSLog(@"%@.... age is %ld", [self.child1 valueForKey:@"name"], [[self.child1 valueForKey:@"age"]integerValue]  );
    
    self.child1.child=[[Children alloc]init];
    [self.child1.child setValue:@"John" forKey:@"name"];
    [self.child1.child setValue:@15 forKey:@"age"];
    NSLog(@"%@.... age is %ld", [self.child1.child valueForKey:@"name"], [[self.child1.child valueForKey:@"age"]integerValue]  );
    
    
    
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.child1 addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:child1Context];
    [self.child1 addObserver:self forKeyPath:@"age" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:child1Context];
    [self.child1.child addObserver:self forKeyPath:@"age" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:child1childContext];
    
      [self.child1 setValue:@"Johanson" forKey:@"name"];
    self.child1.name=@"Mohammed";
    self.child1.age=@32;
    [self.child1 setValue:@"LalJose" forKey:@"name"];
    [self.child1 setValue:@13 forKey:@"age"];
    [self.child1.child setValue:@21 forKey:@"age"];
    
    [self.child1 changeName:@"Lalettan" withAge:@42];

}



-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if(context == child1Context){
        
        NSLog(@"Child 1 is changed");
        if(   [keyPath isEqualToString:@"name"]    ){
            NSLog(@"The name is changed");
            NSLog(@"The name is %@",change);
            
        }
        if( [keyPath isEqualToString:@"age"]   ){
            NSLog(@"The age is changed");
            NSLog(@"The age is %@",change);
        }

    }else if(context ==child1childContext){
        NSLog(@"Child 1's child is changed");
        if(   [keyPath isEqualToString:@"name"]    ){
            NSLog(@"The name is changed");
            NSLog(@"The name is %@",change);
            
        }
        if( [keyPath isEqualToString:@"age"]   ){
            NSLog(@"The age is changed");
            NSLog(@"The age is %@",change);
        }
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(id)sender {
    
    [self performSegueWithIdentifier:@"ShowSecond" sender:nil];
    
    
    
    
    
}




@end
