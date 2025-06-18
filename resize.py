import os
import yaml
import json

with open('resize_schedule.yaml', 'r') as f:
    schedule = yaml.safe_load(f)

vm = schedule['vms']['linuxvm']
current_cron = os.environ.get('GITHUB_EVENT_SCHEDULE', '')

if current_cron == vm['up_cron']:
    vm_size = vm['new_size']
    print(f"Resizing VM to new_size: {vm_size}")
elif current_cron == vm['down_cron']:
    vm_size = vm['old_size']
    print(f"Resizing VM to old_size: {vm_size}")
else:
    print("No matching cron; exiting.")
    exit(0)

tfvars = {}
tfvars_file = 'terraform.auto.tfvars.json'
if os.path.exists(tfvars_file):
    with open(tfvars_file, 'r') as f:
        tfvars = json.load(f)
tfvars['vm_size'] = vm_size
with open(tfvars_file, 'w') as f:
    json.dump(tfvars, f)
