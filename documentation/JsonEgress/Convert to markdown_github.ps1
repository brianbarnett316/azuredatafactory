del media\*.png
pandoc "Egress Profisee REST API to ADLS Gen2 JSON Template Documentation.docx" -f docx -t gfm -o "Egress Profisee REST API to JSON.md" --extract-media=.
cd media

dir | rename-item -NewName {$_.name -replace "image","jsonegress_"}
copy-item jsonegress_*.png ..\..\media

cd..

(Get-Content "Egress Profisee REST API to JSON.md").replace('image', 'jsonegress_') | Set-Content "Egress Profisee REST API to JSON.md"
copy-item "Egress Profisee REST API to JSON.md" ..\
