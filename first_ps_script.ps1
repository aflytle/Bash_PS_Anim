
while (1)
{
    foreach ($child in (Get-ChildItem . -Filter "*.txt") )
    {
        Clear-Host
        cat $child
        Start-Sleep -Seconds 0.8
    }
}