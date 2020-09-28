//
//  OBBEntryListTableViewController.m
//  Journal-C
//
//  Created by Owen Barrott on 9/28/20.
//  Copyright © 2020 Cameron Stuart. All rights reserved.
//

#import "OBBEntryListTableViewController.h"
#import "OBBEntryController.h"
#import "OBBEntry.h"
#import "OBBEntryDetailViewController.h"

@interface OBBEntryListTableViewController ()

@end

@implementation OBBEntryListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:true];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return OBBEntryController.shared.entries.count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    OBBEntry *entry = OBBEntryController.shared.entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        OBBEntry *entryToDelete = OBBEntryController.shared.entries[indexPath.row];
        [OBBEntryController.shared removeEntry:entryToDelete];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toDetailVC"])
    {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        OBBEntry *entry = OBBEntryController.shared.entries[indexPath.row];
        
        OBBEntryDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
}


@end
