![](https://ci.appveyor.com/api/projects/status/t1a41j0f8eviwyx7?svg=true)
####What is it?

An [appease](http://appease.io) task template that publishes an [appease](http://appease.io) task template package

####How do I install it?

```PowerShell
Add-AppeaseTask -Name "YOUR-TASK-NAME" -TemplateId "PublishAppeaseTaskTemplate"
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
    
        # ';' separated string containing patterns of files & directories to include
        Include = '**;*.txt;some-dir'; 
        
        # optional relative path to prepend to all included files & directories
        Destination = 'rel\path\';
        
        # ';' separated string containing patterns of files & directories to exclude
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
        
        # contributors name
        Name = "Chris Dostert"
    }
)
```

#####Dependency
description: a `PSCustomObject` representing dependencies of the task template.  

schema: 
```PowerShell
[PSCustomObject]@{

    # dependency source type (only chocolatey supported for now..)
    Chocolatey = [PSCustomObject]@(
    
        [PSCustomObject]@{
        
            # chocolatey package id
            Id = 'git';
            
            # chocolatey package version
            Version = '1.9.5'
        }
    )
}
```

#####IconUrl
description: a `uri` representing a url for the icon of the task template

#####ProjectUrl
description: a `uri` representing a url for the project page of the task template

#####Tags
description: a `string[]` representing tags to associate with the task template

#####DestinationPathOrUrl
description: a `string` representing a local path or a url to publish the resulting task template to

#####ApiKey
description: a `string` representing an (NuGet Feed) api key to use

#####ProjectRootDirPath
description: a `string` representing the path to the root directory of the task template project

