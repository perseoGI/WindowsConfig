# WinConfig
Este repositorio contiene el script powershell así como una lista de configuraciones que uso para configurar mi sistema. 

Lo dejo público por si alguien necesita de automatización para sus instalaciones de windows

# Uso Rapido
Escribe en powershell lo siguiente, y te bajará MI configuración.

Idealmente se debe forkear este proyecto, y modificar esta linea, con tu usuario.

    iex ((New-Object System.Net.WebClient).DownloadString('NUEVA URL'))

# Configuracion de WinConfig
    WinConfig.ps1 -h para mostrar la ayuda.

    Usar la opcion -debloat para eliminar todo e crapware.
    
    Usar la opcion -nosoftware para no descargar e instalar software.
    
    Usar la opcion -noconfig para no descargar y copiar configuraciones.
    

Edita en el script el array $urls para añadir o eliminar tus programas o actualizar links

Edita en el script el array de arrays $configs para bajar y copiar a la carpeta seleccionada tus configuraciones

El array de arrays $configs tiene la forma ( (path,file a descargar,nombre_fichero),(path,file a descargar,nombre_fichero),... )
