//
//  DetailViewController.m
//  AddressBookCoreData
//
//  Created by Rajarajeswaran Shanmugam on 1/30/16.
//  Copyright © 2016 janbaskclass. All rights reserved.
//

#import "DetailViewController.h"
#import <Coredata/Coredata.h>

@interface DetailViewController ()

@end

@implementation DetailViewController

-(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.contact) {
        
        [self.firstnameTextField setText:[self.contact valueForKey:@"firstname"]];
        [self.middlenameTextField setText:[self.contact valueForKey:@"middlename"]];
        [self.lastnameTextField setText:[self.contact valueForKey:@"lastname"]];
        [self.address1TextField setText:[self.contact valueForKey:@"address1"]];
        [self.address2TextField setText:[self.contact valueForKey:@"address2"]];
        [self.zipcodeTextField setText:[self.contact valueForKey:@"zipcode"]];
        [self.emailTextField setText:[self.contact valueForKey:@"email"]];
        [self.mobileTextField setText:[self.contact valueForKey:@"mobilenum"]];


    }
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

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.contact) {
        
        [self.contact setValue:self.firstnameTextField.text forKey:@"firstname"];
        [self.contact setValue:self.middlenameTextField.text forKey:@"middlename"];
        [self.contact setValue:self.lastnameTextField.text forKey:@"lastname"];
        [self.contact setValue:self.address1TextField.text forKey:@"address1"];
        [self.contact setValue:self.address2TextField.text forKey:@"address2"];
        [self.contact setValue:self.zipcodeTextField.text forKey:@"zipcode"];
        [self.contact setValue:self.emailTextField.text forKey:@"email"];
        [self.contact setValue:self.mobileTextField.text forKey:@"mobilenum"];
  
        
    } else {

    
    NSManagedObject *newcontact = [NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:context];
    [newcontact setValue:self.firstnameTextField.text forKey:@"firstname"];
    [newcontact setValue:self.middlenameTextField.text forKey:@"middlename"];
    [newcontact setValue:self.lastnameTextField.text forKey:@"lastname"];
    [newcontact setValue:self.address1TextField.text forKey:@"address1"];
    [newcontact setValue:self.address2TextField.text forKey:@"address2"];
    [newcontact setValue:self.zipcodeTextField.text forKey:@"zipcode"];
    [newcontact setValue:self.emailTextField.text forKey:@"email"];
    [newcontact setValue:self.mobileTextField.text forKey:@"mobilenum"];
    }
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't save the Contact! %@ %@",error, [error localizedDescription]);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
@end
