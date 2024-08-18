 write-host $env:username
 Write-Host "`n`n"

$global:minecraftlocation = "C:\Users\" + $env:username + "\AppData\Roaming\.minecraft\mods"



$modsjar = $minecraftlocation + "\*.jar"

$modslist = Get-ChildItem -Path $modsjar -Name

Write-Host "`n`n"

$moddirnames = Get-ChildItem -Path $minecraftlocation -Directory -Name

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationCore,PresentationFramework

$iconBase64 = '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'
$iconBytes = [Convert]::FromBase64String($iconBase64)
$stream = [System.IO.MemoryStream]::new($iconBytes, 0, $iconBytes.Length)



$modmovermain_form = New-Object System.Windows.Forms.Form
$modmovermain_form.Size = New-Object System.Drawing.Size(245,300)
$modmovermain_form.Text = "Mod mover"
$modmovermain_form.BackColor = [System.Drawing.Color]::FromArgb(182,165,226)
$modmovermain_form.Icon = [System.Drawing.Icon]::FromHandle(([System.Drawing.Bitmap]::new($stream).GetHIcon()))

$title_label = New-Object System.Windows.Forms.Label
$title_label.Size = New-Object System.Drawing.Size(200,18)
$title_label.Location = New-Object System.Drawing.Size(27,15)
$title_label.Text = "         Choose a folder"
$title_label.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
$modmovermain_form.Controls.Add($title_label)

$DropDownBox = New-Object System.Windows.Forms.ComboBox
$DropDownBox.Location = New-Object System.Drawing.Size(20,45)
$DropDownBox.Size = New-Object System.Drawing.Size(185,20)
$DropDownBox.Height = 200
$modmovermain_form.Controls.Add($DropDownBox)

$copymods_button = New-Object System.Windows.Forms.button
$copymods_button.Size = New-Object System.Drawing.Size(120,30)
$copymods_button.Location = New-Object System.Drawing.Size(50,85)
$copymods_button.Text = "Replace mods"
$copymods_button.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
$modmovermain_form.Controls.Add($copymods_button)
$copymods_button.Add_click({copymods_func})


$backup_button = New-Object System.Windows.Forms.button
$backup_button.Size = New-Object System.Drawing.Size(120,30)
$backup_button.Location = New-Object System.Drawing.Size(50,135)
$backup_button.Text = "Backup mods"
$backup_button.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
$modmovermain_form.Controls.Add($backup_button)
$backup_button.Add_click({backupform_func})
function backupform_func {

    $backupconfirm_form = New-Object System.Windows.Forms.Form
    $backupconfirm_form.Size = New-Object System.Drawing.Size(195,180)
    $xlocation = $modmovermain_form.Location.X + 10
    $ylocation = $modmovermain_form.Location.Y + 10
    $backupconfirm_form.Location = New-Object System.Drawing.Size($xlocation, $ylocation)
    $backupconfirm_form.BackColor = [System.Drawing.Color]::FromArgb(198,127,139)

    $backupconfirm_label = New-Object System.Windows.Forms.Label
    $backupconfirm_label.Size = New-Object System.Drawing.Size(170,50)
    $backupconfirm_label.Location = New-Object System.Drawing.Size(15,10)
    $backupconfirm_label.Text = "do you want to backup all the mods (. jar files) that currently are in the mods folder?"
    $backupconfirm_form.Controls.Add($backupconfirm_label)

    $backupconfirm_textbox = New-Object System.Windows.Forms.TextBox
    $backupconfirm_textbox.Size = New-Object System.Drawing.Size(145,50)
    $backupconfirm_textbox.Location = New-Object System.Drawing.Size(15,60)
    $backupconfirm_textbox.Text = "put name here"
    $backupconfirm_form.Controls.Add($backupconfirm_textbox)

    $backupmake_button = New-Object System.Windows.Forms.button
    $backupmake_button.Size = New-Object System.Drawing.Size(120,30)
    $backupmake_button.Location = New-Object System.Drawing.Size(30,90)
    $backupmake_button.Text = "make backup"
    $backupmake_button.Font = New-Object System.Drawing.Font("Arial", 8)
    $backupmake_button.Add_click({makebackup_func})
    function makebackup_func {

    $modcollectionfolder = $minecraftlocation + "\" + $backupconfirm_textbox.Text

    write-host $modcollectionfolder

    mkdir $modcollectionfolder

    $modslist = Get-ChildItem -Path $modsjar -Name

    foreach($line in $modslist) {

    $newline = $minecraftlocation + "\" + $line

    $moddestination = $modcollectionfolder + "\" + $line


    Copy-Item $newline $moddestination

    


    }

    $oktext = 'Mods have been moved to the folder named ' + $backupconfirm_textbox.Text
    $backupmessagebox = [System.Windows.MessageBox]::Show($oktext)


    $backupconfirm_form.Close()


    }
    $backupconfirm_form.Controls.Add($backupmake_button)

    $result2 = $backupconfirm_form.ShowDialog()
}



function copymods_func {


    $copymodsconfirm = [System.Windows.MessageBox]::Show("This will replace the mods (.jar files) that are currently in the mods folder.`n`nDo you want to continue?","confirmation",4,32)
    Write-Host = $copymodsconfirm
    if ($copymodsconfirm -eq "No"){
        Write-Host ""
        
    } 
    if ($copymodsconfirm -eq "Yes"){
    

    $modslist = Get-ChildItem -Path $modsjar -Name

    foreach($line in $modslist){

    $newline = $minecraftlocation + "\" + $line

    del $newline

    }

    $foldermodspath = $minecraftlocation + "\" + $DropDownBox.SelectedItem

    write-host $foldermodspath

    $foldermodslist = Get-ChildItem -Path $foldermodspath -Name

    foreach($line in $foldermodslist){

        if($line -like "*.jar"){

        $foldermodjar = $foldermodspath + "\" + $line
        $jardestination = $minecraftlocation + "\" + $line

        Copy-Item $foldermodjar $jardestination
        }
        else{
            Write-Host "skipped non .jar file: " $line
        }
    

    }
    $modsarecopied = [System.Windows.MessageBox]::Show("The mods have been replaced!")
    }



}



$openmodsfolder_button = New-Object System.Windows.Forms.button
$openmodsfolder_button.Size = New-Object System.Drawing.Size(120,30)
$openmodsfolder_button.Location = New-Object System.Drawing.Size(50,210)
$openmodsfolder_button.Text = "Open mods folder"
$openmodsfolder_button.Font = New-Object System.Drawing.Font("Arial", 8)
$modmovermain_form.Controls.Add($openmodsfolder_button)
$openmodsfolder_button.Add_click({Invoke-Item $minecraftlocation})




$dropdowndetails = ""

foreach($line in $moddirnames){
    $dropdowndetails = $dropdowndetails + $line + ","
    

}
Write-Host $dropdowndetails

$dropdowndetails = $dropdowndetails.Substring(0, $dropdowndetails.Length - 1)

$Details = $dropdowndetails -split ","



foreach($Detail in $Details){
    #Write-Host $Detail
    $DropDownBox.Items.Add($Detail)

}


$result = $modmovermain_form.ShowDialog()