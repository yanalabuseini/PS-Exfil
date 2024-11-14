param (
    [string]$folderPath,
    [int]$maxFileSize,
    [string]$connectionString 
)

Import-Module Az.Storage
Connect-Azaccount

if (-not (Test-Path $folderPath)) {
    Write-Host "The specified folder path does not exist."
    exit
}

$files = Get-ChildItem -Path $folderPath -File -Recurse | Where-Object { $_.Length -le $maxFileSize }

$context = New-AzStorageContext -ConnectionString $connectionString

foreach ($file in $files) {
    $containerName = "all"
    $blobName = $file.Name

    $container = Get-AzStorageContainer -Context $context | Where-Object { $_.Name -eq $containerName }
    if (-not $container) {
        Write-Host "Container '$containerName' not found. Creating container"
        $container = New-AzStorageContainer -Name $containerName -Context $context
    }

    Write-Host "Uploading $($file.FullName) to container '$containerName'..."
    Set-AzStorageBlobContent -File $file.FullName -Container $containerName -Blob $blobName -Context $context -Force | Out-Null

    Write-Host "File '$($file.Name)' uploaded successfully."
}

Write-Host "All files uploaded successfully."
