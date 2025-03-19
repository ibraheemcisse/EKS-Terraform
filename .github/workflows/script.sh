    #/bin/sh
    
    sudo apt-get install cowsay -y 
    cowsay -f dragon "run for ur life rawrrrrrrrrr" >> dragon.txt 
    run: grep -i "." dragon.txt 
    cat dragon.txt 
    ls -ltra
