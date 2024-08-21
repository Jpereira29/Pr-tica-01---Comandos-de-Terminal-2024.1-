#!/bin/bash
# Caminho para a pasta de trabalho
pasta_de_trabalho="D:\PROJETOS\Faculdade\Prática 01 - Comandos de Terminal (2024.1)\linux"
# Listas de extensões
extensoes_imagens=("jpg" "jpeg" "png" "gif")
extensoes_documentos=("pdf" "doc" "docx" "txt")
extensoes_musicas=("mp3" "wav")
extensoes_videos=("mp4" "avi" "mkv")
extensoes_codigos=("c" "cpp" "py")

while true; do
  echo "Iniciando nova verificação. $(date -u '+%Y-%m-%d %H:%M:%S')"

  for arquivo in "$pasta_de_trabalho"/*; do
    echo "Processando: $arquivo"
    if [ -f "$arquivo" ]; then
      extensao_do_arquivo="${arquivo##*.}"

      echo "Extensão do arquivo: $extensao_do_arquivo"

      destino="$pasta_de_trabalho/Outros" # Pasta padrão
      for extensao in "${extensoes_imagens[@]}"; do
        if [ "$extensao_do_arquivo" = "$extensao" ]; then
          destino="$pasta_de_trabalho/Imagens"

          echo "Arquivo $arquivo será salvo em $destino"
          [ -d "$destino" ] || mkdir -p "$destino"
          mv "$arquivo" "$destino/"
          break
        fi
      done
      for extensao in "${extensoes_documentos[@]}"; do
        if [ "$extensao_do_arquivo" = "$extensao" ]; then
          destino="$pasta_de_trabalho/Documentos"

          echo "Arquivo $arquivo será salvo em $destino"
          [ -d "$destino" ] || mkdir -p "$destino"
          mv "$arquivo" "$destino/"
          break
        fi
      done
      for extensao in "${extensoes_musicas[@]}"; do
        if [ "$extensao_do_arquivo" = "$extensao" ]; then
          destino="$pasta_de_trabalho/Músicas"

          echo "Arquivo $arquivo será salvo em $destino"
          [ -d "$destino" ] || mkdir -p "$destino"
          mv "$arquivo" "$destino/"
          break
        fi
      done
      for extensao in "${extensoes_videos[@]}"; do
        if [ "$extensao_do_arquivo" = "$extensao" ]; then
          destino="$pasta_de_trabalho/Vídeos"

          echo "Arquivo $arquivo será salvo em $destino"
          [ -d "$destino" ] || mkdir -p "$destino"
          mv "$arquivo" "$destino/"
          break
        fi
      done
      for extensao in "${extensoes_codigos[@]}"; do
        if [ "$extensao_do_arquivo" = "$extensao" ]; then
          destino="$pasta_de_trabalho/Códigos"

          echo "Arquivo $arquivo será salvo em $destino"
          [ -d "$destino" ] || mkdir -p "$destino"
          mv "$arquivo" "$destino/"
          break
        fi
      done
    fi
  done
  sleep 3600
done