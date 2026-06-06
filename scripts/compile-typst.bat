@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ════════════════════════════════════
echo  NovaForge — Typst 编译脚本 (Windows)
echo ════════════════════════════════════

set SCRIPT_DIR=%~dp0
set PARENT_DIR=%SCRIPT_DIR%..
set TYPST_DIR=%PARENT_DIR%\typst

if exist "%TYPST_DIR%\template.typ" (
    cd /d "%TYPST_DIR%"
) else if exist "typst\template.typ" (
    cd typst
) else if exist "template.typ" (
    rem 已在 typst/ 目录中
) else (
    echo [错误] 未找到 template.typ
    echo 请在项目根目录、scripts\ 或 typst\ 下运行此脚本
    pause
    exit /b 1
)

echo [1/1] 编译中...
typst compile template.typ

if %ERRORLEVEL% neq 0 (
    echo [错误] 编译失败！
    pause
    exit /b 1
)

echo.
echo ✅ 编译完成！
echo 📄 输出文件：%CD%\template.pdf
echo 👀 实时预览：typst watch template.typ
pause
