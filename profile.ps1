# startship prompt
Invoke-Expression (&starship init powershell)

# env vars
$env:EDITOR = 'nvim'
$env:PSFZF_EDITOR_OPTIONS = ''
$env:FZF_DEFAULT_COMMAND = 'fd -td'

# vi mode
Set-PSReadLineOption -EditMode Vi

# system tweaks
del alias:gp -Force
del alias:ls -Force

# alias
Set-Alias c clear
Set-Alias pp python 
Set-Alias qt nvim-qt.exe
Set-Alias vi nvim.exe
Set-Alias vim nvim.exe
Set-Alias which where.exe

# custom 
Set-PSReadlineOption -BellStyle None

# funcs
function .. { cd .. }
function dotent { dotnet $args }
function ff { Invoke-FZF | cd }
function l { eza -l1 $args } function la { eza -la $args } function ll { eza -la $args } function ls { eza $args }
function mc { cd "C:\Program Files (x86)\SOTI\MobiControl" }
function mm { cd D:/dev/XSight_Windows/ }
function nau { Explorer.exe "." }
function sol { fd -d1 -e sln | foreach { start $_ } }
function vimg { vim +"G" }


# edit cmd in $EDITOR
Set-PSReadLineKeyHandler -Chord Alt+e -Function ViEditVisually
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete


