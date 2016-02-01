//
//  DetailViewController.h
//  AddressBookCoreData
//
//  Created by Rajarajeswaran Shanmugam on 1/30/16.
//  Copyright © 2016 janbaskclass. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface DetailViewController : UIViewController
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *firstnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *middlenameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *address1TextField;
@property (strong, nonatomic) IBOutlet UITextField *address2TextField;
@property (strong, nonatomic) IBOutlet UITextField *zipcodeTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *mobileTextField;

@property (strong, nonatomic)NSManagedObject *contact;

@end
