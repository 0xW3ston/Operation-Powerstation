$files = (Get-ChildItem -Force -ErrorAction SilentlyContinue -Recurse -Filter "*.mp4");
Foreach($file in $files){
    openssl enc -aes-256-ecb -e -a -salt -pbkdf2 -in $file.Name -out ("$($file.Name)_Encrypted.txt") -k "PASSWORD HERE"
    $encrypted_txt = (Get-ChildItem -Force -Recurse -Filter "$($file.Name)_Encrypted.txt");
    if($encrypted_txt.Length -gt 0){
        Remove-Item $file.Name -Force;
    }else{
        Write-Host "$($file.Name) Failed.";
    }
    Write-Host "$((($files.IndexOf($file) + 1)/$files.Length) * 100)% Done";
}
Write-Host "Done"