# wsl2-dotfiles

## 概要

* wsl2 の Ubuntu-22.04 ディストリビューションを想定した dotfiles
* [build.sh](./build.sh) で設定を行う

## 初期設定

必要に応じて以下の設定を行っておく

### sudo をパスワードなしで実行する

1. `sudo visudo`
1. 以下のように変更

   ```diff
   - %sudo   ALL=(ALL:ALL) ALL
   + %sudo   ALL=(ALL:ALL) NOPASSWD:ALL
   ```

### デフォルトのエディタを変更する

1. `sudo update-alternatives --config editor`
1. 出てきた選択肢から使いたいエディタの番号を入力して Enter
