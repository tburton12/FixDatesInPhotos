[reflection.assembly]::loadfile( "C:\Windows\Microsoft.NET\Framework\v2.0.50727\System.Drawing.dll")
Clear-Host
$files = Get-ChildItem E:\Photos\*.*
ForEach ($file in $files) {
	
		# Print file name
	echo $file.fullname 
	
		#Get Date
	$foo=New-Object -TypeName system.drawing.bitmap -ArgumentList $file.fullname
	$date = $foo.GetPropertyItem(36867).value[0..9]
	$arYear = [Char]$date[0],[Char]$date[1],[Char]$date[2],[Char]$date[3]  
	$arMonth = [Char]$date[5],[Char]$date[6]  
	$arDay = [Char]$date[8],[Char]$date[9]  
	$strYear = [String]::Join('',$arYear)  
	$strMonth = [String]::Join('',$arMonth)   
	$strDay = [String]::Join('',$arDay)  

		# Get Time
	$time = $foo.GetPropertyItem(36867).value[11..18]
	$arHour = [Char]$time[0],[Char]$time[1]
	$arMinute = [Char]$time[3],[Char]$time[4]  
	$arSecond = [Char]$time[6],[Char]$time[7]  
	$strHour = [String]::Join('',$arHour)  
	$strMinute = [String]::Join('',$arMinute)   
	$strSecond = [String]::Join('',$arSecond)  

	$foo.dispose()
		
	$NewDate = (Get-Date -Year $strYear -Month $strMonth -Day $strDay -Hour $strHour -Minute $strMinute -Second $strSecond)
	
		#Set DateTaken as CreationTime 
	(Get-Item $file).CreationTime = $NewDate
	(Get-Item $file).LastWriteTime = $NewDate

}

echo ""
echo "Done"
pause
