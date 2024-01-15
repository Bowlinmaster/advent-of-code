#Get the input
$rawIn = Get-Content .\input.txt

function isDigit($character){
    return $character -match "\d";
}

function isSymbol($character){
    return (($character -notmatch "\d") -and ($character -ne "."));
}

function isStar($character){
    return (($character -notmatch "\d") -and ($character -eq "*"));
}

function checkSurrounding($matrix, $x, $y){
    $MaxRows = $matrix.Length;
    $MaxRowSize = $matrix[0].Length;
    #Check left x-1, y
    if($x-1 -ge 0){
        #good to check
        if(isDigit($matrix[$y][$x-1])){ return $true; }
    }
    #Check right x+1, y
    if($x+1 -lt $MaxRowSize){
        #good to check
        if(isDigit($matrix[$y][$x+1])){ return $true; }
    }
    #Check up x, y-1
    if($y-1 -ge 0){
        #good to check
        if(isDigit($matrix[$y-1][$x])){ return $true; }
    }
    #Check down x, y+1
    if($y+1 -lt $MaxRows){
        #good to check
        if(isDigit($matrix[$y+1][$x])){ return $true; }
    }
    #Check upperleft x-1, y-1
    if(($x-1 -ge 0) -and ($y-1 -ge 0)){
        #good to check
        if(isDigit($matrix[$y-1][$x-1])){ return $true; }
    }
    #Check upperright x+1, y-1
    if(($x+1 -lt $MaxRowSize) -and ($y-1 -ge 0)){
        #good to check
        if(isDigit($matrix[$y-1][$x+1])){ return $true; }
    }
    #Check downleft x-1, y+1
    if(($x-1 -ge 0) -and ($y+1 -lt $MaxRows)){
        #good to check
        if(isDigit($matrix[$y+1][$x-1])){ return $true; }
    }
    #check downright x+1, y+1
    if(($x+1 -lt $MaxRowSize) -and ($y+1 -lt $MaxRows)){
        #good to check

        if(isDigit($matrix[$y+1][$x+1])){ return $true; }
    }
    return $false;
    
}

function checkLeft($matrix, $x, $y){
    $MaxRows = $matrix.Length;
    $MaxRowSize = $matrix[0].Length;
    #Check left x-1, y
    if($x-1 -ge 0){
        #good to check
        if(isDigit($matrix[$y][$x-1])){ return $true; }
    }
    return $false;
}
function checkRight($matrix, $x, $y){
    $MaxRows = $matrix.Length;
    $MaxRowSize = $matrix[0].Length;
    #Check right x+1, y
    if($x+1 -lt $MaxRowSize){
        #good to check
        if(isDigit($matrix[$y][$x+1])){ return $true; }
    }
    return $false;
}
function checkUp($matrix, $x, $y){
    $MaxRows = $matrix.Length;
    $MaxRowSize = $matrix[0].Length;
    #Check up x, y-1
    if($y-1 -ge 0){
        #good to check
        if(isDigit($matrix[$y-1][$x])){ return $true; }
    }
    return $false;
}
function checkDown($matrix, $x, $y){
    $MaxRows = $matrix.Length;
    $MaxRowSize = $matrix[0].Length;
    #Check down x, y+1
    if($y+1 -lt $MaxRows){
        #good to check
        if(isDigit($matrix[$y+1][$x])){ return $true; }
    }
    return $false;
}
function checkUpperLeft($matrix, $x, $y){
    $MaxRows = $matrix.Length;
    $MaxRowSize = $matrix[0].Length;
    #Check upperleft x-1, y-1
    if(($x-1 -ge 0) -and ($y-1 -ge 0)){
        #good to check
        if(isDigit($matrix[$y-1][$x-1])){ return $true; }
    }
    return $false;
}
function checkUpperRight($matrix, $x, $y){
    $MaxRows = $matrix.Length;
    $MaxRowSize = $matrix[0].Length;
    #Check upperright x+1, y-1
    if(($x+1 -lt $MaxRowSize) -and ($y-1 -ge 0)){
        #good to check
        if(isDigit($matrix[$y-1][$x+1])){ return $true; }
    }
    return $false;
}
function checkDownLeft($matrix, $x, $y){
    $MaxRows = $matrix.Length;
    $MaxRowSize = $matrix[0].Length;
    #Check downleft x-1, y+1
    if(($x-1 -ge 0) -and ($y+1 -lt $MaxRows)){
        #good to check
        if(isDigit($matrix[$y+1][$x-1])){ return $true; }
    }
    return $false;
}
function checkDownRight($matrix, $x, $y){
    $MaxRows = $matrix.Length;
    $MaxRowSize = $matrix[0].Length;
    #check downright x+1, y+1
    if(($x+1 -lt $MaxRowSize) -and ($y+1 -lt $MaxRows)){
        #good to check

        if(isDigit($matrix[$y+1][$x+1])){ return $true; }
    }
    return $false;
}

