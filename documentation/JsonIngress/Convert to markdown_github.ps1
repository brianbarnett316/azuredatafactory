del media\*.png
pandoc "Ingress ADLS Gen2 JSON to Profisee REST APITemplate Documentation.docx" -f docx -t gfm -o "Ingress JSON to Profisee REST API.md" --extract-media=.
cd media

dir | rename-item -NewName {$_.name -replace "image","jsoningress_"}
copy-item jsoningress_*.png ..\..\media

cd..

(Get-Content "Ingress JSON to Profisee REST API.md").replace('image', 'jsoningress_') | Set-Content "Ingress JSON to Profisee REST API.md"
copy-item "Ingress JSON to Profisee REST API.md" ..\
