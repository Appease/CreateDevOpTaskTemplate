####What is it?

A [PoshDevOps](https://github.com/PoshDevOps/PoshDevOps) task that creates one or more [PoshDevOps](https://github.com/PoshDevOps/PoshDevOps) packages

####How do I install it?

```PowerShell
Add-PoshDevOpsTask -Name "YOUR-CISTEP-NAME" -PackageId "CreatePoshDevOpsPackage"
```

####What parameters are available?

#####IncludeNuspecFilePath
A String[] representing included .nuspec file paths. Either literal or wildcard paths are supported.
```PowerShell
[String[]]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$IncludeNuspecFilePath
```

#####ExcludeFileNameLike
A String[] representing .nuspec file names to exclude. Either literal or wildcard names are supported.
```PowerShell
[String[]]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$ExcludeFileNameLike
```

#####Recurse
A Switch representing whether to recursively search directories below $IncludeNuspecFilePath.
```PowerShell
[Switch]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$Recurse
```

#####OutputDirectoryPath
A String representing the path to the directory resulting .nupkg files should be place in
```PowerShell
[String]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$OutputDirectoryPath
```
#####Version
version of the package
```PowerShell
[String]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$Version='0.0.1'
```

####What's the build status?
![](https://ci.appveyor.com/api/projects/status/374iiaqbwwdf2uyu?svg=true)

