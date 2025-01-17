import json

json_file = "slither_output.json"

def strip():
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


def write_md():
    with open(".\\reports\\slither_report.md", 'w') as rp:
        rp.write("# Slither Report\n\n")

        rp.write(f"[Slither Raw Output](../slither_output.json)\n\n")

        with open(json_file, 'r') as file:
            data = json.load(file)
            
        for detector in data["results"]["detectors"]:
            rp.write(f"### {detector['impact']} Impact | {detector['confidence']} Confidence \n\n")

            rp.write(detector["markdown"])