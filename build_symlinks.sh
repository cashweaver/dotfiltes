#!/usr/bin/env bash
# Create symlinks for all dotfiles. Backup original files.

DOTFILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR="/home/$(whoami)/.dotfilebak"

# Create backup directory. Exit if the directory already exists.
if [ -d "$BACKUP_DIR" ]; then
  echo "Backup directory ($BACKUP_DIR) already exists. Exiting to prevent overwriting files."
  exit 1
fi
mkdir "$BACKUP_DIR"

cd /home/$(whoami)

mv .gitignore .dotfilebak/ 2>/dev/null
ln -s "$DOTFILE_DIR/.gitignore" .gitignore

mv .gitconfig .dotfilebak/ 2>/dev/null
ln -s "$DOTFILE_DIR/.gitconfig" .gitconfig

mv .vimrc.local .dotfilebak/ 2>/dev/null
ln -s "$DOTFILE_DIR/.vimrc.local" .vimrc.local

mv .bashrc .dotfilebak/ 2>/dev/null
ln -s "$DOTFILE_DIR/.bashrc" .bashrc

mv .bashrc.local .dotfilebak/ 2>/dev/null
touch .bashrc.local

mv .bash_aliases .dotfilebak/ 2>/dev/null
ln -s "$DOTFILE_DIR/.bash_aliases" .bash_aliases

mv .bash_aliases.local .dotfilebak/ 2>/dev/null
touch .bash_aliases.local

source .bashrc

echo "Existing files were backed up to:"
echo "  /home/$(whoami)/.dotfilebak"
