$in = Get-Content .\input.txt

$totalRockPaperScissorScore = 0;

$in | ForEach-Object {
    $roundResultRaw = $_.ToString().Split(" ");

    $opponentPlayed = $roundResultRaw[0];
    $gameResult = $roundResultRaw[1];

    $opponentPlayedValue = 0;
    $iPlayedValue = 0;
    if($opponentPlayed -eq "A"){ $opponentPlayedValue = 1; }
    if($opponentPlayed -eq "B"){ $opponentPlayedValue = 2; }
    if($opponentPlayed -eq "C"){ $opponentPlayedValue = 3; }

    $totalScoreThisRound = 0;
    #Loss
    if($gameResult -eq "X"){
        $totalScoreThisRound = 0;
        if($opponentPlayedValue -eq 1){ $totalScoreThisRound += 3}
        if($opponentPlayedValue -eq 2){ $totalScoreThisRound += 1}
        if($opponentPlayedValue -eq 3){ $totalScoreThisRound += 2}
    }
    #Tie
    if($gameResult -eq "Y"){
        $totalScoreThisRound = 3;
        if($opponentPlayedValue -eq 1){ $totalScoreThisRound += 1}
        if($opponentPlayedValue -eq 2){ $totalScoreThisRound += 2}
        if($opponentPlayedValue -eq 3){ $totalScoreThisRound += 3}
    }
    #Win
    if($gameResult -eq "Z"){
        $totalScoreThisRound = 6;
        if($opponentPlayedValue -eq 1){ $totalScoreThisRound += 2}
        if($opponentPlayedValue -eq 2){ $totalScoreThisRound += 3}
        if($opponentPlayedValue -eq 3){ $totalScoreThisRound += 1}
    }

    $totalRockPaperScissorScore += $totalScoreThisRound;

    #Write-Host "My opponent is playing $($opponentPlayedValue) and the game resulted in a $($gameResult).  My play value is $totalScoreThisRound"
}

Write-Host "My total score is: $totalRockPaperScissorScore"