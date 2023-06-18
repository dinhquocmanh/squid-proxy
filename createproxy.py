import requests
import os 
import dotenv

dotenv.load_env()
token = os.getenv('LINODETOKEN')

def create_a_server():
    url = "https://api.linode.com/v4/linode/instances"
    headers = {
        f"Authorization": "Bearer {token}",
        "Content-Type": "application/json"
    }
    body = {
        "image": "linode/ubuntu16.04lts",
        "region": "ap-south",
        "type": "g6-nanode-1",
        "label": "squidproxy-02",
        "tags": [],
        "root_pass": "dfuXwcg1fEFQQhhw",
        "authorized_users": [
            "brianchavezsw"
        ],
        "booted": True,
        "backups_enabled": False,
        "private_ip": True,
        "stackscript_id": 1195462,
        "stackscript_data": {}
    } 
    r = requests.post(url=url, headers=headers, json=body)
    # save respone to text file
    print(r.text)
    with open('log.txt','a') as f: 
        f.write(r.text)
        f.write('\n')


if __name__ == "__main__":
    create_a_server()