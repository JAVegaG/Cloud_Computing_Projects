#!/bin/bash

echo "instalando apache2"

sudo apt update && apt upgrade -y
sudo apt install apache2 -y

echo "creando pagina html"

sudo echo "<!DOCTYPE html>" >> index.html
sudo echo "<html>" >> index.html
sudo echo "<body>" >> index.html
sudo echo "<h1>Pagina de prueba</h1>" >> index.html
sudo echo "<p>Bienvenidos a mi servidor Web3</p>" >> index.html
sudo echo "</body>" >> index.html
sudo echo "</html>" >> index.html

sudo mv index.html /var/www/html/index.html

echo "habilitando apache2"

sudo systemctl restart apache2
sudo systemctl enable apache2