---
title: "Managing Data Sources"
linkTitle: "Managing Data Sources"
weight: 20
description: >
  Managing Data Sources such as ODBC connections.
---
## Intro to Data Sources

_Data Sources_ are used to connect to Jira, Bugzilla, and GitHub to track change request and LDAP and Active Directory for single sign-on. You will need to define a _Credential_ for these _Data Sources_ in order to login. See [Create Your Credentials](/userguide/first-steps/2-define-your-credentials/) for more information on defining a _Credential_ for your _Data Source_.

## The _Data Sources_ List View for Adding or Deleting

You will find _Data Sources_ under the Setup menu.  Selecting _Data Sources_ will take you to a list of all _DataSources_ which you have access to. You can also use the Filter bar, represented by a funnel icon, to reorder your _Data Sources_ List View.  You can filter the list view on _Data Sources_ and _Domains_. _Data Sources_ are defined to a _Domain_ and will be displayed based on your access to the _Domain_.

The _Data Sources_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _Data Sources_ of the following types: <ul><li>Jira</li><li>Bugzilla</li><li>GitHub Issues</li><li>LDAP</li><li>Active Directory</li></ul>|
| Delete | Deletes the selected item. |

From the _Data Source_ List View, double click on the _Data Source_ which you would like to view to see all Details.  

## Using the _Data Sources_ Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Data Source_.

### Common Details of all _Data Sources_

The following details are common to all _Data Sources_ types:

| Field | Description |
| --- | --- |
|**Full Domain**| The fully qualified name of the _Domain_ to which the _Data Source_ was defined. |
|**Name**| The Name of the _Data Source_. |
|**Type**| The _Data Sources_ Type chosen when you performed the Add. |
|**Owner Type**| User or Group. |
|**Owner**| Name of the Owner. |
|**Summary**| A description of the _Data Source_.|
|**Created**| Auto generated date when the _Data Source_ was added.|
|**Modified**| Auto generated date when the _Data Source_ was updated.|
|**Credential**| The _Credential_ used to access the _Repository_ if required. |

## Change Request _Data Sources_

Ortelius supports GitHub, Jira and Bugzilla for tracking change request to _Applications_ and _Components_. For a complete description of the integration see [Tracking Jira, Bugzilla and GitHub Issues](/userguide/integrations/jira-bugzilla-and-git-issues/ ).

### GitHub _Data Source_ Details

This _Data Source_ allows you to connect to GitHub to retrieve GitHub issues associated to your _Components_ or _Applications_. You will need to define a unique _Data Source_ for each repository that needs to be connected to your _Components_ or _Applications_.

| Field | Description |
| --- | --- |
|**Poll Interval**| The time frequency of how often Ortelius should look for Git issues in seconds, i.e. 60. |
|**Poll Interval Encrypted**| Select the box to indicate the Poll Interval should be hidden in the database.|
|**Poll Interval Override**|Select the box if the Poll Interval can be changed.|
|**Organization**| The full URL to the Git [Organization](https://help.github.com/en/github/setting-up-and-managing-organizations-and-teams/about-organizations). |
|**Organization Encrypted**| Select the box to indicate the Organization name should be hidden in the database.|
|**Organization Override**| Select the box if the Organization can be changed. |  
|**Repository**| The name of the [Git Repository](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/about-repositories) underneath the Git Organization. |
|**Repository Encrypted**| Select the box to indicate the Git Repository should be hidden in the database.|
|**Repository Override**|Select the box if the Git Repository can be changed.|

### Jira _Data Source_ Details

This _Data Source_ allows you to connect to Jira to retrieve Jira issues associated to your _Components_ or _Applications_. You will need to define a unique _Data Source_ for each Project Key that needs to be connected to your _Components_ or _Applications_.

| Field | Description |
| --- | --- |
|**Filter**| Enter the [Jira Status](https://confluence.atlassian.com/adminjiraserver/defining-status-field-values-938847108.html) you want to use as your filter.  |
|**Filter Encrypted**| Select the box to indicate the Filter name should be hidden in the database. |
|**Filter Override**| Select the box to indicate the Filter name can be changed. |
|**Poll Interval** | The time frequency of how often Ortelius should look for Jira issues in seconds, i.e. 60.|
|**Poll Interval Encrypted**| Select the box to indicate the Poll Interval should be hidden in the database.|
|**Poll Interval Override**|Select the box if the Poll Interval can be changed.|
|**Project Key**| The [The Jira Project Key](https://support.atlassian.com/jira-software-cloud/docs/what-is-a-jira-software-project/) within the Jira Server. |
|**Project Key Encrypted**| Select the box to indicate the Project name should be hidden in the database.|
|**Project Key Override**| Select the box if the Project can be changed. |  
|**Server**| The fully qualified URL to the Jira Server so Ortelius can get access. |
|**Server Encrypted**| Select the box to indicate the Jira Server should be hidden in the database.|
|**Server Override**|Select the box if the Jira Server can be changed.|

### Bugzilla _Data Source_ Details

This _Data Source_ allows you to connect to Bugzilla to retrieve Bugzilla issues associated to your _Components_ or _Applications_. You will need to define a unique _Data Source_ for each Product that needs to be connected to your _Components_ or _Applications_.

| Field | Description |
| --- | --- |
|**Component** | The name of the [Bugzilla Component](https://bugzilla.readthedocs.io/en/latest/api/core/v1/bug.html#search-bugs). |
|**Component Encrypted** | Select the box to indicate the Bugzilla Component should be hidden in the database.|
|**Component Override** |Select the box if the Bugzilla Component can be changed.|
|**Poll Interval** | The time frequency of how often Ortelius should look for Bugzilla issues in seconds, i.e. 60.  |
|**Poll Interval Encrypted** | Select the box to indicate the Poll Interval should be hidden in the database.|
|**Poll Interval Override** |Select the box if the Poll Interval can be changed.|
|**Product**| The full URL to the [Bugzilla Product](https://bugzilla.readthedocs.io/en/latest/administering/categorization.html). |
|**Product Encrypted** | Select the box to indicate the Product name should be hidden in the database.|
|**Product Override** | Select the box if the Product can be changed. |  
|**Server** | The fully qualified URL to the Bugzilla Server so Ortelius can get access. |
|**Server Encrypted** | Select the box to indicate the Server should be hidden in the database.|
|**Server Override** |Select the box if the Server can be changed.|
|**Status**| The [Bugzilla Status](https://bugzilla.readthedocs.io/en/latest/using/understanding.html?highlight=what%20is%20a%20status) you want to use as your Filter. |
|**Status Encrypted**| Select the box to indicate the Status should be hidden in the database. |
|**Status Override**| Select the box if the Status can be changed. |

{{% include "userguide/reusable/LDAP-DataSource.md" %}}

## _Data Source_ Access Controls

The Access Section allows _Users_ within designated _Groups_ to update the _Data Source_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Data Source_ in the following ways:

| Access | Description |
| --- | --- |
| **View** | Allows _Users_ to see the _Data Source_. If the _User_ does not belong to a _Group_ in the View Access list, the _Data Source_ will not appear in the List View. |
| **Change** | This allows a _User_ who belongs to any _User_ _Group_ in the list to change the attributes of the _Data Source_. |
| **Select** | Allows _Users_ to use the _Data Source_ to access external data. |
| **Delete** | Allows the _User_ to remove the _Data Source_.|

NOTE: **Ortelius** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your UserGroups, you will need to upgrade to **DeployHub Pro.**
