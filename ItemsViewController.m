//
//  ItemsViewController.m
//  homePro
//
//  Created by Cui, Longxiang on 6/28/17.
//  Copyright © 2017 Cui, Longxiang. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemStore.h"
#import "Item.h"
#import "DetailViewController.h"


// MARK: - Actions

@implementation ItemsViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // If the triggered segue is the "ShowItem" segue
    if ([segue.identifier isEqualToString:@"ShowItem"]) {
        // Figure out which row was just tapped
        NSInteger row = [self.tableView indexPathForSelectedRow].row;
        // Get the item at that row and pass it along
        // to the segue's destination view controller
        Item *item = self.itemStore.allItems[row];
        DetailViewController *dvc = (DetailViewController *)segue.destinationViewController;
        dvc.item = item;
    }
}

- (IBAction)addNewItem:(id)sender {
    
    // Make a new index path for the 0th section, last row
    // Create a new item and add it to the store
    Item *newItem = [self.itemStore createItem];
    // Figure out where that item is in the array
    NSUInteger itemIndex = [self.itemStore.allItems indexOfObject:newItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:itemIndex inSection:0];
    
    // Insert this row into the table
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];

}
- (IBAction)toggleEditingMode:(id)sender {
    
    // If you are currently in editing mode...
    if (self.editing) {
        // Change the text of the button to inform the user
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        // Turn off editing mode
        [self setEditing:NO animated:YES];
    } else {
        // Change the text of the button to inform the user
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        // Turn on editing mode
        [self setEditing:YES animated:YES];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Get the height of the status bar
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    UIEdgeInsets insets = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
}

// MARK: - Table View Data Source and Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemStore.allItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Create an instance of UITableViewCell, with default appearance
    // Get a new or recycled cell
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                                 forIndexPath:indexPath];
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    Item *item = self.itemStore.allItems[indexPath.row];
    // Configure the cell with the item's properties
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%d", item.valueInDollars];
    return cell;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    // If the table view is asking to commit a delete command...
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Item *item = self.itemStore.allItems[indexPath.row];
        
        NSString *title = [NSString stringWithFormat:@"Delete %@?", item.name];
        NSString *message = @"Are you sure that you want to delete this item?";
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:title
                                                                    message:message
                                                             preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                               style:UIAlertActionStyleCancel
                                                             handler:nil];
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"Delete"
                                                               style:UIAlertActionStyleDestructive
                                                             handler:^(UIAlertAction * _Nonnull action) {
                               }];
        [ac addAction:cancelAction];
        [ac addAction:deleteAction];
        
        // Present the View Controller
        [self presentViewController:ac animated:YES completion:nil];
    }
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath {
    [self.itemStore moveItemAtIndex:sourceIndexPath.row
                            toIndex:destinationIndexPath.row];
}

@end
