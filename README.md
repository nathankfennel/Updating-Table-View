# Updating-Table-View
An example of a reusable table view that allows for updating individual rows without reloading the entire table view.

This was cleaner than trying to build a project around Gloo Table View to be able to test.
The Reusable Table View (RTV) is VERY similar to Gloo Table View.
I did include a few more types of rows that aren't needed. Most notably is the Text Field cell type. This uses blocks to handle text without the need for delegation chains.

To use this app, build it and then click on any cell.
The model automatically generates between 30 and 1000 rows of dates. 

(search for the number as a comment in the project to find where each of these things happen. e.g. `// 1.`)

Here's the chain that happens when a user clicks on any row:
1. The "Selection Block" is called on the model representing that row
2. The model representing that row is updated to a new date sometime in the future.
3. The Model Controller updates the current model to reflect the changed model.
4. The RTV Model held by the model controller is updated.
5. The Model Controller's delegate is called notifying the delegate that the model in the model controller has been updated.
6. The Table View's Model is updated with the RTVModel from the model controller.
7. All cells are registered with the table view.
8. The old RTVModel and the new RTVModel are diffed to find the index paths that changed.
9. If the number of sections in the model has changed, the table view has `reloadData()` called on it.
10. If any section has a different number of rows on it, then the table view has `reloadData()` called on it.
11. The table view reloads the index paths that have changed.
