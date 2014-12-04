


# Create a mean user
mkdir -p /home/mean
useradd mean -d /home/mean -s /bin/bash 
cd /home/mean
chown mean:mean /home/mean
echo "user creation completed"
