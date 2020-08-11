## OpenMake Meister _Repository_ Details

If you automate your builds (compile/link) using OpenMake Meister, Ortelius pulls binaries from the Meister binary repository that your _Component_ uses. Following is a list of the details for connecting a Meister repository to Ortelius:

| Field | Description |
| --- | --- |
| **Buildnumber**| The identifier of the Build that resides in the Meister _Repository_.|
| **Buildnumber Encrypted**| Select the box to indicate if the Build Number should be hidden in the database.|
| **Buildnumber Override**| Select the box if the Build Number can be replaced at the _Component_ definition. |
| **Filepath**|  The fully qualified directory name to the files in the OpenMake Meister repository that will need to be deployed. |
| **Filepath Encrypted** | Select the box to indicate if the Filepath name should be hidden in the database.|
| **Filepath Override** | Select the box if the Filepath can be replaced at the _Component_ definition. |
|**Pattern** | This defines the file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war. |
|**Pattern Encrypted** | Select the box to indicate if the Pattern should be hidden in the database.|
|**Pattern Override** |Select the box if the Pattern can be replaced at the _Component_ definition.|
|**Recursive**| Select the box in order to cause the _Repository_ to return all of the files from directories below those designated by Filepath. |
|**Recursive Override** |Select the box if the Recursive option can be replaced at the _Component_ definition.|
