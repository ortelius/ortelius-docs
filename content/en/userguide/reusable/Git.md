## Git _Repository_ Details

You can pull files from a Git Repository to be used by your _Components_.  The following details are required for defining your Git Repository connection.

| Field | Description |
| --- | --- |
|**Git Repo** | URL to the Git Repo. |
|**Git Repo Encrypted** | Select the box to indicate the Git Repo should be hidden in the database.|
|**Git Repo Override** |Select the box if the Git Repo can be replaced at the _Component_ definition.|
|**Git Commit**| Git Commit to be checked out. |
|**Git Commit Encrypted** | Select the box to indicate the Git Commit should be hidden in the database.|
|**Git Commit Override** |Select the box if the Git Commit can be replaced at the _Component_ definition.|
|**To Dir** | Directory where the files will be checked out to. |
|**To Dir Encrypted** | Select the box to indicate the To Dir should be hidden in the database.|
|**To Dir Override** |Select the box if the To Dir can be replaced at the _Component_ definition.|
| **Filepath**|  The fully qualified directory name to the files that will need to be deployed. These files must be on a file system that the Ortelius deployment engine has access to. |
| **Filepath Encrypted** | Select the box to indicate the Filepath name should be hidden in the database.|
| **Filepath Override** | Select the box if the Filepath can be replaced at the _Component_ definition. |  
|**Pattern** | This defines the file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war. |
|**Pattern Encrypted** | Select the box to indicate the Pattern should be hidden in the database.|
|**Pattern Override** |Select the box if the Pattern can be replaced at the _Component_ definition.|
|**Recursive**| Select the box in order to cause the _Repository_ to return all of the files from directories below those designated by Filepath. |
|**Recursive Override** |Select the box if the Recursive option can be replaced at the _Component_ definition.|
