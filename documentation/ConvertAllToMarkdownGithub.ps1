del media\*.png

#CSV Template Documentation
& .\ConvertToMarkdownGithub.ps1 -folderName "copyfrom_csv_to_restapi" -documentName "Copy from CSV to Profisee REST API"
& .\ConvertToMarkdownGithub.ps1 -folderName "copyfrom_restapi_to_csv" -documentName "Copy from Profisee REST API to CSV"

#JSON Template Documentation
& .\ConvertToMarkdownGithub.ps1 -folderName "copyfrom_json_to_restapi" -documentName "Copy from JSON to Profisee REST API"
& .\ConvertToMarkdownGithub.ps1 -folderName "copyfrom_restapi_to_json" -documentName "Copy from Profisee REST API to JSON"
