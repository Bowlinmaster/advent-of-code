$in = @(Get-Content .\input.txt);

$index = 0;
$count = 0;

foreach($row in $in){
    while($index -gt $row.Length){
        $row = $row + $row;
    }

    if($row[$index] -eq "#"){
        $count++;
    }

    $index = $index+3;
}

Write-Host "Number of trees hit: $count"