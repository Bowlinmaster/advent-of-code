#Get the input
$rawIn = Get-Content .\input.txt

function isDigit($character){
    return $character -match "\d";
}

function isSymbol($character){
    return (($character -notmatch "\d") -and ($character -ne "."));
}

function checkSurrounding($matrix, $x, $y){
    $MaxRows = $matrix.Length;
    $MaxRowSize = $matrix[0].Length;
    #Write-Host "rows: $MaxRows length: $MaxRowSize x:$x y:$y";
    #Check left x-1, y
    if($x-1 -ge 0){
        #good to check
        #Write-Host "Checking left";
        if(isSymbol($matrix[$y][$x-1])){ return $true; }
    }
    #Check right x+1, y
    if($x+1 -lt $MaxRowSize){
        #good to check
        #Write-Host "Checking right";
        if(isSymbol($matrix[$y][$x+1])){ return $true; }
    }
    #Check up x, y-1
    if($y-1 -ge 0){
        #good to check
        #Write-Host "Checking up";
        if(isSymbol($matrix[$y-1][$x])){ return $true; }
    }
    #Check down x, y+1
    if($y+1 -lt $MaxRows){
        #good to check
        #Write-Host "Checking down";
        if(isSymbol($matrix[$y+1][$x])){ return $true; }
    }
    #Check upperleft x-1, y-1
    if(($x-1 -ge 0) -and ($y-1 -ge 0)){
        #good to check
        #Write-Host "Checking upperleft";
        if(isSymbol($matrix[$y-1][$x-1])){ return $true; }
    }
    #Check upperright x+1, y-1
    if(($x+1 -lt $MaxRowSize) -and ($y-1 -ge 0)){
        #good to check
        #Write-Host "Checking upperright";
        if(isSymbol($matrix[$y-1][$x+1])){ return $true; }
    }
    #Check downleft x-1, y+1
    if(($x-1 -ge 0) -and ($y+1 -lt $MaxRows)){
        #good to check
        #Write-Host "Checking downleft";
        if(isSymbol($matrix[$y+1][$x-1])){ return $true; }
    }
    #check downright x+1, y+1
    if(($x+1 -lt $MaxRowSize) -and ($y+1 -lt $MaxRows)){
        #good to check
        #Write-Host "Checking downright";
        if(isSymbol($matrix[$y+1][$x+1])){ return $true; }
    }
    return $false;
    
}

#We'll go through this problem very algorithmically... 

$finalSum = 0;
#y max
$totalNumberOfLines = $rawIn.Length;
#x max
$lineLength = $rawIn[0].Length;

#Loop through all the rows
for($y = 0; $y -lt $totalNumberOfLines; $y++){
    $currentNumber = "";
    $buildingUpCurrentNumber = $false;
    $foundASymbolAroundCurrentNumber = $false;
    #Loop through all the characters
    for($x = 0; $x -lt $lineLength; $x++){
        #Check and see if the character is a digit
        if(isDigit $rawIn[$y][$x]){
            #If it is, make sure we flag that we're building up a number
            $buildingUpCurrentNumber = $true;
            if(checkSurrounding $rawIn $x $y){
                $foundASymbolAroundCurrentNumber = $true;
            }
            $currentNumber += $rawIn[$y][$x];
        }
        else{
            #if the character isn't a number, then check and see if we were building up a number
            if($buildingUpCurrentNumber){
                #if we were building up a number then...
                #We've finished processing a number, if we've found a symbol around this number, then go ahead and add it to the total
                if($foundASymbolAroundCurrentNumber){
                    $finalSum += [int]$currentNumber;
                }
            }
            #Reset the current number stuff
            $currentNumber = "";
            $buildingUpCurrentNumber = $false;
            $foundASymbolAroundCurrentNumber = $false;
        }
    }
    #Handle the edge case for a number at the end of a line
    if($buildingUpCurrentNumber){
        if($foundASymbolAroundCurrentNumber){
            $finalSum += [int]$currentNumber;
        }
    }
    
}
Write-Host $finalSum