[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null


$PATH = "$($env:APPDATA)\Kilian-Schwarz\TelNet"
if (!(Test-Path $PATH )) {New-Item -Path $PATH -ItemType Directory -erroraction 'silentlycontinue' | Out-Null}

$objForm = New-Object System.Windows.Forms.Form
$Nummer = New-Object System.Windows.Forms.TextBox
$CancelButton = New-Object System.Windows.Forms.Button
$OKButton = New-Object System.Windows.Forms.Button
$OK2Button = New-Object System.Windows.Forms.Button
$Global:textBoxN1 = New-Object System.Windows.Forms.TextBox
$Global:textBoxN2 = New-Object System.Windows.Forms.TextBox
$Global:textBoxN3 = New-Object System.Windows.Forms.TextBox
$Global:textBoxN4 = New-Object System.Windows.Forms.TextBox
$Global:textBoxN5 = New-Object System.Windows.Forms.TextBox
$Global:textBox1 = New-Object System.Windows.Forms.TextBox
$Global:textBox2 = New-Object System.Windows.Forms.TextBox
$Global:textBox3 = New-Object System.Windows.Forms.TextBox
$Global:textBox4 = New-Object System.Windows.Forms.TextBox
$Global:textBox5 = New-Object System.Windows.Forms.TextBox

$Global:X =Get-Content "$PATH\X.txt" -erroraction 'silentlycontinue'
$Global:User=Get-Content "$PATH\Username.txt" -erroraction 'silentlycontinue'
$Global:Password=Get-Content "$PATH\Password.txt" -erroraction 'silentlycontinue'
$Global:IP=Get-Content "$PATH\IP.txt" -erroraction 'silentlycontinue'
$Global:T1 =Get-Content "$PATH\F1.PS1" -erroraction 'silentlycontinue'
$Global:T2 =Get-Content "$PATH\F2.txt" -erroraction 'silentlycontinue'
$Global:T3 =Get-Content "$PATH\F3.txt" -erroraction 'silentlycontinue'
$Global:T4 =Get-Content "$PATH\F4.txt" -erroraction 'silentlycontinue'
$Global:T5 =Get-Content "$PATH\F5.txt" -erroraction 'silentlycontinue'
$Global:Tn1 =Get-Content "$PATH\Fn1.txt" -erroraction 'silentlycontinue'
$Global:Tn2 =Get-Content "$PATH\Fn2.txt" -erroraction 'silentlycontinue'
$Global:Tn3 =Get-Content "$PATH\Fn3.txt" -erroraction 'silentlycontinue'
$Global:Tn4 =Get-Content "$PATH\Fn4.txt" -erroraction 'silentlycontinue'
$Global:Tn5 =Get-Content "$PATH\Fn5.txt" -erroraction 'silentlycontinue'
$Global:VW =Get-Content "$PATH\VW.txt" -erroraction 'silentlycontinue'
$statusStrip      = New-Object System.Windows.Forms.StatusStrip
$statusLabel      = New-Object System.Windows.Forms.ToolStripStatusLabel
$neta =Get-Content "$PATH\Nummern.txt" -erroraction 'silentlycontinue'
[array]::Reverse($neta)
$screenwidth = [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Width
$screenheight = [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea.Height




if ($Global:X -eq "1"){
$objForm.StartPosition = "CenterScreen"
}

else{
$objForm.Size = New-Object System.Drawing.Size(275,250)
$objForm.StartPosition = "Manual"
$objForm.Top = $screenheight - $objForm.Height
$objForm.Left = $screenwidth - $objForm.Width
$objform.ControlBox = $false
$objForm.TopMost = $true
}
$Global:C = "White"
$Global:C = Get-Content "$PATH\C.txt" -erroraction 'silentlycontinue'

$Global:C1=@("White","DimGray","DarkGray","DarkKhaki")

if ($Global:C -lt 0){
$Global:C="White"
}

#$objForm.StartPosition = "CenterScreen"
$objForm.FormBorderStyle = 'Fixed3D'
$objForm.MaximizeBox = $Formalse


$statusStrip.Items.Add($statusLabel) | Out-Null
$statusLabel.AutoSize  = $true
$statusLabel.Backcolor=$Global:C
$statusStrip.Backcolor=$Global:C
$statusLabel.Text      = "Ready"
$statusLabel.Text ="by Kilian Schwarz v.5.3.2"
$objForm.Controls.Add($statusStrip)

#progres bar
#$progressBar = New-Object System.Windows.Forms.ProgressBar
#$progressBar.Name = 'ProgressBar'
#$progressBar.Value = 50
#$progressBar.Style = "Continuous"
#$progressBar.Location = New-Object System.Drawing.Size (0,250)
#$progressBar.Size = New-Object System.Drawing.Size (290,20)
#$objForm.Controls.Add($progressBar)

$objForm.Backcolor=$Global:C

function a {

$Nummer.Text = $Nummer.Text.replace("+49","0")
$Nummer.Text = $Nummer.Text.replace("-","")
$Nummer.Text = $Nummer.Text.replace("/","")
$Nummer.Text = $Nummer.Text.replace("(0)","")
$Nummer.Text = $Nummer.Text.replace("\","")
$Nummer.Text = $Nummer.Text -replace '\s','' 

$Nummer.Text >> "$PATH\Nummern.txt"





if($Nummer.Text[0] -eq "0"){
$Global:TELE=$Global:VW + $Nummer.Text
}
else{
if($Nummer.Text[0] -eq "+"){
$Global:TELE=$Global:VW + $Nummer.Text
}
else{
$Global:TELE=$Nummer.Text
}
}



$url


try {
$Capture = $null
$WC = $null
$url = "http://" + $Global:IP + "/command.htm?number=" + $Global:TELE + "&outgoing_uri=123@domain1"
$WC = New-Object System.Net.WebClient
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$false}
$WC.Credentials = New-Object System.Net.NetworkCredential($Global:User,$Global:Password)
$Null = $WC.Downloaddata($url)
}
catch [Net.WebException] {
 OUT-NULL
} 


$neta =Get-Content "$PATH\Nummern.txt" -erroraction 'silentlycontinue'
[array]::Reverse($neta)

}

############################################################################################################################################################################################################

$menuMain         = New-Object System.Windows.Forms.MenuStrip
$menuFile         = New-Object System.Windows.Forms.ToolStripMenuItem
$menuPSTool1      = New-Object System.Windows.Forms.ToolStripMenuItem
$menuPSTool2      = New-Object System.Windows.Forms.ToolStripMenuItem
$menuPSTool3      = New-Object System.Windows.Forms.ToolStripMenuItem
$menuExit         = New-Object System.Windows.Forms.ToolStripMenuItem
$menuF            = New-Object System.Windows.Forms.ToolStripMenuItem
$menuF1            = New-Object System.Windows.Forms.ToolStripMenuItem
$menuF2            = New-Object System.Windows.Forms.ToolStripMenuItem
$menuF3            = New-Object System.Windows.Forms.ToolStripMenuItem
$menuF4            = New-Object System.Windows.Forms.ToolStripMenuItem
$menuF5            = New-Object System.Windows.Forms.ToolStripMenuItem



#$iconPS   = [Drawing.Icon]::ExtractAssociatedIcon((Get-Command powershell).Path)

# Main Menu Bar
[void]$objForm.Controls.Add($menuMain)
$menuMain.Backcolor=$Global:C
# Menu Options - File
$menuFile.Text = "&Option"
$menuFile.Backcolor=$Global:C
[void]$menuMain.Items.Add($menuFile)

# Menu Options - File / Exit
#$menuPSTool1.Image        = [System.IconExtractor]::Extract("shell32.dll ", 149, $true) | Out-Null
$menuPSTool1.ShortcutKeys = "Control, S"
$menuPSTool1.Text = "Account Settings"
$menuPSTool1.Add_Click({ASettings})
$menuPSTool1.Backcolor=$Global:C
[void]$menuFile.DropDownItems.Add($menuPSTool1)

$menuPSTool2.ShortcutKeys = "Control, F"
$menuPSTool2.Text = "Favorite list"
$menuPSTool2.Add_Click({FSettings})
$menuPSTool2.Backcolor=$Global:C
[void]$menuFile.DropDownItems.Add($menuPSTool2)

$menuPSTool3.ShortcutKeys = "Control, O"
$menuPSTool3.Text = "Option"
$menuPSTool3.Backcolor=$Global:C
$menuPSTool3.Add_Click({OSettings})
[void]$menuFile.DropDownItems.Add($menuPSTool3)

$menuF.Text = "&Favoriten"
[void]$menuMain.Items.Add($menuF)








function OSettings{


$objForm = New-Object System.Windows.Forms.Form
$objForm.Size = New-Object System.Drawing.Size(275,250)
$objForm.FormBorderStyle = 'Fixed3D'
$objform.ControlBox = $false
$objForm.Text = "Adapter Settings"
$objForm.Backcolor=$Global:C
#$objForm.icon = [System.IconExtractor]::Extract("shell32.dll ", 149, $true) | Out-Null
$objForm.Size = New-Object System.Drawing.Size(300,200)
$SetokButton = New-Object System.Windows.Forms.Button


$AbbruchButton = New-Object System.Windows.Forms.Button


$objLabel1 = New-Object System.Windows.Forms.Label
$objLabel1.Location = New-Object System.Drawing.Size(20,13)
$objLabel1.Size = New-Object System.Drawing.Size(60,15)
$objLabel1.Text = "Anheften:"
$objForm.Controls.Add($objLabel1)

$objLabel2 = New-Object System.Windows.Forms.Label
$objLabel2.Location = New-Object System.Drawing.Size(20,43)
$objLabel2.Size = New-Object System.Drawing.Size(60,15)
$objLabel2.Text = "Theme:"
$objForm.Controls.Add($objLabel2)


$SetaButton = New-Object System.Windows.Forms.Button

$SetaButton.Location = New-Object System.Drawing.Size(100,10)
$SetaButton.Size = New-Object System.Drawing.Size(50,23)
$SetaButton.Text = "Ja"
$SetaButton.Name = "JA"
$SetaButton.Add_Click({
$Global:X = "0"
$SetbButton.Backcolor=$Global:C
$SetaButton.Backcolor="Green"
})
$objForm.Controls.Add($SetaButton)

$SetbButton = New-Object System.Windows.Forms.Button

$SetbButton.Location = New-Object System.Drawing.Size(160,10)
$SetbButton.Size = New-Object System.Drawing.Size(50,23)
$SetbButton.Text = "Nein"
$SetbButton.Name = "NEIN"
$SetbButton.Add_Click({

$SetbButton.Backcolor="Green"
$SetaButton.Backcolor=$Global:C

$Global:X = "1"
})
$objForm.Controls.Add($SetbButton)



if ($Global:X -eq "1"){
$SetbButton.Backcolor="Green"
$SetaButton.Backcolor=$Global:C
}

else{
$SetbButton.Backcolor=$Global:C
$SetaButton.Backcolor="Green"
}



$Dropdown2 = New-Object system.windows.Forms.ComboBox
$Dropdown2.BackColor = "White"
$DropDown2.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$Dropdown2.Width = 110
$Dropdown2.Height = 5
$Dropdown2.location = new-object system.drawing.point(100,40)
$DropDown2.items.addrange($Global:C1)
$DropDown2.SelectedItem = $Global:C
$objForm.controls.Add($Dropdown2)



$SetokButton.Backcolor=$Global:C
$SetokButton.Location = New-Object System.Drawing.Size(50,130)
$SetokButton.Size = New-Object System.Drawing.Size(75,23)
$SetokButton.Text = "OK"
$SetokButton.Name = "OK"
$SetokButton.Add_Click({

$Global:X> "$PATH\X.txt"
$Global:C=$DropDown2.text
$Global:C>"$PATH\C.txt"
$objForm.Close()
})
$objForm.Controls.Add($SetokButton)
$AbbruchButton.Backcolor=$Global:C
$AbbruchButton.Location = New-Object System.Drawing.Size(150,130)
$AbbruchButton.Size = New-Object System.Drawing.Size(75,23)
$AbbruchButton.Text = "Abbruch"
$AbbruchButton.Name = "Abbruch"
$AbbruchButton.Add_Click({$objForm.Close()})
$objForm.Controls.Add($AbbruchButton)

[void] $objForm.ShowDialog()
}

function FSettings {


$objForm = New-Object System.Windows.Forms.Form
$objForm.StartPosition = "CenterScreen"
$objForm.FormBorderStyle = 'Fixed3D'
$objform.ControlBox = $false
$objForm.Text = "Adapter Settings"
$objForm.Backcolor=$Global:C
#$objForm.icon = [System.IconExtractor]::Extract("shell32.dll ", 149, $true) | Out-Null
$objForm.Size = New-Object System.Drawing.Size(300,150)
$SetokButton = New-Object System.Windows.Forms.Button
$SSetokButton = New-Object System.Windows.Forms.Button
$AbbruchButton = New-Object System.Windows.Forms.Button

$objLabel1 = New-Object System.Windows.Forms.Label
$objLabel1.Location = New-Object System.Drawing.Size(50,10)
$objLabel1.Size = New-Object System.Drawing.Size(100,15)
$objLabel1.Text = "Name"
$objForm.Controls.Add($objLabel1)

$objLabel2 = New-Object System.Windows.Forms.Label
$objLabel2.Location = New-Object System.Drawing.Size(150,10)
$objLabel2.Size = New-Object System.Drawing.Size(100,15)
$objLabel2.Text = "Nummer"
$objForm.Controls.Add($objLabel2)



$textBoxN1 = New-Object System.Windows.Forms.TextBox
$textBoxN1.Location = New-Object System.Drawing.Point(50,30)
$textBoxN1.Size = New-Object System.Drawing.Size(90,20)
$objForm.Controls.Add($textBoxN1)

$textBox1 = New-Object System.Windows.Forms.TextBox
$textBox1.Location = New-Object System.Drawing.Point(150,30)
$textBox1.Size = New-Object System.Drawing.Size(90,20)
$objForm.Controls.Add($textBox1)


$textBox1.Backcolor=$Global:C

$textBoxN1.Backcolor=$Global:C


$SSetokButton.Backcolor=$Global:C
$SSetokButton.Location = New-Object System.Drawing.Size(30,30)
$SSetokButton.Size = New-Object System.Drawing.Size(15,15)
$SSetokButton.Text = "+"
$SSetokButton.Name = "+"
$SSetokButton.Add_Click({
$namess = $textBoxN1.Text
$nummers = $textBox1.Text
$names = $namess.replace(" ","")

$favorit="


`$$names = New-Object System.Windows.Forms.ToolStripMenuItem
`$$names`.Text= `"$namess`"
`$$names`.Backcolor=`$Global:C
`$$names`.Add_Click({
`$Nummer.Text= $nummers
a
`$objForm.Refresh()})
[void]`$menuF.DropDownItems.Add(`$$names)

"

$favorit >> "$PATH\F1.PSM1"
})
$objForm.Controls.Add($SSetokButton)

$SetokButton.Backcolor=$Global:C
$SetokButton.Location = New-Object System.Drawing.Size(50,80)
$SetokButton.Size = New-Object System.Drawing.Size(75,23)
$SetokButton.Text = "OK"
$SetokButton.Name = "OK"
$SetokButton.Add_Click({


$objForm.Close()
})
$objForm.Controls.Add($SetokButton)
$AbbruchButton.Backcolor=$Global:C
$AbbruchButton.Location = New-Object System.Drawing.Size(150,80)
$AbbruchButton.Size = New-Object System.Drawing.Size(75,23)
$AbbruchButton.Text = "Abbruch"
$AbbruchButton.Name = "Abbruch"
$AbbruchButton.Add_Click({$objForm.Close()

})
$objForm.Controls.Add($AbbruchButton)

[void] $objForm.ShowDialog()
}





function ASettings {


$objForm = New-Object System.Windows.Forms.Form
$objForm.StartPosition = "CenterScreen"
$objForm.FormBorderStyle = 'Fixed3D'
$objform.ControlBox = $false
$objForm.Text = "Adapter Settings"
$objForm.Backcolor=$Global:C
#$objForm.icon = [System.IconExtractor]::Extract("shell32.dll ", 149, $true) | Out-Null
$objForm.Size = New-Object System.Drawing.Size(300,200)
$SetokButton = New-Object System.Windows.Forms.Button
$AbbruchButton = New-Object System.Windows.Forms.Button



$textBox1 = New-Object System.Windows.Forms.TextBox
$textBox1.Location = New-Object System.Drawing.Point(150,10)
$textBox1.Size = New-Object System.Drawing.Size(120,20)
$objForm.Controls.Add($textBox1)

$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox2.Location = New-Object System.Drawing.Point(150,40)
$textBox2.Size = New-Object System.Drawing.Size(120,20)
$objForm.Controls.Add($textBox2)

$textBox3 = New-Object System.Windows.Forms.TextBox
$textBox3.Location = New-Object System.Drawing.Point(150,70)
$textBox3.Size = New-Object System.Drawing.Size(120,20)
$textBox3.PasswordChar = '*'
$objForm.Controls.Add($textBox3)

$textBox4 = New-Object System.Windows.Forms.TextBox
$textBox4.Location = New-Object System.Drawing.Point(150,100)
$textBox4.Size = New-Object System.Drawing.Size(120,20)
$objForm.Controls.Add($textBox4)

$textBox1.Backcolor=$Global:C
$textBox2.Backcolor=$Global:C
$textBox3.Backcolor=$Global:C
$textBox4.Backcolor=$Global:C

$textBox1.Text=$Global:IP
$textBox2.Text=$Global:User
$textBox3.Text=$Global:Password
$textBox4.Text=$Global:VW

$objLabel1 = New-Object System.Windows.Forms.Label
$objLabel1.Location = New-Object System.Drawing.Size(20,13)
$objLabel1.Size = New-Object System.Drawing.Size(100,15)
$objLabel1.Text = "Telephone IP:"
$objForm.Controls.Add($objLabel1)

$objLabel2 = New-Object System.Windows.Forms.Label
$objLabel2.Location = New-Object System.Drawing.Size(20,43)
$objLabel2.Size = New-Object System.Drawing.Size(100,15)
$objLabel2.Text = "Nutzername:"
$objForm.Controls.Add($objLabel2)

$objLabel3 = New-Object System.Windows.Forms.Label
$objLabel3.Location = New-Object System.Drawing.Size(20,73)
$objLabel3.Size = New-Object System.Drawing.Size(100,15)
$objLabel3.Text = "Password:"
$objForm.Controls.Add($objLabel3)

$objLabel4 = New-Object System.Windows.Forms.Label
$objLabel4.Location = New-Object System.Drawing.Size(20,103)
$objLabel4.Size = New-Object System.Drawing.Size(100,15)
$objLabel4.Text = "Auto Vorwahl:"
$objForm.Controls.Add($objLabel4)



$SetokButton.Backcolor=$Global:C
$SetokButton.Location = New-Object System.Drawing.Size(50,130)
$SetokButton.Size = New-Object System.Drawing.Size(75,23)
$SetokButton.Text = "OK"
$SetokButton.Name = "OK"
$SetokButton.Add_Click({

$Global:IP=$textBox1.Text
$Global:User=$textBox2.Text
$Global:Password=$textBox3.Text
$Global:VW=$textBox4.Text

$Global:User> "$PATH\Username.txt"
$Global:Password> "$PATH\Password.txt"
$Global:IP> "$PATH\IP.txt"
$Global:VW> "$PATH\VW.txt"

$objForm.Close()
})
$objForm.Controls.Add($SetokButton)
$AbbruchButton.Backcolor=$Global:C
$AbbruchButton.Location = New-Object System.Drawing.Size(150,130)
$AbbruchButton.Size = New-Object System.Drawing.Size(75,23)
$AbbruchButton.Text = "Abbruch"
$AbbruchButton.Name = "Abbruch"
$AbbruchButton.Add_Click({$objForm.Close()})
$objForm.Controls.Add($AbbruchButton)

[void] $objForm.ShowDialog()
}


############################################################################################################################################################################################################




$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(50,30)
$objLabel.Size = New-Object System.Drawing.Size(70,20)
$objLabel.Text = "Nummer"
$objForm.Controls.Add($objLabel)


#$Nummer.Location = New-Object System.Drawing.Size(50,100)
#$Nummer.Size = New-Object System.Drawing.Size(200,20)
#$objForm.Controls.Add($Nummer)

$Nummer = New-Object system.windows.Forms.ComboBox
$Nummer.BackColor = $Global:C
$Nummer.Size = New-Object System.Drawing.Size(175,20)
$Nummer.location = new-object system.drawing.point(50,50)
$Nummer.items.addrange($neta) 
$objForm.controls.Add($Nummer)





$OK2Button.Location = New-Object System.Drawing.Size(100,170)
$OK2Button.Size = New-Object System.Drawing.Size(75,23)
$OK2Button.Text = "Aus Copy"
$OK2Button.Name = "Aus Copy"
$OK2Button.Backcolor="LightGreen"
$OK2Button.Add_Click({

$Nummer.text = Get-Clipboard

a

$objForm.Refresh()})
$objForm.Controls.Add($OK2Button)


while(1){

$Capture = $null
$WC = $null
$url = "http://" + $Global:IP + "/command.htm?key=DND"
$WC = New-Object System.Net.WebClient
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$WC.Credentials = New-Object System.Net.NetworkCredential($Global:User,$Global:Password)
$Capture = $WC.Downloaddata($url)
sleep 1
}

$DNDButton = New-Object System.Windows.Forms.Button
$DNDButton.Location = New-Object System.Drawing.Size(50,200)
$DNDButton.Size = New-Object System.Drawing.Size(75,23)
$DNDButton.Text = "DND"
$DNDButton.Name = "DND"
$DNDButton.Backcolor="RED"
$DNDButton.Add_Click({

$Capture = $null
$WC = $null
$url = "http://" + $Global:IP + "/command.htm?key=DND"
$WC = New-Object System.Net.WebClient
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$WC.Credentials = New-Object System.Net.NetworkCredential($Global:User,$Global:Password)
$Capture = $WC.Downloaddata($url)

})
$objForm.Controls.Add($DNDButton)

$VUButton = New-Object System.Windows.Forms.Button
$VUButton.Location = New-Object System.Drawing.Size(50,110)
$VUButton.Size = New-Object System.Drawing.Size(45,23)
$VUButton.Text = "+"
$VUButton.Name = "+"
$VUButton.Add_Click({

$Capture = $null
$WC = $null
$url = "http://" + $Global:IP + "/command.htm?key=VOLUME_UP"
$WC = New-Object System.Net.WebClient
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$WC.Credentials = New-Object System.Net.NetworkCredential($Global:User,$Global:Password)
$Capture = $WC.Downloaddata($url)

})
$objForm.Controls.Add($VUButton)

$VDButton = New-Object System.Windows.Forms.Button
$VDButton.Location = New-Object System.Drawing.Size(50,140)
$VDButton.Size = New-Object System.Drawing.Size(45,23)
$VDButton.Text = "-"
$VDButton.Name = "-"
$VDButton.Add_Click({

$Capture = $null
$WC = $null
$url = "http://" + $Global:IP + "/command.htm?key=VOLUME_DOWN"
$WC = New-Object System.Net.WebClient
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$WC.Credentials = New-Object System.Net.NetworkCredential($Global:User,$Global:Password)
$Capture = $WC.Downloaddata($url)

})
$objForm.Controls.Add($VDButton)






$HUButton = New-Object System.Windows.Forms.Button
$HUButton.Location = New-Object System.Drawing.Size(180,110)
$HUButton.Size = New-Object System.Drawing.Size(45,23)
$HUButton.Text = "✔"
$HUButton.Name = "✔"
$HUButton.Add_Click({

$Capture = $null
$WC = $null
$url = "http://" + $Global:IP + "/command.htm?key=OFFHOOK"
$WC = New-Object System.Net.WebClient
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$WC.Credentials = New-Object System.Net.NetworkCredential($Global:User,$Global:Password)
$Capture = $WC.Downloaddata($url)

})
$objForm.Controls.Add($HUButton)

$HDButton = New-Object System.Windows.Forms.Button
$HDButton.Location = New-Object System.Drawing.Size(180,140)
$HDButton.Size = New-Object System.Drawing.Size(45,23)
$HDButton.Text = "❌"
$HDButton.Name = "❌"
$HDButton.Add_Click({

$Capture = $null
$WC = $null
$url = "http://" + $Global:IP + "/command.htm?key=OFFHOOK"
$WC = New-Object System.Net.WebClient
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$WC.Credentials = New-Object System.Net.NetworkCredential($Global:User,$Global:Password)
$Capture = $WC.Downloaddata($url)

$Capture = $null
$WC = $null
$url = "http://" + $Global:IP + "/command.htm?key=ONHOOK"
$WC = New-Object System.Net.WebClient
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$WC.Credentials = New-Object System.Net.NetworkCredential($Global:User,$Global:Password)
$Capture = $WC.Downloaddata($url)

})
$objForm.Controls.Add($HDButton)



$TButton = New-Object System.Windows.Forms.Button
$TButton.Location = New-Object System.Drawing.Size(100,110)
$TButton.Size = New-Object System.Drawing.Size(75,23)
$TButton.Text = "Transfer"
$TButton.Name = "Transfer"
$TButton.Add_Click({

$Capture = $null
$WC = $null
$url = "http://" + $Global:IP + "/command.htm?key=TRANSFER"
$WC = New-Object System.Net.WebClient
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$WC.Credentials = New-Object System.Net.NetworkCredential($Global:User,$Global:Password)
$Capture = $WC.Downloaddata($url)

})
$objForm.Controls.Add($TButton)


$HButton = New-Object System.Windows.Forms.Button
$HButton.Location = New-Object System.Drawing.Size(100,140)
$HButton.Size = New-Object System.Drawing.Size(75,23)
$HButton.Text = "Hold"
$HButton.Name = "Hold"
$HButton.Add_Click({

$Capture = $null
$WC = $null
$url = "http://" + $Global:IP + "/command.htm?key=F_HOLD"
$WC = New-Object System.Net.WebClient
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$WC.Credentials = New-Object System.Net.NetworkCredential($Global:User,$Global:Password)
$Capture = $WC.Downloaddata($url)

})
$objForm.Controls.Add($HButton)







$OKButton.Location = New-Object System.Drawing.Size(100,80)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = "Anrufen"
$OKButton.Name = "Anrufen"
$OKButton.Backcolor="LightGreen"
$OKButton.Add_Click({a
$objForm.Refresh()})
$objForm.Controls.Add($OKButton)




# Die nächsten beiden Zeilen legen die Position und die Größe des Buttons fest
$CancelButton.Location = New-Object System.Drawing.Size(150,200)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = "EXIT"
$CancelButton.Name = "Abbrechen"
$CancelButton.DialogResult = "Cancel"
#Die folgende Zeile ordnet dem Click-Event die Schließen-Funktion für das Formular zu
$CancelButton.Add_Click({$objForm.Close()})
$objForm.Controls.Add($CancelButton)


Import-Module "$PATH\F1.PSM1"



[void] $objForm.ShowDialog()

