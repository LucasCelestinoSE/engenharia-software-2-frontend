@echo off
title iMood - Visualizador do Frontend
color 0B
cls

echo =======================================================
echo           IMOOD - VISUALIZADOR DO PROJETO
echo =======================================================
echo.
echo Este script ira iniciar um servidor web local para
echo visualizar o frontend do projeto de Engenharia de Software.
echo.
echo =======================================================
echo.

REM --- ETAPA 1: VERIFICAR SE O PROJETO FOI COMPILADO ---
echo 1. Verificando a pasta 'build/web'...
if not exist "build\web" (
    color 0C
    echo.
    echo ❌ ERRO: A pasta 'build/web' nao foi encontrada!
    echo    O projeto precisa ser compilado primeiro.
    echo.
    echo    Para compilar, execute o comando:
    echo    flutter build web
    echo.
    pause
    exit /b 1
)
echo    Pasta encontrada!
echo.

REM --- ETAPA 2: VERIFICAR PYTHON ---
echo 2. Verificando a instalacao do Python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo.
    echo ❌ ERRO: Python nao foi encontrado no sistema!
    echo.
    echo    Para executar o servidor, o Python e necessario.
    echo.
    echo    COMO INSTALAR:
    echo    1. Acesse: https://www.python.org/downloads/
    echo    2. Baixe a versao mais recente para Windows.
    echo    3. IMPORTANTE: Durante a instalacao, marque a
    echo       caixa "Add Python to PATH".
    echo.
    pause
    exit /b 1
)
echo    Python encontrado!
echo.

REM --- ETAPA 3: INICIAR O SERVIDOR ---
echo 3. Iniciando o servidor web na pasta 'build/web'...
echo.

REM Navega para a pasta do build
cd build\web

echo =======================================================
echo           🚀 SERVIDOR INICIADO! 🚀
echo =======================================================
echo.
echo    URL: http://localhost:8080
echo.
echo    O projeto sera aberto no seu navegador padrao.
echo.
echo    Para parar o servidor, feche esta janela
echo    ou pressione CTRL+C.
echo.
echo =======================================================
echo.

REM Abre o navegador automaticamente
start http://localhost:8080

REM Inicia o servidor Python
python -m http.server 8080