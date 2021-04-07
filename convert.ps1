$xpath   = '/issues/issue/requestresponse/request[@base64=''false'']'
$xmlfilepath = "BurpOutput.xml"

[xml]$xml = Get-Content $xmlfilepath
$myfile = $xml.SelectNodes($xpath)

foreach($object in $myfile){
$object


$object.'#cdata-section'

$Text = $object.'#cdata-section'
if($Text.Length -ge 1){
$Bytes = [System.Text.Encoding]::UTF8.GetBytes($Text)
$EncodedText =[Convert]::ToBase64String($Bytes)

$EncodedText

$object.'#cdata-section' = $EncodedText
$object.base64 = "true"

}

}

$xpath1   = '/issues/issue/requestresponse/response[@base64=''false'']'

$myfile = $xml.SelectNodes($xpath1)

foreach($object in $myfile){
$object


$object.'#cdata-section'

$Text = $object.'#cdata-section'
if($Text.Length -ge 1){
$Bytes = [System.Text.Encoding]::UTF8.GetBytes($Text)
$EncodedText =[Convert]::ToBase64String($Bytes)

$EncodedText

$object.'#cdata-section' = $EncodedText
$object.base64 = "true"

}

}


$xml.Save($xmlfilepath)
