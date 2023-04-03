# foldersandsubfolders_powershell
**#NOTE**
**Tested on Powershell version 5.1.19041.2673 - Windows 10 Professional**
List Folders and Subfolders retrieving their security permissions, ownership and inheritance status
1) Open PowerShell as administrator 
2) Enter command below
set-executionpolicy remotesigned
3) Answer Y to all questions
This command will allow your machine to run scripts
4) Enter the command below

Install-Module -Name NTFSSecurity

Answer Y to all questions
This PowerShell module better handles permission information about folders and files - Go Google it for better explanation
5) Open PoweShell ISE normally (normaal version, not the x86, it might work, but i don't know)
6) In the toolbar, click show, select show scripts (or something similar)
7) Paste code below from listfoldersandsubfolders.ps1

8) Choose the main path which you want to review - if you will start by C, just put C:\ - keep single quotes - Remember to set full path

Example
Path Desktop: wrong
Path C:\Users\rafael\Desktop\ right

9) Click play to run the ps1 file
10) Depending on the main folder and how many folders there are, the command will take some time to conclude its execution

11) When successful, it will generate an output.txt file inside the main folder that was defined containing:

a) all security permissions of parent folder and subfolders
E.g. Who can read, write, edit, full control, allow deny

b) who owns each folder
eg: raphael

c) will filter all previous output by lines containing False - the purpose is mainly to see which folders did NOT inherit their security permissions from the folder above it

11) Disabling the option to run scripts on the machine

Again in normal PowerShell (only prompt without script editing) and run as administrator, give below code

Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine

12) to confirm that it was disabled, issue the command below

Get-ExecutionPolicy -List

If correct it will display all Undefined

13) It's not necessary, but if you want, you can remove the installed PowerShell module to run the script

Uninstall-Module -Name NTFSSecurity

I assume it will ask to confirm, just say Y
