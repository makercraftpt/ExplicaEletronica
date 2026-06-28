@echo off
:: ============================================================
::  gerar_pdf.bat — Converte markdown para PDF via Pandoc
::  Requisitos: pandoc + MiKTeX (instalar uma vez)
::  Download: https://pandoc.org  e  https://miktex.org
:: ============================================================
::
::  USO:
::    gerar_pdf.bat                    → converte TODOS os .md da pasta actual
::    gerar_pdf.bat exercicio.md       → converte um ficheiro específico
::    gerar_pdf.bat 1a_frequencia\*.md → converte uma sub-pasta
::

setlocal enabledelayedexpansion

:: Pasta de saída
set SAIDA=_pdfs
if not exist %SAIDA% mkdir %SAIDA%

:: Opções comuns do Pandoc
set OPTS=--pdf-engine=xelatex --defaults=pandoc_config.yaml

if "%1"=="" (
    echo Convertendo todos os ficheiros .md...
    for /r %%f in (*.md) do (
        set "nome=%%~nf"
        echo   %%f -^> %SAIDA%\!nome!.pdf
        pandoc "%%f" -o "%SAIDA%\!nome!.pdf" %OPTS%
    )
) else (
    set "nome=%~n1"
    echo Convertendo %1 -^> %SAIDA%\!nome!.pdf
    pandoc "%1" -o "%SAIDA%\!nome!.pdf" %OPTS%
)

echo.
echo Pronto. PDFs em: %SAIDA%\
pause
