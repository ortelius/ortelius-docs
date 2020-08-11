---
title: "Procedures and Functions"
linkTitle: "Procedures and Functions"
weight: 34
description: >
  Customizing your Deployment _Actions_ with _Functions_ and _Procedures_.
---
## Functions and Procedures

_Functions_ and _Procedures_ are the steps that make up an _Action_. If you have not worked with _Actions_, read about them in them in the [Customize your Actions Chapter](/userguide/customizations/2-define-your-actions/).

_Functions_ and _Procedures_ are used by _Actions_ to define custom installation logic of a _Component_ or perform any type of Pre or Post Action. Using _Actions_, _Functions_ and _Procedures_ allows you to be as creative as needed to meet the unique needs of your implementation.

The difference between _Functions_ and _Procedures_ is a _Procedure_ execute a process but does not return a value. A _Function_ returns a value. DeployHub Provides a Dashboard for customizing your _Functions_ and _Procedures_ including the creation of Parameters, and a Parameters Dialog box that is displayed at the _Action_ level. The Parameters Dialog Box enables other _Users_ to utilize your custom process, with an easy way to understand what Parameter options are available. In this way, you are able to create custom _Functions_ and _Procedures_ and share them across teams.  The associated Parameters Dialog Box simplifies the use of your custom process.

_Functions_ and _Procedures_ can be:

| _Function_ or _Procedure_ Type | Description |
| --- | --- |
| **DMScript in Database** | A _Function_ or _Procedure_ is written in DMScript and stored in the Ortelius Database (a "Stored Procedure"). |
| **Local Script** | A _Function_ or _Procedure_ is written in any Scripting Language that can be executed by the operating system on which the Ortelius Deployment Engine is installed. Executes locally to the Deployment Engine. |
| **Endpoint Script** | A _Function_ or _Procedure_ is written in any Scripting Language that can be executed by the target _Endpoint's_ operating system. Executes on the target _Endpoint._ By Checking the "Copy to Remote" flag, the script can be held locally to the Deployment Engine and copied to the target _Endpoint_ at the point of execution. |

## The _Functions_ and _Procedures_ List View for Adding or Deleting

From the _Functions_ and _Procedures_ menu option to the left of the Ortelius main panel, you will be taken to a list of all available _Functions_ and _Procedures_ which you have access to based on the _Domain_. You can also use the Filter bar, represented by a funnel icon, to reorder your _Functions_ and _Procedures_ List View.  You can filter on:

- Domain
- Name
- Type (_Function_ or _Procedure_)

The _Function_ or _Procedure_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|**Refresh** | Refreshes the browser. |
| **Add Procedure** | Allows you to Add a new _Procedure_. <ul><li>DMScript in Database</li><li>Local Script</li><li>Endpoint Script</li></ul>|
| **Add Function** | Allows you to Add a new _Function_ with the types: <ul><li>DMScript in Database</li><li>Local Script</li><li>Endpoint Script</li></ul> |
| **Delete** | Deletes the selected item. |
| **Export** | Allows you to Export an existing _Function_ or _Procedure_. Used to transfer _Functions_ and _Procedures_ between Ortelius installations, and allows you to check them into a source repository.|
| **Import** | Takes a previously exported _Function_ or _Procedure_ and re-imports it. Will maintain the original _Function_ or _Procedure_ name regardless of the name of the import file (.re). To change the Name of the _Function_ or _Procedure_, update the "action name="[new name]" inside the .re file that was exported. Duplicate names are allowed as long as they are defined using a different _Domain_.|

From the _Functions_ and _Procedures_ List View, double click on the _Functions_ or _Procedures_ to view to see all Details.

## Using the _Function_ or _Procedure_ Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Function_ or _Procedure_. The following details are common to all Types.

