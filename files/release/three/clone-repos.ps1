param (
    [string]$destination = "D:\\Ninkovski-bootcamp"  # Directorio de destino para los repositorios
)

# Lista de repositorios y sus respectivas ramas
$repositories = @{
    "https://github.com/ninkovski/bootcamp-config-repo" = "main"
    "https://github.com/ninkovski/bootcamp-config-server" = "master"
    "https://github.com/ninkovski/bootcamp-zuul-server.git" = "main"
    "https://github.com/ninkovski/bootcamp-eureka-server.git" = "main"
    "https://github.com/ninkovski/bootcamp-customer-service" = "release/two"
    "https://github.com/ninkovski/bootcamp-product-type-service" = "release/two"
    "https://github.com/ninkovski/bootcamp-bank-product-service" = "release/two"
    "https://github.com/ninkovski/bootcamp-oauth-service.git" = "release/two"
}

# Verificar si el directorio de destino existe, si no, crearlo
if (-Not (Test-Path -Path $destination)) {
    Write-Host "Creando el directorio de destino: $destination"
    New-Item -Path $destination -ItemType Directory | Out-Null
}

# Cambiar al directorio de destino
Set-Location -Path $destination

# Clonar cada repositorio de la lista con la rama correspondiente
foreach ($repo in $repositories.Keys) {
    $branch = $repositories[$repo]
    try {
        Write-Host "Clonando repositorio: $repo en la rama: $branch"
        git clone --branch $branch $repo
        Write-Host "Repositorio clonado con éxito: $repo"
    } catch {
        Write-Host "Error al clonar el repositorio: $repo"
        Write-Host $_
    }
}

Write-Host "Descarga de repositorios completada."
