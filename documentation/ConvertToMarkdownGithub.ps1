param ($folderName, $documentName)

write-host "Converting" $documentName

$imageName = $folderName + "_"

cd $folderName

del media\*.png
pandoc "$documentName.docx" -f docx -t gfm -o "$documentName.md" --extract-media=.

cd media
dir | rename-item -NewName {$_.name -replace "image", $imageName}
copy-item $imageName*.png ..\..\media

cd..
(Get-Content "$documentName.md").replace('image', $imageName) | Set-Content "$documentName.md"
copy-item "$documentName.md" ..\

cd..
