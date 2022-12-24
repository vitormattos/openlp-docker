FROM x11docker/xfce

RUN apt-get update

RUN apt install -y python3 qttools5-dev-tools pyqt5-dev-tools python3-pyqt5 python3-pyqt5.qtmultimedia \
                      python3-pyqt5.qtsvg python3-pyqt5.qtopengl python3-pyqt5.qtwebchannel \
                      python3-pyqt5.qtwebengine python3-dbus.mainloop.pyqt5 python3-sqlalchemy python3-alembic \
                      python3-chardet python3-lxml python3-enchant python3-bs4 python3-mako python3-uno \
                      python3-flask python3-flask-cors python3-waitress python3-webob python3-xlib \
                      python3-websockets python3-requests python3-pymediainfo python3-qtawesome \
                      python3-opengl python3-appdirs python3-vlc python3-zeroconf python3-pytest \
                      python3-pytest-cov python3-pip python3-flake8 flake8 mediainfo mupdf-tools

RUN pip3 install pillow qrcode

RUN apt install -y git rsync 
RUN apt install -y qtchooser
RUN ln -s /usr/lib/qt5/bin/lconvert /usr/bin/lconvert-qt5

RUN groupadd -g 1000 username
RUN useradd -d /home/username -s /bin/bash -m username -u 1000 -g 1000

WORKDIR /home/username
USER username 

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "bash", "/entrypoint.sh"]
