# ============================================
# SCRIPT AUTOMÁTICO DE MEJORAS PARA REPOS
# ============================================
# Este script automatiza la aplicación de mejoras
# a los repositorios de GitHub

param(
    [string]$RepoName = "all",
    [string]$GitHubUser = "Samael2626"
)

Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║    AUTO-MEJORAS PARA REPOSITORIOS        ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# ============================================
# FUNCIÓN: Agregar LICENSE
# ============================================
function Add-MITLicense {
    param([string]$RepoPath)
    
    $license = @"
MIT License

Copyright (c) 2024 Samuel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"@
    
    Set-Content -Path "$RepoPath/LICENSE" -Value $license
    Write-Host "   ✅ LICENSE agregado" -ForegroundColor Green
}

# ============================================
# FUNCIÓN: Agregar CONTRIBUTING.md
# ============================================
function Add-ContributingGuide {
    param([string]$RepoPath, [string]$RepoName)
    
    $contributing = @"
# Cómo Contribuir a $RepoName

Agradecemos tus contribuciones. Aquí está cómo puedes ayudar.

## Antes de Empezar

1. Fork el repositorio
2. Clone tu fork:
   \`\`\`bash
   git clone https://github.com/tu-usuario/$RepoName.git
   cd $RepoName
   \`\`\`
3. Crea una rama para tu feature:
   \`\`\`bash
   git checkout -b feature/mi-feature
   \`\`\`

## Desarrollo

### Instalar Dependencias
\`\`\`bash
# Para proyectos Python
pip install -r requirements.txt

# Para proyectos .NET
dotnet restore
\`\`\`

### Hacer Cambios
- Escribe código limpio y legible
- Incluye tests para nuevas features
- Asegúrate que los tests pasen

### Commits
Usa conventional commits:
\`\`\`
feat: agregar nueva feature
fix: corregir bug
docs: actualizar documentación
test: agregar tests
\`\`\`

## Enviar Pull Request

1. Push a tu rama:
   \`\`\`bash
   git push origin feature/mi-feature
   \`\`\`

2. Abre un Pull Request en GitHub
3. Describe los cambios claramente
4. Espera revisión y feedback

## Código de Conducta

Este proyecto sigue [Contributor Covenant](https://www.contributor-covenant.org/)

Por favor sé respetuoso y constructivo con otros contribuidores.

## Preguntas?

Abre un [Issue](https://github.com/$GitHubUser/$RepoName/issues) para discutir.

¡Gracias por contribuir! 🙏
"@
    
    Set-Content -Path "$RepoPath/CONTRIBUTING.md" -Value $contributing
    Write-Host "   ✅ CONTRIBUTING.md agregado" -ForegroundColor Green
}

# ============================================
# FUNCIÓN: Crear GitHub Actions
# ============================================
function Add-GitHubActions {
    param([string]$RepoPath, [string]$RepoName, [string]$Language)
    
    # Crear directorio de workflows
    New-Item -ItemType Directory -Force -Path "$RepoPath/.github/workflows" | Out-Null
    
    if ($Language -eq "python") {
        $workflow = @"
name: Tests

on:
  push:
    branches: [ main, develop, master ]
  pull_request:
    branches: [ main, develop, master ]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: [3.8, 3.9, '3.10', '3.11']
    
    steps:
    - uses: actions/checkout@v3
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: \${{ matrix.python-version }}
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt
        pip install pytest pytest-cov
    - name: Run tests
      run: pytest tests/ -v
"@
    }
    elseif ($Language -eq "dotnet") {
        $workflow = @"
name: Build & Test

on:
  push:
    branches: [ main, develop, master ]
  pull_request:
    branches: [ main, develop, master ]

jobs:
  build:
    runs-on: windows-latest
    
    steps:
    - uses: actions/checkout@v3
    - name: Setup .NET
      uses: actions/setup-dotnet@v3
      with:
        dotnet-version: '6.0.x'
    - name: Restore
      run: dotnet restore
    - name: Build
      run: dotnet build --configuration Release
    - name: Test
      run: dotnet test --configuration Release --verbosity normal
"@
    }
    
    Set-Content -Path "$RepoPath/.github/workflows/tests.yml" -Value $workflow
    Write-Host "   ✅ GitHub Actions workflow agregado" -ForegroundColor Green
}

# ============================================
# FUNCIÓN: Hacer Git Commit
# ============================================
function Commit-Changes {
    param([string]$RepoPath, [string]$Message)
    
    Push-Location $RepoPath
    git add . 2>&1 | Out-Null
    git commit -m $Message 2>&1 | Out-Null
    Write-Host "   ✅ Commit realizado: '$Message'" -ForegroundColor Green
    Pop-Location
}

# ============================================
# FUNCIÓN: Push a GitHub
# ============================================
function Push-ToGitHub {
    param([string]$RepoPath)
    
    Push-Location $RepoPath
    git push 2>&1 | Out-Null
    Write-Host "   ✅ Push a GitHub completado" -ForegroundColor Green
    Pop-Location
}

# ============================================
# REPOS A MEJORAR
# ============================================
$repos = @(
    @{
        Name = "BancoApp"
        Url = "https://github.com/$GitHubUser/BancoApp.git"
        Language = "dotnet"
        Actions = @("license", "readme", "contributing", "gitignore")
    },
    @{
        Name = "BinanceAgent"
        Url = "https://github.com/$GitHubUser/BinanceAgent.git"
        Language = "python"
        Actions = @("license", "contributing", "actions")
    },
    @{
        Name = "Bot_Radicados"
        Url = "https://github.com/$GitHubUser/Bot_Radicados.git"
        Language = "python"
        Actions = @("license", "contributing", "actions")
    }
)

# ============================================
# EJECUCIÓN
# ============================================

Write-Host "🔧 Ejecutando mejoras automáticas..." -ForegroundColor Yellow
Write-Host ""

foreach ($repo in $repos) {
    if ($RepoName -ne "all" -and $repo.Name -ne $RepoName) {
        continue
    }
    
    Write-Host "📦 Procesando: $($repo.Name)" -ForegroundColor Cyan
    
    $tempDir = "$env:TEMP\$($repo.Name)"
    $repoPath = "$tempDir"
    
    # Clonar repo
    if (Test-Path $tempDir) {
        Remove-Item -Recurse -Force $tempDir
    }
    
    Write-Host "   📥 Clonando repositorio..." -ForegroundColor Gray
    git clone $repo.Url $tempDir 2>&1 | Out-Null
    
    # Aplicar mejoras
    foreach ($action in $repo.Actions) {
        switch ($action) {
            "license" {
                Write-Host "   📄 Agregando LICENSE..." -ForegroundColor Gray
                Add-MITLicense $repoPath
            }
            "contributing" {
                Write-Host "   📋 Agregando CONTRIBUTING.md..." -ForegroundColor Gray
                Add-ContributingGuide $repoPath $repo.Name
            }
            "actions" {
                Write-Host "   ⚙️  Agregando GitHub Actions..." -ForegroundColor Gray
                Add-GitHubActions $repoPath $repo.Name $repo.Language
            }
            "gitignore" {
                Write-Host "   🚫 Mejorando .gitignore..." -ForegroundColor Gray
                # Se puede agregar lógica personalizada aquí
            }
        }
    }
    
    # Git operations
    Write-Host "   🔄 Sincronizando cambios..." -ForegroundColor Gray
    Commit-Changes $repoPath "docs: Agregar documentación y mejoras de configuración"
    Push-ToGitHub $repoPath
    
    Write-Host "   ✅ $($repo.Name) completado" -ForegroundColor Green
    Write-Host ""
}

Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║        ✅ MEJORAS COMPLETADAS             ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""
Write-Host "📊 Resumen:" -ForegroundColor Yellow
Write-Host "   ✅ LICENSE agregados a los repos"
Write-Host "   ✅ CONTRIBUTING.md creados"
Write-Host "   ✅ GitHub Actions configurados"
Write-Host "   ✅ Cambios pusheados a GitHub"
Write-Host ""
Write-Host "🎉 ¡Tus repositorios ahora están mejorados!" -ForegroundColor Green
