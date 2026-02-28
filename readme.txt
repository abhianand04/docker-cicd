STEP 1 Click to launch instance
STEP-2 Name Your Instance (eg: Name Your Instance)
STEP 3 — Choose AMI
STEP 4 — Choose Instance Type
STEP 5 — Key Pair(password)-Create new key pair-Name:eg:devops-key Type:RSA .pem & Download it.
STEP 6 — Network Settings - Edit 
        - Allow SSH traffic (port 22) 
        - Source: Anywhere (0.0.0.0/0) (temporary for learning)
        - Allow HTTP traffic (port 80)
          Add one more: Add security group rule
        Type:Custom TCP Port:5000 , Source:0.0.0.0/0
STEP 7 — Storage Keep default:
STEP 8 — Launch

// CONNECT YOUR PC TERMINAL WITH EC2 INSTANCE 

GO TO .pem key downloaded folder
chmod 400 devops-key.pem 
ssh -i devops-key.pem ubuntu@15.206.27.193

// UPDATE YOR EC2 SERVER AND INSTALL DOCKER 

STEP 1 — Update Server 
sudo apt update && sudo apt upgrade -y
STEP 2 — Install Docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

Allow Ubuntu User To Run Docker (Important)
sudo usermod -aG docker ubuntu

Now exit and reconnect: exit 

eiter go manually pull image in EC2 or push with main brance with Git action 
docker pull abhianand0410/node-docker-app:latest
docker run -d -p 5000:5000 --name node-app abhianand0410/node-docker-app:latest
http://15.206.27.193:5000