#!/bin/bash
# Copyright 07.09.2022  s21genesiss@gmail.com
# Version 2.1
# Скрипт для установки менеджера управления пакетами Homebrew на ОС X или Linux/Debian и пакетов gcovr и lcov.
# gcovr служит для создания отчёта о покрытии кода.
# lcov служит для генерации html страницы, на которой будет представлена информация о
#           покрытии кода в более удобочитаемой форме.

USERNAME=$(whoami)
SYS_NAME=$(uname)
FILE_PROFILE=.profile

echo
echo "Hello, $USERNAME! Твоя система: $SYS_NAME."
echo
if [[ "$SYS_NAME" == "Linux" ]] # в ковычках указываем имена переменных для сравнения. -eq - логическое сравнение обозначающие "равны"
then
    FILE_PROFILE=.profile
    echo "Устанавливаю менеджер управления пакетами Homebrew на Linux/Debian и пакеты gcovr и lcov."
    echo
    echo "Тут можно посмотреть информацию по усановке Homebrew на Linux/Debian:"
    echo "https://websetnet.net/ru/installing-and-using-homebrew-package-manager-on-linux/"
    echo
    # обновление системных пакетов
    echo "Обновление системных пакетов."
    sudo apt update
    sudo apt upgrade
    # установление зависимостей Homebrew
    # пакет build-essential, git, Curl и procps (используются для мониторинга системных процессов)
    echo "Установка зависимостей Homebrew."
    sudo apt-get install build-essential procps curl file git python-setuptools
    echo
    # установка brew
    echo "Установка Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo
    # добавить Homebrew в переменную PATH.
    echo "Добавляю Homebrew в переменную PATH."
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/genesiss/$FILE_PROFILE
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    # проверка правильной установки Homebrew
    echo "Провеяю правильность установки Homebrew."
    brew doctor
    INSTALL_CHECK_BREW=$(brew doctor)
    if [ "$INSTALL_CHECK_BREW" == "Your system is ready to brew." ]
    then
        echo "Установка Homebrew прошла успешно."
    else
        echo "Установка Homebrew завершена некорректно."
        exit 1 # выходим с ошибкой (1 - код ошибки), скрипт завершается
    fi
    # удаление Homebrew
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
elif [[ "$SYS_NAME" == "Darwin" ]]
then
    FILE_PROFILE=.zprofile
    echo "Устанавливаю менеджер управления пакетами Homebrew на ОС X и пакеты gcovr и lcov."
    echo
    echo "Установка Homebrew..."
    echo
    echo "Перехожу в папку /opt/goinfre/$USERNAME"
    cd /opt/goinfre/$USERNAME
    echo
    echo "Копирую с удалённого репозитория."
    git clone https://github.com/Homebrew/brew homebrew
    echo
    echo "Установка Homebrew"
    eval "$(/opt/goinfre/$USERNAME/homebrew/bin/brew shellenv)"
    brew update --force --quiet
    chmod -R go-w "$(brew --prefix)/share/zsh"
    echo
    echo "Перехожу в корень"
    cd
    echo
    echo "Прописываю .zprofile"
    if [ ! -e $FILE_PROFILE ] # -e - истина, если файл существует
    then
        touch $FILE_PROFILE
    fi
    echo "function brsw {" > $FILE_PROFILE
    echo "  eval \"\$(/opt/goinfre/$USERNAME/homebrew/bin/brew shellenv)\"" >> $FILE_PROFILE
    echo "  chmod -R go-w \"\$(brew --prefix)/share/zsh\"" >> $FILE_PROFILE
    echo "}" >> $FILE_PROFILE
else
    echo "Этот скрипт не сможет установить программы на вашу систему."
    exit 1 # выходим с ошибкой (1 - код ошибки), скрипт завершается
fi
echo
echo "Установка gcovr"
brew install gcovr
echo
echo "Установка lcov"
brew install lcov
echo
echo "Установка Homebrew, gcovr и lcov завершена."
echo
echo
echo
echo "Для создания отчёта о покрытии кода с генерацией этого отчёта в виде html страницы,"
echo "вам следует, внести следующие строки в Makefile, после создания исполняемого файла:"
echo "////////////////////////////////////////////////////////////////////////"
echo
echo "CC                =gcc"
echo "FLAGS             =-Wall -Wextra -Werror -std=c11"
echo "CLAGS             =\$(CFLAGS) -c"
echo "BRANCH_INFO       =--rc lcov_branch_coverage=1"
echo "GCOV_FLAGS        =--coverage  # == -fprofile-arcs -ftest-coverage"
echo "OS                =\$(shell uname)"
echo "FILE_TEST_SRC     =tests.c"
echo "FILE_TEST_OUT     =tests.out"
echo
echo "ifeq (\"\$(OS)\", \"Linux\")"
echo "    TEST_FLAGS=\$(shell pkg-config --libs check)"
echo "else"
echo "    TEST_FLAGS=-lcheck"
echo "endif"
echo
echo "\$(FILE_TEST_SRC):"
echo "	checkmk clean_mode=1 tests > \$(FILE_TEST_SRC)"
echo
echo "test: \$(FILE_TEST_SRC)"
echo "	\$(CC) \$(FLAGS) \$(GCOV_FLAGS) \$(TEST_FLAGS) s21*.c -o \$(FILE_TEST_OUT)"
echo "	./\$(FILE_TEST_OUT)"
echo
echo "gcov_report: test"
echo "	gcovr -r . --html-details -o test_report_gcov.html"
echo "	open test_report_gcov.html"
echo
echo "lcov_report: test"
echo "	lcov -t \"\$(FILE_TEST_OUT)\" -o test_report_lcov.info -c -d . \$(BRANCH_INFO)"
echo "	genhtml -o report_lcov test_report_lcov.info \$(BRANCH_INFO)"
echo "	open report_lcov/index.html"
echo
echo "////////////////////////////////////////////////////////////////////////"
echo
echo
echo
echo "!!! Для правильной работы lcov и gcov не забудьте каждый раз при каждом запуске нового терминала вводить: brsw   !!!"
echo
echo "Скрипт исполнялся $SECONDS секунд."
