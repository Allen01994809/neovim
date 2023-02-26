# neovim

## Getting/Started

```sh
git clone --depth 1 https://github.com/ArakiTakaki/neovim.git
```


## Neovimをセットアップする

### windows

TODO: ドキュメント整理

- install https://github.com/neovim/neovim

Python3のPathを通す

- Python3のpath
- `pip3 install --user pynvim`
- [MinGWのGCCインストール手順](https://github.com/kaityo256/lab_startup/blob/main/gccwin/README.md)


Symlinkを作る

```
New-Item -Type SymbolicLink 'OriginalPath' -Value
```

### mac

Neovimのインストール

```sh
$ brew install neovim
```

依存パッケージのインストール

```sh
$ git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
$ git clone --depth 1 https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim
$ brew install ag
$ pip3 install --user pynvim
```

設定ファイルのリンク

```sh
$ ln -fs $PWD ~/.config/nvim
```

#### パッケージのインストール
```sh
:PackerCompile
:PackerInstall
```

### PackerCommand

ref https://github.com/wbthomason/packer.nvim

```
-- Regenerate compiled loader file
:PackerCompile

-- Remove any disabled or unused plugins
:PackerClean

-- Clean, then install missing plugins
:PackerInstall

-- Clean, then update and install plugins
:PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
:PackerSync
```

## Q&A

### Defxが起動しない

- https://github.com/Shougo/defx.nvim#requirements


## 参考資料

- https://zenn.dev/eetann/scraps/adddd5604ae9ea
- [Neovim v0.5リリース記念 v0.5の新機能を紹介します【前編】](https://lab.mo-t.com/blog/neovim-v05-introduction-new-features-part-1)
# neovim
