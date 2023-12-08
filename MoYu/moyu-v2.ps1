Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'MoYu'
$form.Size = New-Object System.Drawing.Size(300,220)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button

$okButton.Location = New-Object System.Drawing.Point(75,140)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,140)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$curTimeLabel = New-Object System.Windows.Forms.Label
$curTimeLabel.Location = New-Object System.Drawing.Point(10,0)
$curTimeLabel.Size = New-Object System.Drawing.Size(280,20)
$curTimeLabel.Text = 'Current Time: ' + (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
$form.Controls.Add($curTimeLabel)

$startLabel = New-Object System.Windows.Forms.Label
$startLabel.Location = New-Object System.Drawing.Point(10,20)
$startLabel.Size = New-Object System.Drawing.Size(280,20)
$startLabel.Text = 'Enter Start Time (yyyy-MM-dd HH:mm)'
$form.Controls.Add($startLabel)


# Start DateTimePicker
$startDateTimePicker = New-Object Windows.Forms.DateTimePicker
$startDateTimePicker.Location = New-Object Drawing.Point(10, 40)
$startDateTimePicker.Format = [System.Windows.Forms.DateTimePickerFormat]::Custom
$startDateTimePicker.CustomFormat = "yyyy-MM-dd HH:mm:ss"
# set default value for $startDateTimePicker to be 08:30am
$startDateTimePicker.Value = (Get-Date).Date.AddHours(8.5)
$form.Controls.Add($startDateTimePicker)


$endLabel = New-Object System.Windows.Forms.Label
$endLabel.Location = New-Object System.Drawing.Point(10,60)
$endLabel.Size = New-Object System.Drawing.Size(280,20)
$endLabel.Text = 'Enter end Time (yyyy-MM-dd HH:mm)'
$form.Controls.Add($endLabel)

# Start DateTimePicker
$endDateTimePicker = New-Object Windows.Forms.DateTimePicker
$endDateTimePicker.Location = New-Object Drawing.Point(10, 80)
$endDateTimePicker.Format = [System.Windows.Forms.DateTimePickerFormat]::Custom
$endDateTimePicker.CustomFormat = "yyyy-MM-dd HH:mm:ss"
# set default value for $startDateTimePicker to be 17:00pm
$endDateTimePicker.Value = (Get-Date).Date.AddHours(17)
$form.Controls.Add($endDateTimePicker)

# prompt for a number called delay
$delayLabel = New-Object System.Windows.Forms.Label
$delayLabel.Location = New-Object System.Drawing.Point(10,100)
$delayLabel.Size = New-Object System.Drawing.Size(280,20)
$delayLabel.Text = 'Enter delay (seconds)'
$form.Controls.Add($delayLabel)

$delayTextBox = New-Object System.Windows.Forms.TextBox
$delayTextBox.Location = New-Object System.Drawing.Point(10, 120)
$delayTextBox.Size = New-Object System.Drawing.Size(50,20)
# set default value for $delayTextBox to be 60
$delayTextBox.Text = "60"
$form.Controls.Add($delayTextBox)

$form.Topmost = $true

$result = $form.ShowDialog()

if ($result -ne [System.Windows.Forms.DialogResult]::OK) {
    Exit
}

# get $startDateTimePicker and $endDateTimePicker value
$startDateTime = $startDateTimePicker.Value
$endDateTime = $endDateTimePicker.Value
# parse $delayTextBox to int
$delay = [int]$delayTextBox.Text

Write-Host "You selected: $startDateTime"
Write-Host "You selected: $endDateTime"


while ($true) {
    # check if current time is between $startDateTime and $endDateTime
    $currentTime = Get-Date
    if ($currentTime -gt $startDateTime -and $currentTime -lt $endDateTime) {
        Write-Host "Running at $currentTime"
        [System.Windows.Forms.SendKeys]::SendWait("a")
        # [System.Windows.Forms.SendKeys]::SendWait("{BACKSPACE}")
        Start-Sleep -Seconds $delay
    } else {
        # if current time is later than $endDateTime, exit
        if ($currentTime -gt $endDateTime) {
            Write-Host "Current time is later than $endDateTime, exit"
            Exit
        }
        Write-Host "Waiting at $currentTime"
        Start-Sleep -Seconds $delay
    }
}
