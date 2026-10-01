# Nixconf

Декларативная конфигурация NixOS и Home Manager для рабочей станции
`iershov-ws`. Рабочий стол построен на X11 и i3.

## Применение конфигурации

```bash
sudo nixos-rebuild switch --flake .#iershov-ws --impure
```

Флаг `--impure` необходим, поскольку корпоративный сертификат читается из
`/etc/ssl/certs/cert.pem`.

Для проверки без сборки системы:

```bash
nix flake check --impure --no-build
```

Для обновления входов flake:

```bash
nix flake update
```

## Структура

```text
flake.nix                  входы, фабрика хостов и formatter
flake.lock                 зафиксированные версии входов
overlays.nix               unstable-пакеты и локальные overrides

hosts/
  iershov-ws/              настройки конкретной машины и оборудования

modules/                   системные модули NixOS
  system.nix               загрузка, локали, пользователь, сеть и Nix
  packages.nix             системные пакеты, шрифты, udev и nix-ld
  services.nix             PipeWire, Docker, Bluetooth, печать и очистка
  home.nix                 подключение Home Manager
  desktop/                 X11, LightDM и i3

home/                      пользовательские модули Home Manager
  common.nix               базовые пакеты, XDG и Zoom wrapper
  console.nix              Bash, Git и консольные инструменты
  i3.nix                   файлы i3/Polybar и Betterlockscreen
  vim.nix                  Vim, тема, плагины и автодополнение
  vscode.nix               VS Code и декларативный набор расширений

configs/                   исходные конфигурационные файлы
  bashrc
  tmux.conf
  i3/
  polybar/

pkgs/                      локальные определения пакетов
  hugo.nix
  zoom-us.nix

wallpapers/                обои рабочего стола и экрана блокировки
docs/                      пользовательская документация и шпаргалки
```

## Stable и unstable

Основная система использует стабильный `nixpkgs`. Отдельные пакеты из
`nixpkgs-unstable` подключены через `overlays.nix`; сейчас это VS Code, Codex
и WinBox.

## Где вносить изменения

- системный пакет — `modules/packages.nix`;
- пользовательский CLI-инструмент — `home/console.nix`;
- настройка Vim — `home/vim.nix`;
- расширение VS Code — `home/vscode.nix`;
- сочетание клавиш i3 — `configs/i3/config`;
- Polybar — `configs/polybar/`;
- новый локальный пакет — `pkgs/` и `overlays.nix`;
- настройка конкретного компьютера — `hosts/<hostname>/`.

## Документация

Основные команды i3, tmux, Vim и консольных приложений собраны в
[`docs/console-cheatsheet.md`](docs/console-cheatsheet.md).

## Соглашения

- Nix-код форматируется командой `nix fmt`.
- Комментарии к нетривиальной логике пишутся на русском языке.
- `system.stateVersion` и `home.stateVersion` не обновляются вместе с каналом:
  они соответствуют версии первоначальной установки.
- Секреты и локальные сертификаты не добавляются в Git.
