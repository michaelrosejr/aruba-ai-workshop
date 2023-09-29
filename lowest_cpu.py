import subprocess
import xmltodict
import json
from pprint import pprint

cmd = "nvidia-smi -x -q"

p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
(xml_nvidia, err) = p.communicate()

gpu_json = xmltodict.parse(xml_nvidia)
gpus = gpu_json["nvidia_smi_log"]["gpu"]
gpu_str = json.dumps(gpu_json)

#print((gpu_json))

import sys

print(gpus["utilization"])
# print(",".join([str(gpu[0]) for gpu in sorted([(int(gpu["minor_number"]), float(gpu["utilization"]["gpu_util"].split(" ")[0])) for gpu in json.loads(gpu_str)["nvidia_smi_log"]["gpu"]], key=lambda x: x[1])[:2]]))

"""
for gpu in gpu_json["nvidia_smi_log"]["gpu"].items():
    # print(gpu["utilization"])
    ## print(float(gpu["utilization"]["gpu_util"].split(" ")[0]))
    ## print(float(gpu_json["nvidia_smi_log"]["gpu"]["utilization"]["gpu_util"].split(" ")[0]))
    gpu_sorted = sorted([(int(gpu_json["nvidia_smi_log"]["gpu"]["minor_number"])), float(gpu_json["nvidia_smi_log"]["gpu"]["utilization"]["gpu_util"].split(" ")[0])])
    for sorted_cpu in gpu_sorted:
        print(",".join(str(gpu_sorted[0])))
# $(nvidia-smi -x -q | xml2json | jq '.' | python -c 'import json;import sys;print(",".join([str(gpu[0]) for gpu in sorted([(int(gpu["minor_number"]), float(gpu["utilization"]["gpu_util"].split(" ")[0])) for gpu in json.load(sys.stdin)["nvidia_smi_log"]["gpu"]], key=lambda x: x[1])[:2]]))')
"""