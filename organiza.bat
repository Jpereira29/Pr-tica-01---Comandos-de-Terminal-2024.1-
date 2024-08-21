@echo off
chcp 65001
setlocal enabledelayedexpansion

set "pasta_de_trabalho=D:\PROJETOS\Faculdade\Prática 01 - Comandos de Terminal (2024.1)\windows"

set extensoes_imagens=jpg jpeg png gif
set extensoes_documentos=pdf doc docx txt
set extensoes_musicas=mp3 wav
set extensoes_videos=mp4 avi mkv
set extensoes_codigos=c cpp py
set "log_file=%~dp0wlogs.txt"

:loop
echo Iniciando nova verificação. %date% %time% >> "%log_file%"

for %%f in ("%pasta_de_trabalho%\*") do (
    if exist "%%f" (
        echo Processando: %%f >> "%log_file%"
        set "extensao_do_arquivo=%%~xf"
        set "extensao_do_arquivo=!extensao_do_arquivo:~1!"

        set "destino=%pasta_de_trabalho%\Outros"

        for %%e in (%extensoes_imagens%) do (
            if "!extensao_do_arquivo!"=="%%e" (
                set "destino=%pasta_de_trabalho%\Imagens"
                echo Arquivo %%f será salvo em !destino! >> "%log_file%"
                if not exist "!destino!" mkdir "!destino!"
                echo Move /Y "%%f" "!destino!\" >> "%log_file%"
                move /Y "%%f" "!destino!\"
            )
        )

        for %%e in (%extensoes_documentos%) do (
            if "!extensao_do_arquivo!"=="%%e" (
                set "destino=%pasta_de_trabalho%\Documentos"
                echo Arquivo %%f será salvo em !destino! >> "%log_file%"
                if not exist "!destino!" mkdir "!destino!"
                echo Move /Y "%%f" "!destino!\" >> "%log_file%"
                move /Y "%%f" "!destino!\"
            )
        )

        for %%e in (%extensoes_musicas%) do (
            if "!extensao_do_arquivo!"=="%%e" (
                set "destino=%pasta_de_trabalho%\Músicas"
                echo Arquivo %%f será salvo em !destino! >> "%log_file%"
                if not exist "!destino!" mkdir "!destino!"
                echo Move /Y "%%f" "!destino!\" >> "%log_file%"
                move /Y "%%f" "!destino!\"
            )
        )

        for %%e in (%extensoes_videos%) do (
            if "!extensao_do_arquivo!"=="%%e" (
                set "destino=%pasta_de_trabalho%\Vídeos"
                echo Arquivo %%f será salvo em !destino! >> "%log_file%"
                if not exist "!destino!" mkdir "!destino!"
                echo Move /Y "%%f" "!destino!\" >> "%log_file%"
                move /Y "%%f" "!destino!\"
            )
        )

        for %%e in (%extensoes_codigos%) do (
            if "!extensao_do_arquivo!"=="%%e" (
                set "destino=%pasta_de_trabalho%\Códigos"
                echo Arquivo %%f será salvo em !destino! >> "%log_file%"
                if not exist "!destino!" mkdir "!destino!"
                echo Move /Y "%%f" "!destino!\" >> "%log_file%"
                move /Y "%%f" "!destino!\"
            )
        )
    )
)

timeout /t 3600 /nobreak >nul
goto loop
