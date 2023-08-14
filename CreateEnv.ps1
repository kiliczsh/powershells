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
