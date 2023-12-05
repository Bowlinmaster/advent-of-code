#Get the input
$in = Get-Content .\input.txt

$powerSum = 0;

$in | ForEach-Object {
    #We need to do some splitting up
    $res = $_.ToString().Split(":");

    #Now get the subsets within a game
    $subsets = $res[1].Split(";");

    $maxRed = 0;
    $maxGreen = 0;
    $maxBlue = 0;

    #Now I need to get the number and colors within each
    $subsets | ForEach-Object {
        #Write-Host $_
        $cubes = $_.Split(",");
        $cubes | ForEach-Object {
            $number = $_ -replace "[^\d]","";
            $color = $_ -replace "[^a-z]","";
            if($color -eq "red"){
                if([int]$number -gt $maxRed){
                    $maxRed = [int]$number;
                }
            }
            elseif($color -eq "green"){
                if([int]$number -gt $maxGreen){ 
                    $maxGreen = [int]$number;
                }
            }
            elseif($color -eq "blue"){
                if([int]$number -gt $maxBlue){ 
                    $maxBlue = [int]$number;
                }
            }
        }
    }

    $powerSum += $maxRed * $maxGreen * $maxBlue

}

Write-Host $powerSum