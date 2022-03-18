$Content = Get-Content "./test.txt"
$Content =  $Content -ireplace [regex]::Escape("schreibweise1"), "Schreibweise1"
$Content | Set-Content "./test_cleaned.txt"

function Replace-StringInsensitive {
    param (
        [String]$SourcePath,
        [String]$DestinationPath,
        [String]$ToReplace,
        [String]$ReplaceWith
    )
    $Content = Get-Content $SourcePath
    $Content = $Content -ireplace [regex]::Escape($ToReplace), $ReplaceWith
    $Content | Set-Content $DestinationPath
    return $Content
}

# Hinweis: Wenn die Ursprungsdatei überschrieben werden soll, dann einfach DestinationPath=SourcePath
Replace-StringInsensitive -SourcePath ./input.txt -DestinationPath ./output.txt -ToReplace "schreibweise1" -ReplaceWith "NeueSchreibweise"