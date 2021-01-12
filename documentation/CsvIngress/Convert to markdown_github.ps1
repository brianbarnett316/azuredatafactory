del media\*.png
pandoc "Ingress ADLS Gen2 CSV to Profisee REST APITemplate Documentation.docx" -f docx -t gfm -o "Ingress CSV to Profisee REST API.md" --extract-media=.
cd media

dir | rename-item -NewName {$_.name -replace "image","csvingress_"}
copy-item csvingress_*.png ..\..\media

cd..

(Get-Content "Ingress CSV to Profisee REST API.md").replace('image', 'csvingress_') | Set-Content "Ingress CSV to Profisee REST API.md"
copy-item "Ingress CSV to Profisee REST API.md" ..\
