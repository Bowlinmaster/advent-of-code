$in = @(Get-Content .\input.txt);

$index1 = 0;
$count1 = 0;
$index2 = 0;
$count2 = 0;
$index3 = 0;
$count3 = 0;
$index4 = 0;
$count4 = 0;
$index5 = 0;
$count5 = 0;
$rowindex = 0;

foreach($row in $in){
    #Expand row based on 4th index as that one moves right the fastest.
    while($index4 -gt $row.Length){
        $row = $row + $row;
    }

    #slope 1
    if($row[$index1] -eq "#"){
        $count1++;
    }
    $index1 = $index1+1;

    #slope 2
    if($row[$index2] -eq "#"){
        $count2++;
    }
    $index2 = $index2+3;

    #slope 3
    if($row[$index3] -eq "#"){
        $count3++;
    }
    $index3 = $index3+5;

    #slope 4
    if($row[$index4] -eq "#"){
        $count4++;
    }
    $index4 = $index4+7;

    #slope 5
    if($rowindex%2 -eq 0){
        if($row[$index5] -eq "#"){
            $count5++;
        }
        $index5 = $index5 + 1;
    }

    $rowindex = $rowindex + 1;
}

$treesHit = $count1 * $count2 * $count3 * $count4 * $count5;

Write-Host "Number of trees hit: $treesHit"