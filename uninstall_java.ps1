function GetUninstallString($productName) {
    #PowerShell script to uninstall all Java SE (JRE) versions on a computer
        $x64items = @(Get-ChildItem "HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall")
        ($x64items + @(Get-ChildItem "HKLM:SOFTWARE\wow6432node\Microsoft\Windows\CurrentVersion\Uninstall") `
            | ForEach-object { Get-ItemProperty Microsoft.PowerShell.Core\Registry::$_ } `
            | Where-Object { $_.DisplayName -and $_.DisplayName -eq $productName } `
            | Select UninstallString).UninstallString
    }
    function UninstallJava ($name) {
        $java8 = (GetUninstallString 'Java SE Development Kit 8 Update 221')
        $uninstallCommand = (GetUninstallString $name)
        if($uninstallCommand) {
            Write-Host "Uninstalling $name"
    
            $uninstallCommand = $uninstallCommand.replace('MsiExec.exe /I{', '/x{').replace('MsiExec.exe /X{', '/x{')
            cmd /c start /wait msiexec.exe $uninstallCommand /quiet
    
            Write-Host "Uninstalled $name" -ForegroundColor Green
        }
    }
        UninstallJava 'Java SE Development Kit 8 Update 221'
        UninstallJava 'Java SE Development Kit 8 Update 221 (64-bit)'
        UninstallJava 'Java 8 Update 221'
        UninstallJava 'Java 8 Update 221 (64-bit)'