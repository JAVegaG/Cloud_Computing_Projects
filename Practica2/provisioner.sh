echo "instalando lxd"

sudo apt-get update
sudo apt-get install lxd -y

echo "creando pagina html"

sudo echo "<!DOCTYPE html>" >> index.html
sudo echo "<html>" >> index.html
sudo echo "<body>" >> index.html
sudo echo "<h1>Pagina de prueba</h1>" >> index.html
sudo echo "<p>Bienvenidos a mi contenedor LXD</p>" >> index.html
sudo echo "</body>" >> index.html
sudo echo "</html>" >> index.html

echo "configurando lxd"

sudo newgrp lxd
sudo lxd init --auto
sleep 60
sudo lxc launch ubuntu:20.04 web
sleep 60
sudo lxc exec web -- sudo apt-get install apache2 -y
sudo lxc exec web -- sudo systemctl status apache2
sudo lxc file push index.html web/var/www/html/index.html
sudo lxc exec web -- sudo systemctl restart apache2
sudo lxc config device add web myport80 proxy listen=tcp:192.168.100.3:8080 connect=tcp:127.0.0.1:80