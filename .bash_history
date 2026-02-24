sudo systemctl status nginx
sudo nano /etc/nginx/sites-available/fastapi
sudo nginx -t
sudo apt update
sudo certbot --nginx -d harishdevopsproject.duckdns.org
sudo apt install certbot python3-certbot-nginx -y
certbot --version
sudo certbot --nginx -d harishdevopsproject.duckdns.org
sudo systemctl stop fastapi
docker --version
mkdir fullstack-docker
cd fullstack-docker
mkdir backend frontend nginx
cd backend
nano Dockerfile
cp -r ~/backend/* .
cd ../frontend
nano Dockerfile
cp /var/www/frontend/index.html .
cd ..
nano docker-compose.yml
cd nginx
nano default.conf
cd ~/fullstack-docker
docker-compose up --build -d
docker ps
sudo usermod -aG docker ubuntu
exit
docker ps
cd ~/fullstack-docker
docker-compose up --build -d
sudo systemctl stop nginx
sudo systemctl status nginx
sudo lsof -i :80
cd ~/fullstack-docker
docker-compose down
docker-compose up -d
docker ps
sudo lsof -i :80
cd ~/fullstack-docker/nginx
nano default.conf
nano ~/fullstack-docker/docker-compose.yml
cd ~/fullstack-docker
docker-compose down
docker-compose up -d --build
cd ~/fullstack-docker
docker-compose down
docker ps
nano default.conf
docker ps
docker logs nginx
ubuntu@ip-172-31-32-225:~/fullstack-docker$ ubuntu@ip-172-31-32-225:~/fullstack-docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
ubuntu@ip-172-31-32-225:~/fullstack-docker$ docker logs nginx
Error response from daemon: No such container: nginx
ubuntu@ip-172-31-32-225:~/fullstack-docker$docker-compose up
docker-compose up
docker-compose config
docker-compose up
curl -k https://localhost
docker logs nginx
2026/02/24 11:16:03 [notice] 1#1: using the "epoll" event method
2026/02/24 11:16:03 [notice] 1#1: nginx/1.29.5
2026/02/24 11:16:03 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19)
2026/02/24 11:16:03 [notice] 1#1: OS: Linux 6.14.0-1018-aws
2026/02/24 11:16:03 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2026/02/24 11:16:03 [notice] 1#1: start worker processes
2026/02/24 11:16:03 [notice] 1#1: start worker process 28
2026/02/24 11:16:03 [notice] 1#1: start worker process 29
2026/02/24 11:17:07 [notice] 1#1: signal 3 (SIGQUIT) received, shutting down
2026/02/24 11:17:07 [notice] 29#29: gracefully shutting down
2026/02/24 11:17:07 [notice] 28#28: gracefully shutting down
2026/02/24 11:17:07 [notice] 28#28: exiting
2026/02/24 11:17:07 [notice] 29#29: exiting
2026/02/24 11:17:07 [notice] 29#29: exit
2026/02/24 11:17:07 [notice] 28#28: exit
2026/02/24 11:17:07 [notice] 1#1: signal 17 (SIGCHLD) received from 28
2026/02/24 11:17:07 [notice] 1#1: worker process 28 exited with code 0
docker ps
docker-compose up
nano ~/fullstack-docker/docker-compose.yml
nano ~/fullstack-docker/nginx/default.conf
cd ~/fullstack-docker
docker-compose down
docker-compose up
sudo apt update && sudo apt upgrade -y
sudo apt install python3-pip python3-venv nginx git docker.io docker-compose -y
sudo systemctl enable docker
sudo apt install postgresql postgresql-contrib -y
sudo systemctl enable postgresql
sudo -i -u postgres
mkdir backend
cd backend
python3 -m venv venv
source venv/bin/activate
pip install fastapi uvicorn psycopg2-binary sqlalchemy
nano main.py
uvicorn main:app --host 0.0.0.0 --port 8000
sudo nano /etc/systemd/system/fastapi.service
sudo systemctl daemon-reload
sudo systemctl status fastapi
pwd
ls
sudo nano /etc/systemd/system/fastapi.service
sudo systemctl daemon-reload
sudo systemctl status fastapi
sudo journalctl -u fastapi -n 20
sudo rm /etc/systemd/system/fastapi.service
sudo nano /etc/systemd/system/fastapi.service
sudo systemctl daemon-reload
sudo systemctl status fastapi.service
sudo systemctl list-unit-files | grep fastapi
sudo systemctl daemon-reload
sudo systemctl enable fastapi
sudo systemctl start fastapi
sudo systemctl status fastapi
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl status nginx
sudo rm /etc/nginx/sites-enabled/default
sudo nano /etc/nginx/sites-available/fastapi
sudo ln -s /etc/nginx/sites-available/fastapi /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
mkdir /home/ubuntu/frontend
cd /home/ubuntu/frontend
nano index.html
sudo nano /etc/nginx/sites-available/fastapi
sudo nginx -t
ls /etc/nginx/sites-enabled/
sudo nano /etc/nginx/sites-available/fastapi
sudo nginx -t
sudo systemctl restart nginx
sudo mkdir -p /var/www/frontend
dex.html /var/www/frontend/
sudo chown -R www-data:www-data /var/www/frontend
R 755 /var/www/frontend
sudo nano /etc/nginx/sites-available/fastapi
sudo nginx -t
ls -l /var/www/frontend
sudo cp /home/ubuntu/frontend/index.html /var/www/frontend/
ls -l /var/www/frontend
sudo chown -R www-data:www-data /var/www/frontend
R 755 /var/www
sudo chmod -R 755 /var/www/frontend
ls -ld /var/www
ls -ld /var/www/frontend
ls -l /var/www/frontend
sudo nginx -t
nx
sudo nginx -t
sudo tail -n 20 /var/log/nginx/error.log
sudo nano /etc/nginx/sites-available/fastapi
sudo nginx -t
sudo systemctl reload nginx
sudo systemctl status jenkins
sudo apt update
java -version
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo systemctl enable jenkins
systemctl status jenkins
sudo rm /etc/apt/sources.list.d/jenkins.list
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
echo "deb [signed-by=/usr/share/keyrings/jenkins.gpg] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt update
sudo apt install jenkins -y
sudo systemctl enable jenkins
sudo rm -f /etc/apt/sources.list.d/jenkins.list
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins-keyring.gpg
ls /usr/share/keyrings/
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt update
sudo rm -f /etc/apt/sources.list.d/jenkins.list
-f /usr/share/keyrings/jenkins-keyring.gpg
sudo apt update
sudo rm -f /etc/apt/sources.list.d/jenkins.list
sudo apt install gnupg curl -y
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins-keyring.gpg
ls -l /usr/share/keyrings/jenkins-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt update
docker pull jenkins/jenkins:lts
docker volume create jenkins_home
docker run -d   --name jenkins   -p 8080:8080   -p 50000:50000   -v jenkins_home:/var/jenkins_home   jenkins/jenkins:lts
docker run -d   --name jenkins   -p 8080:8080   -p 50000:50000   -v jenkins_home:/var/jenkins_home \
docker ps
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
df -h
docker system prune -a -f
df -h
docker ps -a
docker rm $(docker ps -aq)
docker system prune -a -f
docker exec -it jenkins bash
docker restart jenkins
docker ps
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
docker logs jenkins
-v jenkins_home:/var/jenkins_home
docker stop jenkins
docker rm jenkins
docker run -d   --name jenkins   -p 8080:8080   -p 50000:50000   -v jenkins_home:/var/jenkins_home   --restart=always   jenkins/jenkins:lts
docker volume ls
df -h
free -h
top
docker stop backend frontend postgres
docker exec -it jenkins bash
