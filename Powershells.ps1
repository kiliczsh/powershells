function CreateEnv {
    param(
        [string]$VariableName,
        [string]$VariableValue
    )

    # Check if the variable already exists
    if ([Environment]::GetEnvironmentVariable($VariableName, "User")) {
        Write-Host "Environment variable '$VariableName' already exists."
    } else {
        # Add the new environment variable
        [Environment]::SetEnvironmentVariable($VariableName, $VariableValue, "User")

        Write-Host "Environment variable '$VariableName' added with value '$VariableValue'."
    }
}

function ListEnv {
    $envVariables = [Environment]::GetEnvironmentVariables("User")
    
    Write-Host "List of Environment Variables:"
    foreach ($variable in $envVariables.GetEnumerator()) {
        Write-Host "$($variable.Key) = $($variable.Value)"
    }
}

function EditPowershellProfile {
    $profilePath = $profile

    if (Test-Path $profilePath) {
        Start-Process "code" $profilePath
    } else {
        Write-Host "PowerShell profile not found."
    }
}
