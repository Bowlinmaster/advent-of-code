$in = Get-Content .\input.txt

$maxSumForAnElf = 0;
$runningSumForAnElf = 0;

$in | ForEach-Object {
	#If we've reached an empty line, we're done summing up an elf
	if([System.String]::IsNullOrEmpty($_)){
		#If the elf has more calories than the current max, save his calories as the new max
		if($runningSumForAnElf -gt $maxSumForAnElf){
			$maxSumForAnElf = $runningSumForAnElf;
		}
		#We've finished an elf, reset the running sum for an elf.
		$runningSumForAnElf = 0;
	}
	$runningSumForAnElf += $_;
}

Write-Host "The elf with the most amount of calories has $maxSumForAnElf calories."