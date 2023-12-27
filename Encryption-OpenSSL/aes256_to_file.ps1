$files = (Get-ChildItem -Force -ErrorAction SilentlyContinue -Recurse -Filter "*.txt");
Foreach($file in $files){
    openssl enc -aes-256-ecb -d -a -salt -pbkdf2 -in $file.Name -out ($file.Name.Substring(0,$file.Name.Length - 14)) -k "PASSWORD HERE"
    $mp4 = (Get-ChildItem -Force -Recurse -Filter "$($file.Name.Substring(0,$file.Name.Length - 14))");
    if($mp4.Length -gt 0){
        Remove-Item $file.Name -Force;
    }else{
        Write-Host "$($file.Name) Failed.";
    }
    Write-Host "$(($files.IndexOf($file)/$files.Length) * 100)% Done";
}
Write-Host "Done"