import json


def strip(json_file: str):
    output = {}
    detectors = []

    with open(json_file, 'r') as file:
        data = json.load(file)

    output["success"] = data["success"]
    output["error"] = data["error"]
    output["results"] = {"detectors": []}

    for detector in data["results"]["detectors"]:
        detectors.append(
            {
                "description": detector["description"],
                "markdown": detector["markdown"],
                "id": detector["id"],
                "check": detector["check"],
                "impact": detector["impact"],
                "confidence": detector["confidence"],
            }
        )

    output["results"]["detectors"] = detectors

    with open(json_file, 'w') as out:
        json.dump(output, out, indent=4)
