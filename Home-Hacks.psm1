
$ModuleFunctions = @(Get-ChildItem -Path $PSScriptRoot\*.ps1 -ErrorAction SilentlyContinue)
$ToExport = $ModuleFunctions.BaseName

foreach ($import in $ModuleFunctions) {
    try {
        Write-Verbose "Importing $($import.FullName)"
        . $import.FullName
    } catch {
        Write-Error "Failed to import function $($import.FullName): $_"
    }
}

Export-ModuleMember -Function $ToExport