| Details | Description |
| --- | --- |
|**Full Domain** | The fully qualified _Domain_ to which the _Function_ or _Procedure_ belongs. |
|**Name** | A unique Name that identifies the _Function_ or _Procedure_ |
|**Summary** | A brief description of what the _Function_ or _Procedure_ does. |
|**Category** | Categories are used to arrange _Function_ or _Procedure_ in an orderly manner. Assigning a Category to an _Function_ or _Procedure_ allows lists of Categories to be used throughout Ortelius. Clicking on an individual Category expands the list and shows all _Function_ or _Procedure_ that belong to that Category. You can add a new Category by simply adding it to the list using the entry field. Pre-defined Categories include: <li>Build - _Actions_, _Functions_ and _Procedures_ for calling ANT (SalesForce integration).</li><li>Database - _Actions_, _Functions_ and _Procedures_ for database updates.</li><li>Deploy-_Actions_, _Functions_ and _Procedures_ for Deployments.</li><li>Dropzone- _Actions_, _Functions_ and _Procedures_ for interacting with the Dropzone.</li><li>File Logic-_Actions_, _Functions_ and _Procedures_ related to File manipulation.</li><li>Flow Logic-_Actions_, _Functions_ and _Procedures_ for if then else in DMScrit.</li><li>Loops-_Actions_, _Functions_ and _Procedures_for file looping.</li><li>General-Non-categorized Objects (default).</li><li>WebLogic-_Actions_, _Functions_ and _Procedures_ for deploying to WebLogic.</li><li>WebSphere-_Actions_, _Functions_ and _Procedures_ for deploying to WebSphere.</li><li>Windows-_Actions, Functions_ and _Procedures_ used for Windows deployments.</li> |
|**Owner Type** | User or Group |
|**Owner** | The _User_ or _Group_ name of the _Function_ or _Procedure's_ owner. The default owner is the _User_ who created the _Function_ or _Procedure_. |
|**Created** | An auto generated date when the _Function_ or _Procedure_ was created (read-only). |
|**Modified** | An auto generated date when the _Function_ or _Procedure_ was last modified (read-only). |
|**Object** | Displays if the item is _Function_ or _Procedure_.
|**Type**| Displays the kind of the _Function_ or _Procedure_ created when added.|
|**Display Name**| An alternative Name if required.  If not used defaults to the "Name".|

**Additional Details for _Local_ Scripts**

This type of _Function_ or _Procedure_ runs on the deployment engine and requires these additional details.

| Details | Description |
| --- | --- |
| **Filepath** | The filepath to the script to be executed, which includes the name of the script. |
|**Command Line Interpreter**| Your _Function_ or _Procedure_ will be written using a particular language such as Python.  This field in the fully qualified path and name of your interpreter.  Ortelius will need this to execute your process.|
|**Result is Expr** | Result is Expression is used for return values for _Functions_ only. This will not be displayed for _Procedures_ as they do not return a value.  If this box is checked, the return value from the _Function_ is interpreted as DMScript.  For example, the "listservices" _Function_ which returns a list of services on a Windows _Endpoint_ returns the list into an array using this option. |

**Additional Details for _Endpoint_ Scripts**

This type of _Function_ or _Procedure_ runs on the _Endpoint_ and requires these additional details.

| Details | Description |
| --- | --- |
| **Filepath** | The filepath to the script to be executed, which includes the name of the script. |
|**Command Line Interpreter**| Your _Function_ or _Procedure_ will be written using a particular language such as Python.  This field in the fully qualified path and name of your interpreter.  Ortelius will need this to execute your process.|
| **Allocate Terminal** | If checked, this sets up a pseudo-terminal. This is for Unix/Linux targets only when operating over SFTP transfer protocol. It controls the behavior of executed programs if they operate differently with or without an allocated terminal. Note that any program running with this flag set and which calls _isatty_ will receive a return code of _true_. |
|**Result is Expr** | Result is Expression is used for return values for _Functions._ If this box is checked, the return value from the _Function_ is interpreted as DMScript.  For example, the "listservices" _Function_ which returns a list of services on a Windows _Endpoint_ returns the list into an array using this option. |
|**Copy to Remote** | A checkbox that causes Ortelius to copy the script from the directory indicated by the filepath field on the deployment engine to the target _Endpoint_. The script is then executed there. |

### Access

The Access Section allows _Users_ within designated _Groups_ to update the _Function_ or _Procedure_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Function_ or _Procedure_ in the following ways:

| Access | Description |
| --- | --- |
|**View**| Allows _Users_ to see the _Function_ or _Procedure_. If the _User_ does not belong to a _Group_ in the View Access list, the _Function_ or _Procedure_ will not appear in the List View. |
|**Change**| Allows _User_ to change the _Function_ or _Procedure_ characteristics i.e. Name, Summary, etc. |
|**Execute**| Allows _Users_ to execute this _Function_ or _Procedure_. |

{{% include "userguide/reusable/AuditTrail.md" %}}

### Input Parameters – and Command Line Switches for your Custom _Function_ or _Procedures_

When you create your _Function_ or _Procedure_ it will most likely need parameters. This section allows you to define the format of the parameters and display them in the _Action_ blueprint designer. When your _Function_ or _Procedure_ is added to the _Action_ blueprint designer, a Parameter Dialog Box will be automatically displayed prompting the user to enter the required values. A right mouse click on the same will open the Parameter Dialog Box. The Input Parameters, Command Line Switches and the Command Line Section work together to define how the command line call will be formatted.  You will establish how your user will enter parameter values when they use your custom _Function_ or _Procedure_ through the use of the Parameter Dialog Box. For _Functions_ and _Procedures_ that are of the Type "DM Script in Database", you will not see Command Line Switches Section or a Command Line Section. Instead you will be provided with an embedded editor for creating the DMScript that will be saved in the Database.

