![](https://ci.appveyor.com/api/projects/status/t1a41j0f8eviwyx7?svg=true)
####What is it?

An [appease](http://appease.io) task template that publishes an [appease](http://appease.io) task template package

####How do I install it?

```PowerShell
Add-AppeaseTask -DevOpName YOUR-DEVOP-NAME -TemplateId PublishAppeaseTaskTemplate
```

####What Parameters Are Required?

#####Id
description: a `string` representing a unique identifier for the task template.

#####Version
description: a `string` representing the [semantic version](http://semver.org/) of the task template.

#####File
description: a `PSCustomObject[]` representing the files to be packaged in the task template.  

schema: 
```PowerShell
@(
    [PSCustomObject]@{
    
        # (required) semi-colon separated patterns of files & directories to include
        Include = '**;*.txt;some-dir'; 
        
        # (optional) relative path to prepend to all included files & directories
        Destination = 'rel\path\';
        
        # (optional) semi-colon separated patterns of files & directories to exclude
        Exclude = 'some-other-dir;*.config';
    }
)
```

####What Parameters Are Optional?

#####Description
description: `string` representing a description of what the task template does.

#####Contributor
description: `PSCustomObject[]` representing the contributors of the task template.

schema:
```PowerShell
@(
    [PSCustomObject]@{
        
        # (required) contributors name
        Name = "Chris Dostert"
    }
)
```

#####Dependencies
description: a `PSCustomObject` representing dependencies of the task template.  

schema: 
```PowerShell
[PSCustomObject]@{

    # dependency type (only 'Chocolatey' supported for now)
    Chocolatey = @(
        
        # chocolatey install comand parameters
        # see: https://github.com/chocolatey/choco/wiki/CommandsInstall
        [PSCustomObject]@{
        
            # (required) chocolatey package id
            Id = 'git';
            
            # (optional) 'Source' option
            Source = 'https://chocolatey.org/api/v2/'
            
            # (optional) 'Version' option
            Version = '1.9.5'
            
            # (optional) 'InstallArguments' option
            InstallArguments = ''
            
            # (optional) 'OverrideArguments'
            OverrideArguments = $true
            
            # (optional) 'PackageParameters'
            PackageParameters = ''
            
            # (optional) 'AllowMultipleVersions'
            AllowMultipleVersions = $true
            
            # (optional) 'IgnoreDependencies'
            IgnoreDependencies = $true
        }
    )
}
```

#####IconUrl
description: a `uri` representing a url for the icon of the task template.

#####ProjectUrl
description: a `uri` representing a url for the project page of the task template.

#####Tags
description: a `string[]` representing tags to associate with the task template.

#####DestinationPathOrUrl
description: a `string` representing a local path or a url to publish the resulting task template to.  
default: the official Appease community feed (https://www.myget.org/F/appease/api/v2/)

#####ApiKey
description: a `string` representing the api key to use to authenticate against the .nupkg source being published to.

#####ProjectRootDirPath
description: a `string` representing the path to the root directory of the task template project.

