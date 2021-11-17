

ssh-keygen -t rsa
git clone https://github.com/jmcole/AzureDevops.git
python3 -m venv ~/.myrepo
source ~/.myrepo/bin/activate
az webapp up -n <your-appservice>