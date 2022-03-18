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
