# usage:
# longin in root 
# create_user_centos.sh
# for centos 8
# param:
# $1 = username
# usage:
#   wget https://raw.githubusercontent.com/AaG7xNnrgbzeyqc5woPS/linux_help/master/CentOS_8/create_user_centos.sh
#   chmod +x create_user_centos.sh
#   ./create_user_centos.sh newuser
#   passwd
#------------------------

# Only for learning
# userdel user  #only delete user
# userdel -r user # delete user and user's home dir.


username=$1 
user_ssh_dir="/home/${username}/.ssh/"
# Adduser username
useradd -m --shell /bin/bash ${username}  #create user 'username' and his home dir and 'username' group ,not password
#usermod -aG sudo ${username} #Must create sudo group
usermod -a -G wheel ${username} #wheel group already exist

#cp authorized_keys to /home/john/.ssh
mkdir ${user_ssh_dir}
cd ~
cp .ssh/authorized_keys ${user_ssh_dir}
chown -R ${username}:${username} ${user_ssh_dir}

echo "Create User : ${username} OK!"
echo "Please setup password for new user with command 'passwd user'! "
echo "passwd ${username}"
