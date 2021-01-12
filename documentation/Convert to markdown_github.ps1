del media\*.png

cd JsonEgress
& '.\Convert to markdown_github.ps1'

cd..

cd JsonIngress
& '.\Convert to markdown_github.ps1'
 
cd..

cd CsvEgress
& '.\Convert to markdown_github.ps1'

cd..

cd CsvIngress
& '.\Convert to markdown_github.ps1'


cd..
