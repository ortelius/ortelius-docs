**_Component_ Predecessor**

Only returned for _Component Versions_. A JSON Object represents the predecessor of this _Component_.

| Name     | Type                | Description                                                                    | Required |
|----------|---------------------|--------------------------------------------------------------------------------|----------|
| id       | integer             | Is the internal _Component_ ID.                                                | No       |
| name     | string              | Is the name of the predecessor _Component._                                    | No       |
| summary  | string              | Is the summary text associated with the predecessor _Component._               | No       |
| versions | _Component Version_ | A JSON Object representing the parent _Component Version_ of this _Component_. | No       |
