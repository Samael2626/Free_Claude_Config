# ============================================
# VERIFICATION SCRIPT - Claude Code Setup
# ============================================
# Este script verifica que toda la instalación
# de Claude Code esté correctamente configurada

Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║    CLAUDE CODE - INSTALLATION CHECKER     ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Variables
$errors = @()
$warnings = @()
$success_count = 0

# ============================================
# 1. VERIFICAR UV
# ============================================
Write-Host "🔍 Verificando UV..." -ForegroundColor Yellow
try {
    $uv_version = uv --version
    Write-Host "   ✅ UV instalado: $uv_version" -ForegroundColor Green
    $success_count++
} catch {
    $errors += "UV no está instalado o no está en el PATH"
    Write-Host "   ❌ UV NO ENCONTRADO" -ForegroundColor Red
}

# ============================================
# 2. VERIFICAR PYTHON
# ============================================
Write-Host ""
Write-Host "🔍 Verificando Python..." -ForegroundColor Yellow
try {
    $python_version = python --version 2>&1
    if ($python_version -match "3\.[8-9]|3\.1[0-9]") {
        Write-Host "   ✅ Python encontrado: $python_version" -ForegroundColor Green
        $success_count++
    } else {
        $warnings += "Python version podría ser muy antigua: $python_version"
        Write-Host "   ⚠️  Versión de Python: $python_version (Se recomienda 3.8+)" -ForegroundColor Yellow
    }
} catch {
    $errors += "Python no está instalado o no está en el PATH"
    Write-Host "   ❌ PYTHON NO ENCONTRADO" -ForegroundColor Red
}

# ============================================
# 3. VERIFICAR GIT
# ============================================
Write-Host ""
Write-Host "🔍 Verificando Git..." -ForegroundColor Yellow
try {
    $git_version = git --version
    Write-Host "   ✅ Git encontrado: $git_version" -ForegroundColor Green
    $success_count++
} catch {
    $warnings += "Git no está instalado (opcional pero recomendado)"
    Write-Host "   ⚠️  Git NO ENCONTRADO (recomendado para control de versiones)" -ForegroundColor Yellow
}

# ============================================
# 4. VERIFICAR ESTRUCTURA DEL PROYECTO
# ============================================
Write-Host ""
Write-Host "🔍 Verificando estructura del proyecto..." -ForegroundColor Yellow

$base_path = Get-Location

$paths_to_check = @(
    ".\.claude\settings.local.json",
    ".\.vscode\settings.json"
)

foreach ($path in $paths_to_check) {
    if (Test-Path $path) {
        Write-Host "   ✅ Encontrado: $path" -ForegroundColor Green
        $success_count++
    } else {
        $warnings += "No encontrado (opcional): $path"
        Write-Host "   ⚠️  No encontrado (opcional): $path" -ForegroundColor Yellow
    }
}

# ============================================
# 5. VERIFICAR PAQUETES DE UV
# ============================================
Write-Host ""
Write-Host "🔍 Verificando paquetes instalados..." -ForegroundColor Yellow
try {
    $pip_list = uv pip list | Measure-Object -Line
    Write-Host "   ✅ $($pip_list.Lines) paquetes encontrados" -ForegroundColor Green
    $success_count++
} catch {
    $errors += "No se puede listar paquetes con UV"
    Write-Host "   ❌ Error al listar paquetes" -ForegroundColor Red
}

# ============================================
# 6. VERIFICAR CLAUDE CLI
# ============================================
Write-Host ""
Write-Host "🔍 Verificando Claude CLI..." -ForegroundColor Yellow
try {
    $fcc_version = fcc --version 2>&1
    if ($fcc_version -match "error|not found") {
        $warnings += "Claude CLI (fcc) podría no estar correctamente configurado"
        Write-Host "   ⚠️  Claude CLI podría no estar instalado" -ForegroundColor Yellow
    } else {
        Write-Host "   ✅ Claude CLI encontrado: $fcc_version" -ForegroundColor Green
        $success_count++
    }
} catch {
    $warnings += "Claude CLI (fcc) no está disponible"
    Write-Host "   ⚠️  Claude CLI (fcc) no encontrado (puede instalarse después)" -ForegroundColor Yellow
}

# ============================================
# 7. VERIFICAR VARIABLES DE ENTORNO
# ============================================
Write-Host ""
Write-Host "🔍 Verificando variables de entorno..." -ForegroundColor Yellow

if ($env:CLAUDE_API_KEY) {
    Write-Host "   ✅ CLAUDE_API_KEY configurada" -ForegroundColor Green
    $success_count++
} else {
    $warnings += "CLAUDE_API_KEY no configurada (necesaria para usar Claude)"
    Write-Host "   ⚠️  CLAUDE_API_KEY no configurada" -ForegroundColor Yellow
}

if ($env:PATH -contains "uv") {
    Write-Host "   ✅ UV está en el PATH" -ForegroundColor Green
} else {
    Write-Host "   ℹ️  UV verificado en PATH" -ForegroundColor Cyan
}

# ============================================
# 8. RESULTADO FINAL
# ============================================
Write-Host ""
Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║          RESULTADO DE VERIFICACIÓN        ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

if ($errors.Count -gt 0) {
    Write-Host "❌ ERRORES ENCONTRADOS:" -ForegroundColor Red
    foreach ($error in $errors) {
        Write-Host "   • $error" -ForegroundColor Red
    }
    Write-Host ""
}

if ($warnings.Count -gt 0) {
    Write-Host "⚠️  ADVERTENCIAS:" -ForegroundColor Yellow
    foreach ($warning in $warnings) {
        Write-Host "   • $warning" -ForegroundColor Yellow
    }
    Write-Host ""
}

Write-Host "✅ VERIFICACIONES EXITOSAS: $success_count/7" -ForegroundColor Green
Write-Host ""

if ($errors.Count -eq 0 -and $warnings.Count -eq 0) {
    Write-Host "🎉 ¡TODO ESTÁ CONFIGURADO CORRECTAMENTE!" -ForegroundColor Green
    exit 0
} elseif ($errors.Count -eq 0) {
    Write-Host "⚙️  INSTALACIÓN COMPLETADA CON ADVERTENCIAS" -ForegroundColor Yellow
    Write-Host "Consulta INSTALACION.md para más detalles" -ForegroundColor Cyan
    exit 0
} else {
    Write-Host "❌ SE ENCONTRARON PROBLEMAS" -ForegroundColor Red
    Write-Host "Consulta INSTALACION.md para solucionar problemas" -ForegroundColor Cyan
    exit 1
}
