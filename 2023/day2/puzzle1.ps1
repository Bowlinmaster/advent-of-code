#Get the input
$in = Get-Content .\input.txt

$idSum = 0;

$maxRed = 12;
$maxGreen = 13;
$maxBlue = 14;

$in | ForEach-Object {
    #We need to do some splitting up
    $res = $_.ToString().Split(":");
    $gameID = $res[0] -replace "[^\d]","";

    #Now get the subsets within a game
    $subsets = $res[1].Split(";");

    $thisIsAValidGame = $true;
    #Now I need to get the number and colors within each
    $subsets | ForEach-Object {
        #Write-Host $_
        $cubes = $_.Split(",");
        $cubes | ForEach-Object {
            $number = $_ -replace "[^\d]","";
            $color = $_ -replace "[^a-z]","";
            #Write-Host $number $color
            if($color -eq "red"){
                if([int]$number -gt $maxRed){
                    #Write-Host "This is no longer a valid game because of red"
                    $thisIsAValidGame = $false
                }
            }
            elseif($color -eq "green"){
                if([int]$number -gt $maxGreen){ 
                    #Write-Host "This is no longer a valid game because of green"
                    $thisIsAValidGame = $false
                }
            }
            elseif($color -eq "blue"){
                if([int]$number -gt $maxBlue){ 
                    #Write-Host "This is no longer a valid game because of blue"
                    $thisIsAValidGame = $false
                }
            }
        }
    }

    if($thisIsAValidGame){
        #Write-Host "This is a valid game"
        $idSum += $gameID
    }
    #Write-Host $gameID
}

Write-Host $idSum