$paifolder = Read-Host -Prompt 'Which is the parent folder full path?'
Write-Progress -Activity "Listar pastas, subpastas e suas permissões de segurança" -Status "Iniciando script"
#Translation of Listar pastas, subpastas e suas permissões de segurança" -Status "Iniciando script
#List folders, subfolders and their security permissions - Starting script
$outputfile = 'output.txt'
Import-Module NTFSSecurity 

Set-Location $paifolder
$arrayName = @(Get-Location |Select-Object -ExpandProperty Path)
$arrayName2 = Get-Childitem -Directory -Path $paifolder  -Recurse|Select-Object -ExpandProperty FullName
$arrayNameFull = $arrayName+$arrayName2
$result = Get-NTFSAccess $arrayNameFull| Format-Table -Wrap -AutoSize| Out-File $paifolder\$outputfile
Get-NTFSOwner $arrayNameFull| Format-Table -Wrap -AutoSize|Out-File $paifolder\$outputfile -Append
Get-NTFSInheritance $arrayNameFull| Format-Table -Wrap -AutoSize| Out-File $paifolder\$outputfile -Append
Get-Content $paifolder\$outputfile|findstr False| Format-Table -Wrap -AutoSize| Out-File $paifolder\$outputfile -Append
$TotalInterations = (($arrayNameFull.Length)*4)
$TotalFolders = $arrayNameFull.Length
$incrementBarProgress = 100/$TotalInterations
$startBarProgress = 0

#calculate progress
Write-output("")
Write-output("Rodando programa............................")
#Translation - Running program.....
Write-output("")
Write-output("Pastas encontradas: $TotalFolders")
#Translation Found folders:
Write-output("Total de atividades a serem realizadas: $TotalInterations")
#Translation Total of activities to be accomplished
Write-output("")
for ($i=0; $i -le 100/$incrementBarProgress; $i++){
Write-Progress -Activity "Rodando programa" -Status "Em andamento: $i" -PercentComplete $startBarProgress
#Translation Running program - In Progress
Write-output("Atividade: $i Progresso: "+[math]::Round($StartBarProgress,2)+"%")
$StartBarProgress=$startBarProgress+$incrementBarProgress

}

#escreva no arquivo
#Translation write to file
Write-Progress -Activity "Rodando script" -Status "Script concluído" -Completed
#Translation Running script - Script concluded
Write-output("")| Out-File $paifolder\$outputfile -Append
Write-output("Concluído............................")| Out-File $paifolder\$outputfile -Append
#Translation Concluded
Write-output("")| Out-File $paifolder\$outputfile -Append
Write-output("Pastas analisadas: $TotalFolders")| Out-File $paifolder\$outputfile -Append
#Translation Analysed folders:
Write-output("Total de análises: $TotalInterations")| Out-File $paifolder\$outputfile -Append
#Translation Total of Analysis

#escreva no console
#Translation write to console
Write-output("")
Write-output("Concluído............................")
#Translation Concluded
Write-output("")
Write-output("Pastas analisadas: $TotalFolders")
#Translation Analysed folders:
Write-output("Total de análises: $TotalInterations")
#Translation Total of Analysis
