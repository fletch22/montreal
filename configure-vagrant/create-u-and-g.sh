# Create users and groups

CUSER=f22

sudo userdel -r $CUSER

sudo rm -rf /home/$CUSER

# Adds a user but gives it no password. The practical upshot is that 
# the user is only able to log in with a security key. '--gecos' avoids needing 
# to have user interaction.
sudo adduser --disabled-password --gecos "" $CUSER

sudo echo "$CUSER ALL=(ALL) NOPASSWD:ALL" > ./f22-sudoer
sudo cp ./f22-sudoer /etc/sudoers.d/f22-sudoer
sudo chmod 0440 /etc/sudoers.d/f22-sudoer
sudo rm ./f22-sudoer

sudo mkdir /home/$CUSER/.ssh

sudo touch /home/$CUSER/.ssh/authorized_keys

sudo chown -R vagrant /home/$CUSER/.ssh

sudo cat /vagrant/configure-vagrant/remote-deploy.pub >> /home/$CUSER/.ssh/authorized_keys 

sudo chmod 700 /home/$CUSER/.ssh
sudo chmod 600 /home/$CUSER/.ssh/authorized_keys
sudo chown -R $CUSER /home/$CUSER/.ssh

NO_ASK_PASSWORD_AUTH="\nMatch User f22\n\tPasswordAuthentication no\n"

# So alot is going on here. 'pcregrep' basically searches 
# for the string. If it does NOT find a match the second part appends the string to the file.
# 'pcregrep' is used instead of 'grep' because 'grep' can't handle multiline searches.
# 'printf' is used instead of 'echo' because 'printf' can handle new lines.
# 'sudo tee -a' is called because we have previously invoked the pipe character. The pipe character causes an output redirection. 
# Commands redirected are executed by the shell. Since the shell is running as root and root is not a sudoer 
# we cannot invoke 'sudo.' Calling 'sudo tee' fixes this. 
pcregrep --quiet -M 'Match User f22(\n|.)*\tPasswordAuthentication' /etc/ssh/sshd_config || printf "$NO_ASK_PASSWORD_AUTH" | sudo tee -a  /etc/ssh/sshd_config

printf '\nAbout to restart ssh daemon ...\n'
sudo service ssh restart

printf "\nAbout to add user '$CUSER' to 'docker' group ...\n"
sudo usermod -aG docker $CUSER

printf '\nFinished with users and group scripts ...\n'