function getNumberUp($matrix, $x, $y){
    $firstNumber = "";
    if((checkUpperLeft $matrix $x $y) -and (checkUpperRight $matrix $x $y)){
        $firstNumber += $matrix[$y-1][$x-1] + $matrix[$y-1][$x] + $matrix[$y-1][$x+1]
    }
    elseif(checkUpperLeft $rawIn $x $y){
        $firstNumber += $matrix[$y-1][$x-2] + $matrix[$y-1][$x-1] + $matrix[$y-1][$x]
    }
    else{
        $firstNumber += $matrix[$y-1][$x] + $matrix[$y-1][$x+1] + $matrix[$y-1][$x+2]
    }
    $firstNumber = $firstNumber -replace "\.",""
    return [int]$firstNumber
}
function getNumberDown($matrix, $x, $y){
    $firstNumber = "";
    if((checkDownLeft $matrix $x $y) -and (checkDownRight $matrix $x $y)){
        $firstNumber += $matrix[$y+1][$x-1] + $matrix[$y+1][$x] + $matrix[$y+1][$x+1]
    }
    elseif(checkDownLeft $rawIn $x $y){
        $firstNumber += $matrix[$y+1][$x-2] + $matrix[$y+1][$x-1] + $matrix[$y+1][$x]
    }
    else{
        $firstNumber += $matrix[$y+1][$x] + $matrix[$y+1][$x+1] + $matrix[$y+1][$x+2]
    }
    $firstNumber = $firstNumber -replace "\.",""
    return [int]$firstNumber
}
function getNumberLeft($matrix, $x, $y){
    $firstNumber = "";
    $firstNumber += $matrix[$y][$x-3] + $matrix[$y][$x-2] + $matrix[$y][$x-1]
    $firstNumber = $firstNumber -replace "\.",""
    return [int]$firstNumber
}
function getNumberRight($matrix, $x, $y){
    $firstNumber = "";
    $firstNumber += $matrix[$y][$x+1] + $matrix[$y][$x+2] + $matrix[$y][$x+3]
    $firstNumber = $firstNumber -replace "\.",""
    return [int]$firstNumber
}
function getNumberDownRight($matrix, $x, $y){
    $firstNumber = "";
    $firstNumber += $matrix[$y+1][$x+1] + $matrix[$y+1][$x+2] + $matrix[$y+1][$x+3]
    $firstNumber = $firstNumber -replace "\.",""
    return [int]$firstNumber
}
function getNumberDownLeft($matrix, $x, $y){
    $firstNumber = "";
    $firstNumber += $matrix[$y+1][$x-3] + $matrix[$y+1][$x-2] + $matrix[$y+1][$x-1]
    $firstNumber = $firstNumber -replace "\.",""
    return [int]$firstNumber
}
function getNumberUpRight($matrix, $x, $y){
    $firstNumber = "";
    $firstNumber += $matrix[$y-1][$x+1] + $matrix[$y-1][$x+2] + $matrix[$y-1][$x+3]
    $firstNumber = $firstNumber -replace "\.",""
    return [int]$firstNumber
}
function getNumberUpLeft($matrix, $x, $y){
    $firstNumber = "";
    $firstNumber += $matrix[$y-1][$x-3] + $matrix[$y-1][$x-2] + $matrix[$y-1][$x-1]
    $firstNumber = $firstNumber -replace "\.",""
    return [int]$firstNumber
}

$finalSum = 0;
#y max
$totalNumberOfLines = $rawIn.Length;
#x max
$lineLength = $rawIn[0].Length;

