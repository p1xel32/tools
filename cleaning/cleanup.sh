#!/bin/bash

# Define cleanup function
cleanup() {
  # Clean up cache files
  if [[ "$1" == *"cache"* || "$1" == *"all"* ]]; then
    sudo rm -rf ~/Library/Caches/*
    sudo rm -rf /Library/Caches/*
  fi

  # Clean up log files
  if [[ "$1" == *"log"* || "$1" == *"all"* ]]; then
    sudo rm -rf /var/log/*
  fi

  # Clean up Homebrew
  if [[ "$1" == *"brew"* || "$1" == *"all"* ]]; then
    echo "Updating Homebrew..."
    brew update
    brew cleanup --prune=all
  fi

  # Empty the trash
  if [[ "$1" == *"trash"* || "$1" == *"all"* ]]; then
    sudo rm -rf ~/.Trash/*
    sudo rm -rf /Volumes/*/.Trashes/*
  fi

  echo "Cleanup complete!"
}

# Main script
echo "What do you want to clean up? (Enter numbers separated by spaces, or 'all' to clean up everything)"
echo "1. Cache files"
echo "2. Log files"
echo "3. Homebrew packages"
echo "4. Trash"

read -a choices

if [[ " ${choices[*]} " == *"all"* ]]; then
  cleanup "all"
else
  for choice in "${choices[@]}"; do
    case "$choice" in
      1) cleanup "cache";;
      2) cleanup "log";;
      3) cleanup "brew";;
      4) cleanup "trash";;
      *) echo "Invalid choice: $choice";;
    esac
  done
fi