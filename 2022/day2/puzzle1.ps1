$in = Get-Content .\input.txt

$totalRockPaperScissorScore = 0;

$in | ForEach-Object {
    $roundResult = $_.ToString().Split(" ");

    $opponentPlayed = $roundResult[0];
    $iPlayed = $roundResult[1];

    $opponentPlayedValue = 0;
    $iPlayedValue = 0;
    if($opponentPlayed -eq "A"){ $opponentPlayedValue = 1; }
    if($opponentPlayed -eq "B"){ $opponentPlayedValue = 2; }
    if($opponentPlayed -eq "C"){ $opponentPlayedValue = 3; }

    if($iPlayed -eq "X"){ $iPlayedValue = 1; }
    if($iPlayed -eq "Y"){ $iPlayedValue = 2; }
    if($iPlayed -eq "Z"){ $iPlayedValue = 3; }

    $totalScoreThisRound = 0;
    if($iPlayed -eq "X"){
        $totalScoreThisRound = 1;
    }
    if($iPlayed -eq "Y"){
        $totalScoreThisRound = 2;
    }
    if($iPlayed -eq "Z"){
        $totalScoreThisRound = 3;
    }

    if($opponentPlayedValue -eq $iPlayedValue){
        #Tie
        $totalScoreThisRound += 3;
    }
    elseif((($iPlayedValue -eq 1) -and ($opponentPlayedValue -eq 3)) -or 
           (($iPlayedValue -eq 2) -and ($opponentPlayedValue -eq 1)) -or
           (($iPlayedValue -eq 3) -and ($opponentPlayedValue -eq 2))){
        #Win
        $totalScoreThisRound += 6;
    }
    else{
        #Loss
        #No extra score
    }

    $totalRockPaperScissorScore += $totalScoreThisRound;

    #Write-Host "My opponent is playing $($opponentPlayedValue) and I am playing $($iPlayedValue).  My play value is $totalScoreThisRound"
}

Write-Host "My total score is: $totalRockPaperScissorScore"