del media\*.png
pandoc "Egress Profisee REST API to ADLS Gen2 CSV Template Documentation.docx" -f docx -t gfm -o "Egress Profisee REST API to CSV.md" --extract-media=.
cd media

dir | rename-item -NewName {$_.name -replace "image","csvegress_"}
copy-item csvegress_*.png ..\..\media

cd..

(Get-Content "Egress Profisee REST API to CSV.md").replace('image', 'csvegress_') | Set-Content "Egress Profisee REST API to CSV.md"
copy-item "Egress Profisee REST API to CSV.md" ..\