- The Input Parameters Section defines how the dialog box is layed out and how the flags will be passed to the command line.
- The Command Line Switches Section provides a table of parameter switches that can be used to construct the command line call.
- The Command Line Section builds out what your command line call will look like using drog and drop of the Input Parameters and Switches.

**Input Parameters Section**

This section has two purposes. First to define the fields that will be presented on the Parameters Dialog box as a checkbox or entry field.  Secondly, it defines the parameters being passed to the command line by the _Function_ or _Procedure_.

A list of parameters can be made available for the user of your  _Function_ or _Procedure_ from the _Actions_ blueprint designer. To create a new parameter, Use the +Add option.  A new row in the table will be made available where you can then define the following parameter attributes:

|Attribute| Description|
|---|---|
|**Name** | The name of the input parameter. It can only have the characters A-Z, 0-8, and "_". |
|**Type**| This defines if the input parameter can be entered as text, or as a checkbox. This field will be displayed on the dialog box used to edit the values for the Procedure or Function on the _Action_ blueprint designer.|
|**Format**| This field defines what your Parameters Dialog Box will look like. <ul><li>Entry Field - Using the "entry" option will allow your user to enter the required value and not worry about any flags that are needed for the command line.  In this field you will enter the flags that should be used for the command line. The end user will enter the value that they require and it will be pre-pended with the flag defined on this screen. The result will be used for the command line call. For example, if you enter -f in this field and then your user enters "filename" as a value, the resulting parameter passed to the command line will be "–f filename". </li><li>If your type is set to "checkbox," this will give the user the option to select the value or not for the command line call. In this case, you are defining the value and flags and simply giving the user the option to use them or not.</li></ul> |
|**Missing**|This field provides a default if the above Format value is null. Like the Format value, it uses Entry and Checkbox types. <ul><li>Using the "entry" option will provide a default value for when the Format is not entered. </li><li>If your type is set to "checkbox," this will provide a value when the Format checkbox is not selected by the user. </li></ul>
|**Padding**| This field is used for positional command line parameters where you need to provide quote, space, quote (" ") for a positional parameter that is not entered by the user. This prevents the command line from throwing and error.
|**Required**|Indicates the argument is required for the Procedure/Function. Any parameter marked as being "Required" is highlighted and cannot be left blank.
|**Pos**| This is used only when calling the _Function_ or _Procedure_ from DMScript. The Position orders the parameters when making the call in DMScript.

**Command Line Switches**

The Section allows for the creation of "fixed" command line switches or other attributes that you wish to have present on the generated Command Line. These can be created by clicking on the plus +Add option to add a new switch. You must use Save to commit the new row to the table.  When you add Parameters and Switches, they are placed in a "pallet" above the Command Line Section. To remove or update an item, check the item and use Delete or Edit options.

Each "Command Line Switch" can include variables which will be expanded when the Command Line is constructed and executed. These variables can be attributes stored against a Ortelius Object (such as _Endpoint, Environment, Application,_ or _Component_) or can be Global Variables.

**Command Line**

You can drag and drop the items from the "pallet" of Switches in the correct order on your Command Line. The result displays how the Command Line has been constructed.

**DMScript in Database Editor**

The embedded editor includes:

- The Floppy Disk Icon is the "Save" button. This parses the DMScript for errors and, if none are found, saves the DMScript. If there any syntax errors, they are highlighted in the body of the text.
- The Binoculars Icon is the "Search" button. Clicking this icon opens a search/replace dialog.
- The Arrow Icon is a "go to line" button. Clicking the icon opens a dialog which allows a line number to be entered and moves the cursor to that line.
- The undo and redo Icons are for recent edits.
- Font Size Icon makes the text bigger or smaller as needed.
- The Paintbrush Icon switches the syntax icon on and off.
- The Eraser Icon resets the syntax highlighting and causes the editor to re-parse and re-highlight the entered text.
- The Paragraph Marker Icon switches on word wrapping.

## Archiving _Functions_ and _Procedures_

Automatic archives are created for all _Functions_ or _Procedures_ that are in use by an _Action_.  If you change a _Function_ or _Procedure_ the archive will be displayed in the List View for reference. Every time the _Function_ or _Procedure_ is changed, it will be archived in the List View and appear with the name followed by an incremented number ('_archived\_1', '_archived\_2', etc.).
