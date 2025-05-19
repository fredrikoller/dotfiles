oh-my-posh init pwsh --config "C:\Development\github\dotfiles\oh-my-posh\fredrikoller.omp.json" | Invoke-Expression
Import-Module PSReadLine
Import-Module -Name Terminal-Icons

# ps readline opts
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Install-Module -Name PowerColorLS -Repository PSGallery
Import-Module PowerColorLS

function PowerColorLSWithOptions {
    PowerColorLS -a -l --show-directory-size
}