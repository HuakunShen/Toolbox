
Add-Type -AssemblyName System.Windows.Forms

while ($true) {
    [System.Windows.Forms.SendKeys]::SendWait("a")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{BACKSPACE}")
    Start-Sleep -Seconds 5
}