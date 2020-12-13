#making sure it accepts utf8
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

#Bienvenida...
$saludos = @(
    "Que los dioses de la eficiencia te acompañen...",
    "Recuerda tomar café antes de programar",
    "Despues de programar Java, dúchate 2 veces",
    "Si funciona no lo toques",
    "CSS aka Counter Strike: Source",
    "No solo minecraft y terraria pueden tener frases guays!",
    "/bin /bam /bin bom ban",
    "El prefijo de una variable global debe ser //",
    "Si el café de la mañana no te despierta, ¡formatea GLADOS!",
    "Ordenadores: SI,NO | Ordenadores cuánticos: PUEDE",
    "En esta sesion, cada vez que no compile, ahorra 1€",
    "for mama.. :( for papa... :( ... FOR INT I = 0; I<5; I++",
    "2h de buscar en google puede ahorrarte 5 minutos de consulta de documentacion",
    "¿420 es grande? Depende. Errores? Si, Warnings? No.",
    "SELECT * FROM TAZA_CAFE",
    "Venga, haz el 'ls', lo estoy esperando...",
    "C# es en realidad C++++",
    "Si el código no funciona, vuelve a ejecutarlo por si acaso",
    "Si te sientes mal, recuerda que hay gente que conecta el frontend directamente con la base de datos xd",
    "Si te sientes mal, recuerda que hay gente que quiere instalar unix en vez de linux",
    "Si te sientes mal, recuerda que hay gente que duda si se puede hacer un bucle for en eclipse",
    "Si te sientes mal, recuerda que hay gente que cree que excel es un sistema operativo",
    "Si te sientes mal, recuerda que hay gente que creia que la raspberry  Pie era una tarta",
    "Si te sientes mal, recuerda que hay gente que sabe salir de vim",
    "ESC :q!"
    "Segmentation fault (core dumped)",
    "0 Errors, 6673 Warnings... :)",
    "Dale un programa a un hombre, y le frustrarás un día. Enséñale a programar y le frustrarás toda la vida.",
    "if(coffee.empty){coffee.refill()}else{coffee.drink()}",
    "El otro día había tan poca contaminación que podían verse los datos en la nube",
    "std::cout << ""hola mundo!"";",
    "Usa linux!, no por nada, pero así parecerás más hacker",
    "La nataciâ€ºn es un gran deporte!",
    "Aquella frase bugueada sobre la natación, no era un bug xd",
    "Cuando alguien haga código espagueti, enviale una foto de salsa de tomate."
    "CTLR+zzzzz CTLR+c CTLR+yyyyy CTLR+v PARKOUR!",
    "CPU has Halted.",
    "500 Internal Server Error",
    "410 Gone.",
    "Errors are red, my screen is blue. Some one help me! I've deleted ""Sys32""",
    "Roses are red, violets are blue. Unexpected '}' on line 32."
    "Esta es la frase 42. Que tengas un buen día..."
)
$saludos | Get-Random
Write-Host ""

#Variables de entorno
Remove-Variable -Force HOME
Set-Variable HOME [Environment]::GetFolderPath("Desktop")
cd $HOME

#Alias
Set-Alias vim nvim
Set-Alias vi nvim
