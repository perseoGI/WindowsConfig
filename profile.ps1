#Bienvenida...
$saludos = @(
    "Que los dioses de la eficiencia te acompa�en...",
    "Recuerda tomar caf� antes de programar",
    "Despues de programar Java, d�chate 2 veces",
    "Si funciona no lo toques",
    "CSS aka Counter Strike: Source",
    "No solo minecraft y terraria pueden tener frases guays!",
    "/bin /bam /bin bom ban",
    "El prefijo de una variable global debe ser //",
    "Si el caf� de la ma�ana no te despierta, �formatea GLADOS!",
    "Ordenadores: SI,NO | Ordenadores cu�nticos: PUEDE",
    "En esta sesion, cada vez que no compile, ahorra 1�",
    "for mama.. :( for papa... :( ... FOR INT I = 0; I<5; I++",
    "2h de buscar en google puede ahorrarte 5 minutos de consulta de documentacion",
    "�420 es grande? Depende. Errores? Si, Warnings? No.",
    "SELECT * FROM TAZA_CAFE",
    "Venga, haz el 'ls', lo estoy esperando...",
    "C# es en realidad C++++",
    "Si el c�digo no funciona, vuelve a ejecutarlo por si acaso",
    "Si te sientes mal, recuerda que hay gente que conecta el frontend directamente con la base de datos xd",
    "Si te sientes mal, recuerda que hay gente que quiere instalar unix en vez de linux",
    "Si te sientes mal, recuerda que hay gente que duda si se puede hacer un bucle for en eclipse",
    "Si te sientes mal, recuerda que hay gente que cree que excel es un sistema operativo",
    "Si te sientes mal, recuerda que hay gente que creia que la raspberry  Pie era una tarta",
    "Si te sientes mal, recuerda que hay gente que sabe salir de vim",
    "ESC :q!"
    "Segmentation fault (core dumped)",
    "0 Errors, 6673 Warnings... :)",
    "Dale un programa a un hombre, y le frustrar�s un d�a. Ens��ale a programar y le frustrar�s toda la vida.",
    "if(coffee.empty){coffee.refill()}else{coffee.drink()}",
    "El otro d�a hab�a tan poca contaminaci�n que pod�an verse los datos en la nube",
    "std::cout << ""hola mundo!"";",
    "Usa linux!, no por nada, pero as� parecer�s m�s hacker",
    "La nataci›n es un gran deporte!",
    "Aquella frase bugueada sobre la nataci�n, no era un bug xd",
    "Cuando alguien haga c�digo espagueti, enviale una foto de salsa de tomate."
    "CTLR+zzzzz CTLR+c CTLR+yyyyy CTLR+v PARKOUR!",
    "CPU has Halted.",
    "500 Internal Server Error",
    "410 Gone.",
    "Errors are red, my screen is blue. Some one help me! I've deleted ""Sys32""",
    "Roses are red, violets are blue. Unexpected '}' on line 32."
    "Esta es la frase 42. Que tengas un buen d�a..."
)
$saludos | Get-Random
Write-Host ""

#Variables de entorno
Remove-Variable -Force HOME
Set-Variable HOME "C:\Users\usuario\desktop"
cd $HOME

#Alias
Set-Alias vim nvim
Set-Alias vi nvim