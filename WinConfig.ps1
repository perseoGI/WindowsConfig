# Windows installer
param(
[switch]$h = $false,
[switch]$debloat = $false,
[switch]$software = $false,
[switch]$config = $false,
[switch]$manual = $false
)

# Environment variables
$DesktopPath = [Environment]::GetFolderPath("Desktop")                   
$DocumentsPath = [Environment]::GetFolderPath("Personal")                
$ProgramFilesPath = [Environment]::GetFolderPath("ProgramFiles")         
$ProgramFilesX86Path = [Environment]::GetFolderPath("ProgramFilesX86")   
$StartMenuPath = [Environment]::GetFolderPath("StartMenu")               
$StartupPath = [Environment]::GetFolderPath("Startup")                   



###########################################################################################
####                                SW CONFIGURATION                                   ####
###########################################################################################

# Programs list
$urls = (
# Web browser
# Chat apps    
    #"https://telegram.org/dl/desktop/win",
    #"https://discord.com/api/download?platform=win",
# Development
    # "https://visualstudio.microsoft.com/es/thank-you-downloading-visual-studio/?sku=Community&rel=16#",
    # "https://github.com/git-for-windows/git/releases/download/v2.29.2.windows.2/Git-2.29.2.2-64-bit.exe",
# IT    
    # "https://1.eu.dl.wireshark.org/win64/Wireshark-win64-3.4.0.exe",
    # "https://nmap.org/dist/nmap-7.91-setup.exe",
    "https://github.com/pbatard/rufus/releases/download/v3.12/rufus-3.12.exe",
    # "https://dl.bitvise.com/BvSshClient-Inst.exe",
    "https://github.com/microsoft/terminal/releases/download/v1.4.3243.0/Microsoft.WindowsTerminal_1.4.3243.0_8wekyb3d8bbwe.msixbundle",
# Utilities
    # "https://www.sumatrapdfreader.org/dl2/SumatraPDF-3.2-64-install.exe",
    # "https://www.janboersma.nl/gett/setup/TyreSetup_x64.exe",
    # "https://archive.org/download/wlsetup-all_201802/wlsetup-all.exe",
# Games
    "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe",
    "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi",
    "https://launcher.mojang.com/download/MinecraftInstaller.msi"
)

# Programs that cant be easyly installed
$manuals = (
    "https://github.com/neovim/neovim/releases/nightly",
    # "https://github.com/bmrf/tron",
    "https://www.ccleaner.com/es-es/ccleaner/download",
    "https://es.malwarebytes.com/"
)

# Configuration list 
$configs = (
    ("$DocumentsPath\WindowsPowerShell", "https://github.com/perseoGI/WindowsConfig/blob/main/profile.ps1", "profile.ps1"),
    ("$DocumentsPath\..\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState","https://raw.githubusercontent.com/perseoGI/WindowsConfig/main/settings.json","settings.json")
)

###########################################################################################
####                                  START OF SCRIPT                                  ####
###########################################################################################


#1: Flag -h
if($h) {
    Write-Output("Installer of necessary programs for windows.")
    Write-Output("")
    Write-Output("Use the -debloat option to remove all crapware.")
    Write-Output("Use the -software option to download and install software.")
    Write-Output("Use the -manual option to open manual download urls.")
    Write-Output("Use the -config option to download and copy configurations.")
    Write-Output("")
    Write-Output("Edit the `$urls array in the script to add or remove your programs or update links")
    Write-Output("Edit the `$manuals array in the script to add the software urls that generate a download token each time and cannot be automated.")
    Write-Output("Edit in the script the array of arrays `$configs to download and copy your configurations to the selected folder")
    Write-Output(" The array of arrays `$configs has the form ( (path,file to download,filename),(path,file to download,filename),... )")
    Exit 42
}

#2: Debloater
if($debloat){
    iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))
    Write-Output("")
    Write-Output("")
}

#3: Program installation loop
if($software){
    Write-Output("Starting programs download and installation")
    Foreach($url in $urls) {
        Write-Output("Downloading... " + $url)
        Invoke-WebRequest -Uri $url -OutFile "tmp.exe"
        Write-Output("Downloaded. Waiting installation to finish...")
        Start-Process "./tmp.exe" -NoNewWindow -Wait
        del "./tmp.exe"
    }
    Write-Output("Program installation succeced")
    Write-Output("")
}

#4: Manual installation loop
if($manual){
    Write-Output("Starting manual installation of programs")
    Write-Output("Until file explorer window is not closed installation will not proceed")
    Foreach($man in $manuals) {
        Write-Output("Waiting until " + $man + " finish installing...")
        Start-Process $man -Wait
    }
    Write-Output("Manual installation completed.")
    Write-Output("")
}

#5: Profile installation loop
if($config){
    Write-Output("Starting dowload and installation of profiles")
    Foreach($cfg in $configs) {
        Write-Output("Downloading... " + $cfg[1])
        Invoke-WebRequest -Uri $cfg[1] -OutFile $cfg[2]
        Write-Output("Coping " + $cfg[2] + " to " + $cfg[0])
        Move-Item -Path $cfg[2] -Destination $cfg[0] -Force
    }
    Write-Output("Profiles installation completed.")
    Write-Output("")
}
