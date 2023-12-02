#Get the input
$in = Get-Content .\input.txt

$runningTotal = 0;

$in | ForEach-Object {
    #Strip out anything that's not a number
    $justTheNumber = $_ -replace "[^\d]", "";

    $theFinalNumber = "";
    
    #Now I just need the first and last digit

    #There's always going to be at least 1 digit...
    $theFinalNumber += $justTheNumber[0];

    #Even if there is only 1 digit, this still adds it as the last digit
    $theFinalNumber += $justTheNumber[$justTheNumber.Length - 1];

    $runningTotal += $theFinalNumber;
}

Write-Host $runningTotal