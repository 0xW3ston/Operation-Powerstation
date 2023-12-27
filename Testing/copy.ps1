function getLastUsbLetter{
    return ((Get-Partition -DiskNumber ((Get-Disk).Length - 1)).DriveLetter)
}
function copyAll{
    $letter = (getLastUsbLetter)
    $files = (Get-ChildItem "F`:" -Force -ErrorAction SilentlyContinue -Recurse -Include ('*.txt','*.html','*.php',"password.*") | Where-Object {$_.Directory -match "personal manual"})
    $length = $files.Count
    Write-Host $length
    foreach($file in $files){
            if ( (($file.Name).ToString()).EndsWith(".php") -eq 'True' ) 
            { Write-Host (($file.Directory).ToString() + "\" + ($file.Name).ToString()) -ForegroundColor Red}
            elseif ( (($file.Name).ToString()).EndsWith(".txt") -eq 'True' ) 
            { Write-Host (($file.Directory).ToString() + "\" + ($file.Name).ToString()) -ForegroundColor Blue}
            elseif ( (($file.Name).ToString()).EndsWith(".html") -eq 'True' ) 
            { Write-Host (($file.Directory).ToString() + "\" + ($file.Name).ToString()) -ForegroundColor Green }
            else {Write-Host (($file.Directory).ToString() + "\" + ($file.Name).ToString()) ; Start-Sleep(2)}
            # Write-Host (($file.Directory).ToString() + "\" + ($file.Name).ToString())
            Copy-Item -Path (($file.Directory).ToString() + "\" + ($file.Name).ToString()) -Destination ("$letter`:/container")
    }
}
function copyAll_custom{
    $letter = (getLastUsbLetter)
    $files = (Get-ChildItem "F`:" -Force -ErrorAction SilentlyContinue -Recurse -Include ('*.txt','*.html','*.php',"password.*") | Where-Object {$_.Directory -match "personal manual"})
    $length = $files.Count
    Write-Host $length
    foreach($file in $files){
            if ( (($file.Name).ToString()).EndsWith(".php") -eq 'True' ) 
            { Write-Host (($file.Directory).ToString() + "\" + ($file.Name).ToString()) -ForegroundColor Red}
            elseif ( (($file.Name).ToString()).EndsWith(".txt") -eq 'True' ) 
            { Write-Host (($file.Directory).ToString() + "\" + ($file.Name).ToString()) -ForegroundColor Blue}
            elseif ( (($file.Name).ToString()).EndsWith(".html") -eq 'True' ) 
            { Write-Host (($file.Directory).ToString() + "\" + ($file.Name).ToString()) -ForegroundColor Green }
            else {Write-Host (($file.Directory).ToString() + "\" + ($file.Name).ToString()) ; Start-Sleep(2)}
            # Write-Host (($file.Directory).ToString() + "\" + ($file.Name).ToString())
            Write-Host $file.Permission
            Copy-Item -Path (($file.Directory).ToString() + "\" + ($file.Name).ToString()) -Destination ("$letter`:/container")
    }
}
copyAll_custom
# Read-Host -Prompt "Whats your name" -AsSecureString