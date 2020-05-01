#! /bin/bash

sudo yum update -y
sudo amazon-linux-extras install nginx1 -y
sudo systemctl enable nginx
sudo systemctl start nginx

wget http://s3.amazonaws.com/ec2metadata/ec2-metadata
chmod u+x ec2-metadata
instance=$(./ec2-metadata -i)

echo "<center><h1>Hello!</h1> <img src="https://www.kindpng.com/picc/b/410/4108982.png"> <h2>Currently on $instance</h2></center>" | sudo tee /usr/share/nginx/html/index.html