for($y = 0; $y -lt $totalNumberOfLines; $y++){
    for($x = 0; $x -lt $lineLength; $x++){
        if(isStar $rawIn[$y][$x]){
            #Now that we've found a star, we need to see if there are exactly 2 full numbers around it
            #A number can be all surrounding, BUT a number cannot be both (above|below) and (diagabove|diagbelow)
            if((checkUp $rawIn $x $y)){
                
                $secondNumber = 0;
                
                #Try and find get the first number
                $firstNumber = getNumberUp $rawIn $x $y
                Write-Host "Found a number $firstNumber above x:$x y:$y";
                #Now try and find the second number
                #check left
                if(checkLeft $rawIn $x $y){
                    $secondNumber = getNumberLeft $rawIn $x $y
                    Write-Host "Found a second number $secondNumber left x:$x y:$y";
                }
                #check down
                elseif(checkDown $rawIn $x $y){
                    $secondNumber = getNumberDown $rawIn $x $y
                    Write-Host "Found a second number $secondNumber down x:$x y:$y";
                }
                #check right
                elseif(checkRight $rawIn $x $y){
                    $secondNumber = getNumberRight $rawIn $x $y
                    Write-Host "Found a second number $secondNumber right x:$x y:$y";
                }
                #check downleft
                elseif(checkDownLeft $rawIn $x $y){
                    $secondNumber = getNumberDownLeft $rawIn $x $y
                    Write-Host "Found a second number $secondNumber downleft x:$x y:$y";
                }
                #check downright
                elseif(checkDownRight $rawIn $x $y){
                    $secondNumber = getNumberDownRight $rawIn $x $y
                    Write-Host "Found a second number $secondNumber downright x:$x y:$y";
                }
                
                $finalSum += $firstNumber * $secondNumber;
                
            }
            elseif((checkDown $rawIn $x $y)){
                $secondNumber = 0;
                $firstNumber = getNumberDown $rawIn $x $y
                Write-Host "Found a number $firstNumber below x:$x y:$y";
                #check left
                if(checkLeft $rawIn $x $y){
                    $secondNumber = getNumberLeft $rawIn $x $y
                    Write-Host "Found a second number $secondNumber left x:$x y:$y";
                }
                #check up
                elseif(checkUp $rawIn $x $y){
                    $secondNumber = getNumberUp $rawIn $x $y
                    Write-Host "Found a second number $secondNumber up x:$x y:$y";
                }
                #check right
                elseif(checkRight $rawIn $x $y){
                    $secondNumber = getNumberRight $rawIn $x $y
                    Write-Host "Found a second number $secondNumber right x:$x y:$y";
                }
                #check upleft
                elseif(checkUpperLeft $rawIn $x $y){
                    $secondNumber = getNumberUpLeft $rawIn $x $y
                    Write-Host "Found a second number $secondNumber upleft x:$x y:$y";
                }
                #check upright
                elseif(checkUpperRight $rawIn $x $y){
                    $secondNumber = getNumberUpRight $rawIn $x $y
                    Write-Host "Found a second number $secondNumber upright x:$x y:$y";
                }
                $finalSum += $firstNumber * $secondNumber;
            }
            elseif(checkLeft $rawIn $x $y){
                $secondNumber = 0;
                $firstNumber = getNumberLeft $rawIn $x $y
                Write-Host "Found a number $firstNumber left x:$x y:$y";
                if(checkUp $rawIn $x $y){
                    $secondNumber = getNumberUp $rawIn $x $y
                }
                elseif(checkDown $rawIn $x $y){
                    $secondNumber = getNumberDown $rawIn $x $y

                }
                elseif(checkRight $rawIn $x $y){
                    $secondNumber = getNumberRight $rawIn $x $y
                }
                elseif(checkUpperLeft $rawIn $x $y){
                    $secondNumber = getNumberUpLeft $rawIn $x $y
                }
                elseif(checkUpperRight $rawIn $x $y){
                    $secondNumber = getNumberUpRight $rawIn $x $y
                }
                elseif(checkDownLeft $rawIn $x $y){
                    $secondNumber = getNumberDownLeft $rawIn $x $y
                }
                elseif(checkDownRight $rawIn $x $y){
                    $secondNumber = getNumberDownRight $rawIn $x $y
                }
                $finalSum += $firstNumber * $secondNumber;
            }
            elseif(checkRight $rawIn $x $y){
                $secondNumber = 0;
                $firstNumber = getNumberRight $rawIn $x $y
                Write-Host "Found a number $firstNumber right x:$x y:$y";
                if(checkUp $rawIn $x $y){
                    $secondNumber = getNumberUp $rawIn $x $y
                }
                elseif(checkDown $rawIn $x $y){
                    $secondNumber = getNumberDown $rawIn $x $y
                }
                elseif(checkLeft $rawIn $x $y){
                    $secondNumber = getNumberLeft $rawIn $x $y
                }
                elseif(checkUpperLeft $rawIn $x $y){
                    $secondNumber = getNumberUpLeft $rawIn $x $y
                }
                elseif(checkUpperRight $rawIn $x $y){
                    $secondNumber = getNumberUpRight $rawIn $x $y
                }
                elseif(checkDownLeft $rawIn $x $y){
                    $secondNumber = getNumberDownLeft $rawIn $x $y
                }
                elseif(checkDownRight $rawIn $x $y){
                    $secondNumber = getNumberDownRight $rawIn $x $y
                }
                $finalSum += $firstNumber * $secondNumber;
            }
            elseif(checkUpperRight $rawIn $x $y){
                $secondNumber = 0;
                $firstNumber = getNumberUpRight $rawIn $x $y
                Write-Host "Found a number $firstNumber upright x:$x y:$y";
                if(checkRight $rawIn $x $y){
                    $secondNumber = getNumberRight $rawIn $x $y
                }
                elseif(checkDown $rawIn $x $y){
                    $secondNumber = getNumberDown $rawIn $x $y

                }
                elseif(checkLeft $rawIn $x $y){
                    $secondNumber = getNumberLeft $rawIn $x $y
                }
                elseif(checkUpperLeft $rawIn $x $y){
                    $secondNumber = getNumberUpLeft $rawIn $x $y
                }
                elseif(checkDownLeft $rawIn $x $y){
                    $secondNumber = getNumberDownLeft $rawIn $x $y
                }
                elseif(checkDownRight $rawIn $x $y){
                    $secondNumber = getNumberDownRight $rawIn $x $y
                }
                $finalSum += $firstNumber * $secondNumber;
            }
            elseif(checkUpperLeft $rawIn $x $y){
                $secondNumber = 0;
                $firstNumber = getNumberUpLeft $rawIn $x $y
                Write-Host "Found a number $firstNumber upleft x:$x y:$y";
                if(checkRight $rawIn $x $y){
                    $secondNumber = getNumberRight $rawIn $x $y
                }
                elseif(checkDown $rawIn $x $y){
                    $secondNumber = getNumberDown $rawIn $x $y

                }
                elseif(checkLeft $rawIn $x $y){
                    $secondNumber = getNumberLeft $rawIn $x $y
                }
                elseif(checkUpperRight $rawIn $x $y){
                    $secondNumber = getNumberUpRight $rawIn $x $y
                }
                elseif(checkDownLeft $rawIn $x $y){
                    $secondNumber = getNumberDownLeft $rawIn $x $y
                }
                elseif(checkDownRight $rawIn $x $y){
                    $secondNumber = getNumberDownRight $rawIn $x $y
                }
                $finalSum += $firstNumber * $secondNumber;
            }
            elseif(checkDownLeft $rawIn $x $y){
                $secondNumber = 0;
                $firstNumber = getNumberDownLeft $rawIn $x $y
                Write-Host "Found a number $firstNumber downleft x:$x y:$y";
                if(checkRight $rawIn $x $y){
                    $secondNumber = getNumberRight $rawIn $x $y
                }
                elseif(checkUp $rawIn $x $y){
                    $secondNumber = getNumberUp $rawIn $x $y

                }
                elseif(checkLeft $rawIn $x $y){
                    $secondNumber = getNumberLeft $rawIn $x $y
                }
                elseif(checkUpperRight $rawIn $x $y){
                    $secondNumber = getNumberUpRight $rawIn $x $y
                }
                elseif(checkUpperLeft $rawIn $x $y){
                    $secondNumber = getNumberUpLeft $rawIn $x $y
                }
                elseif(checkDownRight $rawIn $x $y){
                    $secondNumber = getNumberDownRight $rawIn $x $y
                }
                $finalSum += $firstNumber * $secondNumber;
            }
            elseif(checkDownRight $rawIn $x $y){
                $secondNumber = 0;
                $firstNumber = getNumberDownRight $rawIn $x $y
                Write-Host "Found a number $firstNumber downright x:$x y:$y";
                if(checkRight $rawIn $x $y){
                    $secondNumber = getNumberRight $rawIn $x $y
                }
                elseif(checkUp $rawIn $x $y){
                    $secondNumber = getNumberUp $rawIn $x $y

                }
                elseif(checkLeft $rawIn $x $y){
                    $secondNumber = getNumberLeft $rawIn $x $y
                }
                elseif(checkUpperRight $rawIn $x $y){
                    $secondNumber = getNumberUpRight $rawIn $x $y
                }
                elseif(checkUpperLeft $rawIn $x $y){
                    $secondNumber = getNumberUpLeft $rawIn $x $y
                }
                elseif(checkDownLeft $rawIn $x $y){
                    $secondNumber = getNumberDownLeft $rawIn $x $y
                }
                $finalSum += $firstNumber * $secondNumber;
            }
        }
    }
}

Write-Host $finalSum