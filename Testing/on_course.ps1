#Version =>  $PSVersionTable
#Get-Command -Name "Write-Hoskkt"
#(Get-Partition -DiskNumber ((Get-Disk).Length - 1)).DriveLetter
Get-Disk | Get-Member

#        <---->         #
#Set-ExecutionPolicy Unrestricted -Force ; $letter = ((Get-Partition -DiskNumber ((Get-Disk).Length - 1)).DriveLetter) ; powershell -File "$letter`:\test_short.ps1"
