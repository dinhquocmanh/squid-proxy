curl -H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-X POST -d '{
    "image": "linode/ubuntu16.04lts",
    "region": "ap-south",
    "type": "g6-nanode-1",
    "label": "squidproxy-ap-south",
    "tags": [],
    "root_pass": "dfuXwcg1fEFQQhhw",
    "authorized_users": [
        "brianchavezsw"
    ],
    "booted": true,
    "backups_enabled": false,
    "private_ip": true,
    "stackscript_id": 1195462,
    "stackscript_data": {}
}' https://api.linode.com/v4/linode/instances