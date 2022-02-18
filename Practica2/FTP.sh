echo "instalando vsftpd"

sudo apt-get update
sudo apt-get install vsftpd -y

echo "creando un usuario local"

sudo useradd -m julian

echo "configurando vsftpd"

sudo mkdir /var/anonymous
sudo mkdir /var/anonymous/publico
sudo chmod 777 /var/anonymous/publico
sudo chmod 555 /var/anonymous


sudo sed -i 's/#ftpd_banner=Welcome to blah FTP service./ftpd_banner=Sherk? Welcome./g' /etc/vsftpd.conf


echo "habilitando vsftpd"

sudo systemctl start vsftpd
sudo systemctl enable vsftpd
sudo systemctl restart vsftpd 
