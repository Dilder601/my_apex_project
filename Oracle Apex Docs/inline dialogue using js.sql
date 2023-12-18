create buttoon :

Define Region Template: Inline Dialogue

Set Region Static Id: "region_id"

Solution 1:-
Change button Behavior, Action=> Redirect to URL and Target: 

set this code;

javascript:openModel('region_id');

Create dynamic action on the button:

Event=>click.
selection type=>button
Action=> Execute JavaScript Code

Copy and Paste below code on Execute JavaScript Code:
openModel('region_id');


Solution 2:-
Copy and paste the following code on Execute JavaScript code and also define affected elements in this solution as per the screenshot.
COPY CODE
$(this.affectedElements).dialog('open')



Solution 3:-
Copy and Paste the below function on the function and global variable declaration section:
COPY CODE
function open_dialog(){
 $('#region_id').dialog('open'); //calling region id here to open
}



Call created function in dynamic action as per screenshot:
open_dialog();