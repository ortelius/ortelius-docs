---
title: "Parallel"
linkTitle: "Parallel"
weight: 85
description: >
   Execute each statement within a block simultaneously.
---

_Parallel_ executes each statement within the block simultaneously. Waits for all the statements started as part of this parallel block to finish before continuing.

```bash
parallel {
 action1;
 action2;
 }
```

**Example**

In this example, action1 and action2 are executed simultaneously.

Sequential

Each statement within the block is executed sequentially. Within a sequential block, _DMScript_ waits for each statement to complete before executing the next. Note, this is normal Ortelius operation. Sequential is usually only needed to organize sequential blocks within a parallel option.

```bash
parallel {

sequential {
 action1;
 action2;

}

sequential {

action3;

action4;
 }

}
```

In this example, the two sequential blocks are executed in parallel. Within the first block action1 is executed first, followed by action2. Within the second block (which is executing at the same time as the first block) action3 is executed followed by action4.
