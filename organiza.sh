#!/bin/bash
# Caminho para a pasta de trabalho
pasta_de_trabalho="/home"
# Listas de extensões
extensoes_imagens=("jpg" "jpeg" "png" "gif")
extensoes_documentos=("pdf" "doc" "docx" "txt")
extensoes_musicas=("mp3" "wav")
extensoes_videos=("mp4" "avi" "mkv")
extensoes_codigos=("c" "cpp" "py")

while true; do
  echo "Iniciando nova verificação. $(date -u '+%Y-%m-%d %H:%M:%S')"

  for arquivo in "$pasta_de_trabalho"/*; do
    if [ -f "$arquivo" ]; then
      extensao_do_arquivo="${arquivo##*.}"

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
    fi
  done
  sleep 3600
done