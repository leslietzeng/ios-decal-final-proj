# Pocket Shop

## Authors
* Jimmy Huang
* Leslie Tzeng
* Justin Kim
* Daniel Guan

## Purpose
This application brings the best of online shopping to traditional shopping for those who prefer to physically inspect their items before purchase. The core purposes of our app allows users to skip long and time consuming check-out lines, decreases labor costs associated with store staff, and eliminates ambiguous prices and searching for price check stations (users know exactly how much their items are including tax).

## Features
* Add Item Using Phone Camera Barcode Scanner
* Display Shopping Cart that includes the Qty, Price, and Item Title for each item.
* Delete Item
* Current Shopping Trip’s Running Total
* Checkout and Pay using Credit Card

## Control Flow
* Please see the following link for our visual interpretation of our application: bit.ly/2e3XM2A
* Users are initially presented with a splash screen, where they can log in or sign in. When creating a new account, the user would need to input their credit card information. 
* Once done, users would confirm the store that they are shopping at via a user inputted address to match the store’s inventory database (or GPS to locate store - extra feature)
* Users can then add items by scanning the barcode on each item. Each scanned item will be followed with a confirmation of the item and price. 
* The app will then update the running total of all items and allows users to delete an item they don’t want anymore
* Finally users can checkout anywhere in the store and skip the lines!

## Implementation

### Model
* User.swift - Includes parameters such as Username, Password, Current Receipt, Receipts (array of Receipts Objects - optional)
* Receipt.swift - Array of ItemInfo
** ItemInfo consists of parameters such as Quantity, Item Name, Barcode, Price Per Item

### View
* Please see our View Layouts: bit.ly/2e3XM2A
### Controller
* Our plan is to have a separate view controller for each view. This is to avoid a lengthy and confusing masterer view controller similar to the calculator homework
* We also plan to implement an overarching navigation controller that will deal with the transitions between each of our views. 

