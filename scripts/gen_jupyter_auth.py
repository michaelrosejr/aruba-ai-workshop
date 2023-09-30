#!/usr/bin/env python
import argparse
import json
from jupyter_server.auth import passwd

JUYPTER_CONFIG_FILE="/home/ubuntu/.jupyter/jupyter_server_config.json"

parser = argparse.ArgumentParser(description="Generate Jupyter Password and save Jupyter config",
                                 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument("-p", "--passwd", type=str, help="set password")
args = parser.parse_args()
# config = vars(args)
# print(config)

jupyter_passwd = passwd(args.passwd)

jupyter_config = {
        "IdentityProvider": {
            "hashed_password": jupyter_passwd
        }
    }

# print(json.dumps(jupyter_config))
with open(JUYPTER_CONFIG_FILE, "w") as outf:
    json.dump(jupyter_config, outf) 


