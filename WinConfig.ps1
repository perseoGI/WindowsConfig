#Instalador de programas necesarios para mi windows. 
#La gestion de parametros debe estar al inicio:
param(
[switch]$h = $false,
[switch]$debloat = $false,
[switch]$nosoftware = $false,
[switch]$noconfig = $false,
[switch]$nomanual = $false
)

#lista de variables de entorno comoda para acceso a directorios del usuario actual
$DesktopPath = [Environment]::GetFolderPath("Desktop")                   #ESCRITORIO
$DocumentsPath = [Environment]::GetFolderPath("Personal")                #MIS DOCUMENTOS
$ProgramFilesPath = [Environment]::GetFolderPath("ProgramFiles")         #ARCHIVOS DE PROGRAMA
$ProgramFilesX86Path = [Environment]::GetFolderPath("ProgramFilesX86")   #ARCHIVOS DE PROGRAMA X86
$StartMenuPath = [Environment]::GetFolderPath("StartMenu")               #MENU DE INICIO
$StartupPath = [Environment]::GetFolderPath("Startup")                   #PROGRAMAS QUE SE ARRANCAN AQUI



###########################################################################################
####                                CONFIGURACION DE SW                                ####
###########################################################################################

#lista de programas
$urls = (
#NAVEGADOR
    "https://download.cyberghostvpn.com/private-browser/CyberGhostPrivateBrowser-86.1.4240.111.exe",
#SOCIAL    
    "https://telegram.org/dl/desktop/win",
    "https://discord.com/api/download?platform=win",
#DESARROLLO
    "https://visualstudio.microsoft.com/es/thank-you-downloading-visual-studio/?sku=Community&rel=16#",
    "https://github.com/git-for-windows/git/releases/download/v2.29.2.windows.2/Git-2.29.2.2-64-bit.exe",
#INFORMATICA    
    "https://1.eu.dl.wireshark.org/win64/Wireshark-win64-3.4.0.exe",
    "https://nmap.org/dist/nmap-7.91-setup.exe",
    "https://github.com/pbatard/rufus/releases/download/v3.12/rufus-3.12.exe",
    "https://dl.bitvise.com/BvSshClient-Inst.exe",
    "https://github.com/microsoft/terminal/releases/download/v1.4.3243.0/Microsoft.WindowsTerminal_1.4.3243.0_8wekyb3d8bbwe.msixbundle",
#UTILIDADES
    "https://www.sumatrapdfreader.org/dl2/SumatraPDF-3.2-64-install.exe",
    "https://www.janboersma.nl/gett/setup/TyreSetup_x64.exe",
    "https://archive.org/download/wlsetup-all_201802/wlsetup-all.exe",
#JUEGOS
    "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe",
    "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi",
    "https://launcher.mojang.com/download/MinecraftInstaller.msi"
)

#lista de programas cuya descarga no se puede (o me da pereza de hacer webscrapping para) automatizar
$manuals = (
    "https://github.com/neovim/neovim/releases/nightly",
    "https://github.com/bmrf/tron",
    "https://www.ccleaner.com/es-es/ccleaner/download",
    "https://es.malwarebytes.com/",
    "https://www.google.com/intl/es-419/earth/",
    "https://www.winrar.es/",
    "https://docs.microsoft.com/es-es/windows/wsl/install-win10"
)

#lista de configuraciones. no borrar la coma inicial, es necesaria para forzar que cree arrays de arrays
$configs = (
    ,($DesktopPath,"https://github.com/petacreepers23/MusicPlayer/raw/main/Javier%20Miguel%20Gonzalez.pfx", "cert.pfx"),
    ("$DocumentsPath\WindowsPowerShell","https://raw.githubusercontent.com/petacreepers23/WinConfig/main/profile.ps1","profile.ps1"),
    ("$DocumentsPath\..\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState","https://raw.githubusercontent.com/petacreepers23/WinConfig/main/settings.json","settings.json"),
    ("$DocumentsPath\..\AppData\Local\nvim","https://raw.githubusercontent.com/petacreepers23/WinConfig/main/init.vim","init.vim")
)

###########################################################################################
####                                COMIENZO DEL SCRIPT                                ####
###########################################################################################


#1: Flag -h
if($h) {
    Write-Output("Instalador de programas necesarios para mi windows.")
    Write-Output("")
    Write-Output("Usar la opcion -debloat para eliminar todo e crapware.")
    Write-Output("Usar la opcion -nosoftware para no descargar e instalar software.")
    Write-Output("Usar la opcion -nomanual para no abrir las urls de descarga manual.")
    Write-Output("Usar la opcion -noconfig para no descargar y copiar configuraciones.")
    Write-Output("")
    Write-Output("Edita en el script el array `$urls para añadir o eliminar tus programas o actualizar links")
    Write-Output("Edita en el script el array `$manuals para añadir las urls de softwares que generan un token de descarga cada vez y no se peuden automatizar.")
    Write-Output("Edita en el script el array de arrays `$configs para bajar y copiar a la carpeta seleccionada tus configuraciones")
    Write-Output("    El array de arrays `$configs tiene la forma ( (path,file a descargar,nombre_fichero),(path,file a descargar,nombre_fichero),... )")
    Exit 42
}

#2: Debloater
if($debloat){
    iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))
    Write-Output("")
    Write-Output("")
}

#3: Bucle de instalacion de programas
if(-NOT($nosoftware)){
    Write-Output("Comienza la descarga e instalacion de programas.")
    Foreach($url in $urls) {
        Write-Output("Descargando... " + $url)
        Invoke-WebRequest -Uri $url -OutFile "tmp.exe"
        Write-Output("Descargado. Esperando a que finalice la instalación.")
        Start-Process "./tmp.exe" -NoNewWindow -Wait
        del "./tmp.exe"
    }
    Write-Output("Descarga e instalacion de programas finalizada.")
    Write-Output("")
}

#4: Bucle de programas que se deben descargar de forma manual
if(-NOT($nomanual)){
    Write-Output("Comienza la descarga de SW manual.")
    Write-Output("Hasta que no se cierre la ventana actual del explorador, no se continua con la instalación")
    Foreach($man in $manuals) {
        Write-Output("Esperando a que finalice la isntalación de... " + $man)
        Start-Process $man -Wait
    }
    Write-Output("Instalacion manual completa.")
    Write-Output("")
}

#5: Bucle de instalacion de configuraciones
if(-NOT($noconfig)){
    Write-Output("Comienza la descarga e instalacion de configuraciones.")
    Foreach($config in $configs) {
        Write-Output("Descargando... " + $config[1])
        Invoke-WebRequest -Uri $config[1] -OutFile $config[2]
        Write-Output("Moviendo " + $config[2] + " a " + $config[0])
        Move-Item -Path $config[2] -Destination $config[0] -Force
    }
    Write-Output("Descarga e instalacion de configuraciones finalizada.")
    Write-Output("")
}
