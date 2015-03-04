# halt immediately on any errors which occur in this module
$ErrorActionPreference = 'Stop'

function Invoke-CIStep(

[String]
[ValidateNotNullOrEmpty()]
[Parameter(
    Mandatory=$true,
    ValueFromPipelineByPropertyName=$true)]
$PoshCIProjectRootDirPath,

[String[]]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$IncludeNuspecFilePath,

[String[]]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$ExcludeFileNameLike,

[Switch]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$Recurse,

[String]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$OutputDirectoryPath,

[String]
[Parameter(
    ValueFromPipelineByPropertyName = $true)]
$Version='0.0.1'){
    
    # default to recursively picking up any .nuspec files below the project root directory path
    if(!$IncludeNuspecFilePath){

        $NuspecFilePaths = gci -Path $PoshCIProjectRootDirPath  -File -Recurse -Filter '*.nuspec' | %{$_.FullName}
    
    }
    else{
        
        $NuspecFilePaths += gci -File -Path $IncludeNuspecFilePath -Exclude $ExcludeFileNameLike -Recurse:$Recurse -Filter "*.nuspec" | %{$_.FullName}
               
    }

    
    $nugetExecutable = 'nuget'

    foreach($nuspecFilePath in $NuspecFilePaths)
    {
        $nugetParameters = @('pack',$nuspecFilePath,'-Version',$Version)

        if($OutputDirectoryPath){
            $nugetParameters = $nugetParameters + @('-OutputDirectory',$OutputDirectoryPath)
        }

Write-Debug `
@"
Invoking nuget:
& $nugetExecutable $($nugetParameters|Out-String)
"@
        & $nugetExecutable $nugetParameters

        # handle errors
        if ($LastExitCode -ne 0) {
            throw $Error
        }
    }

}

Export-ModuleMember -Function Invoke-CIStep
