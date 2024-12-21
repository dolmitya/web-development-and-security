# Используем базовый образ Ubuntu, чтобы запускать Bash-скрипты
FROM ubuntu:20.04 as base

# Установка обновлений и минимальных инструментов
RUN apt-get update && apt-get install -y --no-install-recommends bash

# Создаём временную директорию для хранения скрипта
WORKDIR /opt/scripts

# Копируем Bash-скрипт в контейнер
COPY script.sh ./main_script.sh

# Делаем скрипт исполняемым
RUN chmod u+x ./main_script.sh

# Создаём финальный контейнер с минимальным слоем
FROM ubuntu:20.04

# Копируем скрипт из предыдущего слоя
COPY --from=base /opt/scripts/main_script.sh /usr/local/bin/run_script

# Указываем скрипт как точку входа
ENTRYPOINT ["/usr/local/bin/run_script"]
