PREFIX  = /usr

install:
    install -m 755 ./noobfetch.sh $(PREFIX)/bin/noobfetch

uninstall:
    rm -rf $(PREFIX)/bin/noobfetch

reinstall:
    rm -rf $(PREFIX)/bin/noobfetch
    install -m 755 ./noobfetch.sh $(PREFIX)/bin/noobfetch
