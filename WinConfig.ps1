#Instalador de programas necesarios para mi windows. 
#La gestion de parametros debe estar al inicio:
param(
[switch]$h = $false,
[switch]$debloat = $false,
[switch]$nosoftware = $false,
[switch]$noconfig = $false
)

#lista de variables de entorno comoda para acceso a directorios del usuario actual
$DesktopPath = [Environment]::GetFolderPath("Desktop")                   #ESCRITORIO
$DocumentsPath = [Environment]::GetFolderPath("Personal")                #MIS DOCUMENTOS
$ProgramFilesPath = [Environment]::GetFolderPath("ProgramFiles")         #ARCHIVOS DE PROGRAMA
$ProgramFilesX86Path = [Environment]::GetFolderPath("ProgramFilesX86")   #ARCHIVOS DE PROGRAMA X86
$StartMenuPath = [Environment]::GetFolderPath("StartMenu")               #MENU DE INICIO
$StartupPath = [Environment]::GetFolderPath("Startup")                   #PROGRAMAS QUE SE ARRANCAN AQUI


#lista de programas
$urls = (
    "https://download.cyberghostvpn.com/private-browser/CyberGhostPrivateBrowser-86.1.4240.111.exe",
    "https://telegram.org/dl/desktop/win"
)

#lista de configuraciones. no borrar la coma inicial, es necesaria para forzar que cree arrays de arrays
$configs = (
    ,($DesktopPath,"https://github.com/petacreepers23/MusicPlayer/raw/main/Javier%20Miguel%20Gonzalez.pfx", "cert.pfx")
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
    Write-Output("Usar la opcion -noconfig para no descargar y copiar configuraciones.")
    Write-Output("")
    Write-Output("Edita en el script el array `$urls para añadir o eliminar tus programas o actualizar links")
    Write-Output("Edita en el script el array de arrays `$configs para bajar y copiar a la carpeta seleccionada tus configuraciones")
    Write-Output("    El array de arrays `$configs tiene la forma ( (path,file a descargar,nombre_fichero),(path,file a descargar,nombre_fichero),... )")
    Exit 42
}

#2: Debloater
if($debloat){
    iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))
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
}

#4: Bucle de instalacion de configuraciones
if(-NOT($noconfig)){
    Write-Output("Comienza la descarga e instalacion de configuraciones.")
    Foreach($config in $configs) {
        Write-Output("Descargando... " + $config[1])
        Invoke-WebRequest -Uri $config[1] -OutFile $config[2]
        Write-Output("Moviendo " + $config[2] + " a " + $config[0])
        move $config[2] $config[0]
    }
    Write-Output("Descarga e instalacion de configuraciones finalizada.")
}