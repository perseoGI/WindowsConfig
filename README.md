# WindowsConfig

### Enable power shell script execution

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Install git

```
winget install --id Git.Git -e --source winget
no; Install-Module posh-git -Scope CurrentUser -Force
```
