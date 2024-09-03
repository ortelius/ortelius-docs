---
title: "Custom Types"
linkTitle: "Custom Types"
weight: 90
description: >
  Adding Custom Types for _Endpoints_.
---

## Intro to _Custom Types_

_Custom Types_ are found on the _Endpoint_ Dashboard and the _Component_ Dashboard and are used to map a _Component_ to its appropriate _Endpoint_.  For example, a default _Endpoint Type_ is "Application Server."  This maps to a _Component_ defined as an "Application Server."   This mapping allows _Endpoints_ in an _Environment_ to be dynamically assigned _Components_ based the _Endpoint Type_.

_Components_ map to a single _Endpoint_, but an _Endpoint_ can map to multiple types of _Components_. For example, your _Endpoint_ could serve as both your Application Server and Database Server.

You can create your own _Endpoint Types_ for defining this mapping.

## Using the _Customize Type_ List View for Adding or Deleting

You will find _Customize Types_ from the left hand side of the Ortelius main panel.  Selecting _Customize Types_ will take you to a list of all _Custom Types_ which you have access to. You can also use the Filter bar, represented by a funnel icon, to reorder your _Custom Types__ List View based on Type and _Domain_.

The _Custom Type_ List View has the following Tabs.

| Tab         | Description                            |
|-------------|----------------------------------------|
| **Refresh** | Refreshes the browser.                 |
| **Add**     | Allows you to Add a new _Custom Type_. |
| **Delete**  | Deletes the selected item.             |

From the _Custom Type_ List View, double click on the _Custom Type_ which you would like to view to see all Details.

## Using the _Custom Type_ Dashboard for Viewing and Editing

The _Custom Type_ Dashboard view displays all information related to a specific _Custom Type_.

### _Custom Type_ Details

The following details are common to all _Custom Type_:

| Field                              | Description                                                                      |
|------------------------------------|----------------------------------------------------------------------------------|
| **Full Domain**                    | The fully qualified name of the _Domain_ to which the _Custom Type_ was defined. |
| **Name**                           | The name of your _Custom Type_.                                                  |
| **Database Roll-forward/Rollback** | Select this checkbox if your _Custom Type_ uses a database.                      |
