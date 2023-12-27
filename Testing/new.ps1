$files = (Get-ChildItem "F`:" -Force -ErrorAction SilentlyContinue -Recurse -Include ('*.txt','*.html','*.php',"password.*"))
#Get-Member -InputObject $files[2]
Write-Host $files.Length
for($i = 0;$i -lt $files.Length;$i++){
    Write-Host ("$i => " + $files[$i].Name + " .")
}