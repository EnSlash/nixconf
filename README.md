# Конфигурация NixOS

Этот репозиторий содержит конфигурацию NixOS для настольной среды с оконным менеджером i3 и панелью Polybar.

## Обзор

-   **Оконный менеджер:** i3
-   **Панель состояния:** Polybar
-   **Основные файлы конфигурации:**
    -   `configuration.nix`: Главная точка входа, которая должна импортировать `settings.nix`.
    -   `settings.nix`: Центральный файл, объединяющий остальные модули.
    -   `home.nix`: Конфигурация для Home Manager, управляющая пользовательскими файлами (`.bashrc`, конфиги i3, polybar и т.д.).
    -   `packages.nix`: Список устанавливаемых пакетов.

## Как использовать

1.  **Клонируйте репозиторий** в удобное для вас место (например, `~/nixconf` или `/etc/nixos/repo`).

2.  **Настройте канал NixOS** на версию `25.05`:
    ```bash
    sudo nix-channel --remove nixos
    sudo nix-channel --add https://nixos.org/channels/nixos-25.05 nixos
    sudo nix-channel --update
    ```

3.  **Отредактируйте ваш `/etc/nixos/configuration.nix`**, чтобы он импортировал `settings.nix` из этого репозитория. Пример:
    ```nix
    imports = [ /path/to/your/cloned/repo/settings.nix ];
    ```

4.  **Персонализируйте конфигурацию:**
    -   Измените имя пользователя `iershov` и домашний каталог в файлах `settings.nix` и `home.nix`.

5.  **Пересоберите систему:**
    ```bash
    sudo nixos-rebuild switch
    ```
