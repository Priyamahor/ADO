param (
[string]$targetDirectory,
[string]$filePattern
)
if (-Not (Test-Path $targetDirectory)) {
Write-Error "the directory $targetDirectory does not exist."
exit 1
}
$files = Get-ChildItem -Path $targetDirectory -Filter $filePattern

foreach ($file in $files) {
try {
Remove-Item -Path $file.FullName -Force
Write-Output "Deleted file: $($file.FullName)"
} catch {
Write-Error "failed to delete file: $($file.FullName). Error:$_"
}
}
