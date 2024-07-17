#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
yum install -y httpd tmux
systemctl start httpd
systemctl enable httpd
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=80/tcp
firewall-cmd --add-port=22/tcp
firewall-cmd --add-port=22/tcp --permanent
instance_ip=`curl http://169.254.169.254/latest/meta-data/public-ipv4`
cat << EOF > /var/www/html/index.html
<html>
    <index>
		<title>UNIR</title>
	</index>
    <body>
	    <h1>Actividad 3</h1>
		<h2>Despliegue de una aplicación mediante AWS </h2>
        <h3>Saludos!</h3>
	</body>
</html>
EOF
echo $instance_ip >>/var/www/html/index.html