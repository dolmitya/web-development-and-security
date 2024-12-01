#!/bin/bash

# Создаём новую директорию
mkdir -p ./backup_directory

# Проверяем, существует ли файл ~/.bashrc
if [ -f ~/.bashrc ]; then
  # Копируем файл
  if cp ~/.bashrc ./backup_directory/.bashrc.backup; then
    echo "Файл ~/.bashrc успешно скопирован в ./backup_directory/.bashrc.backup"
  else
    echo "Ошибка: не удалось скопировать файл ~/.bashrc."
  fi
else
  echo "Ошибка: файл ~/.bashrc не найден."
fi