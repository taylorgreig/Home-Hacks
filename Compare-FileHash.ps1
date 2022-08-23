# ps-hash-compare.ps1
function Compare-FileHash {
    <#
    .SYNOPSIS
    Get and compare the hash of a file to a provided official hash.
    
    .PARAMETER FilePath
    [string] Path of the file.
    
    .PARAMETER OfficialHash
    [string] The officially provided file hash.
    
    .EXAMPLE
    Compare-FileHash -FilePath 'C:\temp\suspiciousfile' -OfficialHash 'E3B0C44298FC1C149AFBF4C8996FB92427AE41E4649B934CA495991B7852B855'
    Compare-FileHash -f 'C:\temp\suspiciousfile' -h 'E3B0C44298FC1C149AFBF4C8996FB92427AE41E4649B934CA495991B7852B855'
    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [alias("f")]
        [string]$FilePath,

        [Parameter(Position = 1)]
        [alias("h")]
        [string]$OfficialHash
    )

    begin {
        Write-Host
        Write-Host " [\/\/]=======================[\/\/]"
        Write-Host "  |||| H A S H - C O M P A R E |||| "
        Write-Host "  ||||= ~ = ~ = ~ = ~ = ~ = ~ =|||| "
        Write-Host "  ||||                         |||| "
        Write-Host "  ||||      by sorefingers     |||| "
        Write-Host "  ||||=_=_=_=_=_=_=_=_=_=_=_=_=|||| "
        Write-Host " [\/\/]                       [\/\/]"
        Write-Host "`nDefault algorithm used is SHA256"
    }
    
    process {
        $i = 1

        while ($i -eq 1) {
            Write-Host
            if (!$FilePath) {
                Write-Host "Please drag the file onto this window or type/paste the file path" -ForegroundColor Cyan
                $FilePath = Read-Host
            }
            if (!$OfficialHash) {
                Write-Host "`nPlease paste the official hash here: " -ForegroundColor Cyan
                $OfficialHash = Read-Host
            }

            $HashToCheck = Get-FileHash -Path $FilePath | Select-Object -ExpandProperty Hash
            Write-Host
            Write-Host "File hash:       ", $HashToCheck
            Write-Host "Official hash:   ", $OfficialHash

            if ($HashToCheck -eq $OfficialHash) {
                Write-Host "The hashes are identical.`n`n" -ForegroundColor Green
            } else {
                Write-Host "The hashes are not identical.`n`n" -ForegroundColor Red
            }

            Write-Host "Would you like to compare another two hashes? [N/y] " -NoNewline -ForegroundColor Cyan
            $repeat = Read-Host
            Write-Host
            if ($repeat -ne "y") {
                Write-Host " [\/\/]=======================[\/\/]"
                Write-Host "  ||||   Thank you for using   |||| "
                Write-Host "  ||||                         |||| "
                Write-Host "  ||||= ~ = ~ = ~ = ~ = ~ = ~ =|||| "
                Write-Host "  |||| H A S H - C O M P A R E |||| "
                Write-Host "  ||||=_=_=_=_=_=_=_=_=_=_=_=_=|||| "
                Write-Host " [\/\/]                       [\/\/]"
                Write-Host
                $i = 0
            } else {
                $FilePath = $null
                $OfficialHash = $null
                continue 
            }
        }
    }
}
                         