#!/bin/sh

sudo apt-get update
sudo apt-get install -y cowsay
cowsay -f dragon "run for ur life rawrrrrrrrrr" >> dragon.txt
grep -i "." dragon.txt
cat dragon.txt
ls -ltra
