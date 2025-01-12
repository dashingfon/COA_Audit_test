import json

result = []

with open("res.json", 'r') as iff:
    data = json.load(iff)

    
# with open("filtered_res.json", 'w') as off:
#     json.dump({"description": description}, off, indent=4)