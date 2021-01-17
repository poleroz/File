# Сайт: www.chiark.greenend.org.uk/~sgtatham/bugs-ru.html
# Копия сайта: Zerkalo2 77.223.97.71:90

## Установка (Ubuntu 18.04)

1. Устанавливаем на локальной машине необходимые пакеты:
    <pre>
    sudo -s
    apt update && apt install docker.io make dpkg-repack
    </pre>
    
2. Запускаем Docker:
   <pre>
   systemctl enable docker && systemctl start docker
   </pre>

3. Генерируем ключи и настраиваем доступы по ssh:
    
4. Копируем на локальную машину файлы из репозитория:
    <pre>
    git clone https://github.com/volt-80386/Project-1 ~/WORK/test-build2
    chmod 0755 all_start.sh
    </pre>

## Эксплуатация
    
    cd ~/WORK/test-build2
   
1. Скачиваем html-файлы с внешнего web-сервера:
    <pre>
    make sync
    </pre>

2. Создаем Docker-контейнер c html-файлами и локальным web-сервером:
    <pre>
    make build
    </pre>

3. Деплоим контейнер на удаленную машину
    <pre>
    make deploy
    </pre>

### Автоматизируем пункты 1-3:

    crontab ~/WORK/test-build2/crontab
Запуск по субботам, в 3:45, посредством bash-скрипта (*all_start.sh*) и протоколированием работы в лог
