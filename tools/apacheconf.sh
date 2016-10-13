#!/bin/sh
#wget  https://github.com/graeca/graeca.github.io/archive/master.zip -O master.zip
#unzip -o master.zip


mkdir -p /home/ain/Dropbox/graeca.github.io.git/patrologia.graeca.tk
sudo cat <<EOF > /etc/apache2/conf-available/paths.conf

<Directory /home/ain/Dropbox/>
	Options Indexes FollowSymLinks
	AllowOverride All
	Require all granted
</Directory>
EOF

ln -s /etc/apache2/conf-available/paths.conf /etc/apache2/conf-enabled








sudo cat <<EOF > /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
	# The ServerName directive sets the request scheme, hostname and port that
	# the server uses to identify itself. This is used when creating
	# redirection URLs. In the context of virtual hosts, the ServerName
	# specifies what hostname must appear in the request's Host: header to
	# match this virtual host. For the default virtual host (this file) this
	# value is not decisive as it is used as a last resort host regardless.
	# However, you must set it for any further virtual host explicitly.
	#ServerName www.example.com

	ServerAdmin webmaster@localhost
	DocumentRoot /home/ain/Dropbox

	# Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
	# error, crit, alert, emerg.
	# It is also possible to configure the loglevel for particular
	# modules, e.g.
	#LogLevel info ssl:warn

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

	# For most configuration files from conf-available/, which are
	# enabled or disabled at a global level, it is possible to
	# include a line for only one particular virtual host. For example the
	# following line enables the CGI configuration for this host only
	# after it has been globally disabled with "a2disconf".
	#Include conf-available/serve-cgi-bin.conf
</VirtualHost>

EOF


ln -s /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-enabled








sudo cat <<EOF > /etc/apache2/sites-available/patrologia.graeca.tk.conf
<VirtualHost *:80>
	# The ServerName directive sets the request scheme, hostname and port that
	# the server uses to identify itself. This is used when creating
	# redirection URLs. In the context of virtual hosts, the ServerName
	# specifies what hostname must appear in the request's Host: header to
	# match this virtual host. For the default virtual host (this file) this
	# value is not decisive as it is used as a last resort host regardless.
	# However, you must set it for any further virtual host explicitly.
	ServerName patrologia.graeca.tk

	ServerAdmin webmaster@localhost
	#DocumentRoot /home/ain/Dropbox/Public/patrologia.graeca.tk
	DocumentRoot /home/ain/Dropbox/graeca.github.io.git/patrologia.graeca.tk

	# Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
	# error, crit, alert, emerg.
	# It is also possible to configure the loglevel for particular
	# modules, e.g.
	#LogLevel info ssl:warn

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

	# For most configuration files from conf-available/, which are
	# enabled or disabled at a global level, it is possible to
	# include a line for only one particular virtual host. For example the
	# following line enables the CGI configuration for this host only
	# after it has been globally disabled with "a2disconf".
	#Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet

EOF

ln -s /etc/apache2/sites-available/patrologia.graeca.tk.conf /etc/apache2/sites-enabled









sudo cat <<EOF > /home/ain/Dropbox/.htaccess
# Follow symbolic links.
#Options +FollowSymLinks

# Prevent directory listings
#  Options All -Indexes

Options All
DirectoryIndex index.html      
order deny,allow
Require all granted

AddHandler cgi-script .sh
Options +ExecCGI

#IndexIgnore *.txt
Options All -Indexes
EOF











ln -s /etc/apache2/mods-available/cgi.load /etc/apache2/mods-enabled

sudo service apache2 restart
