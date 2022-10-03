import json
import os
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any, Dict, List

import xmltodict  # type: ignore


@dataclass
class Test:
    """
    A single test.
    """

    name: str
    value: str
    unit: str = "Seconds"


Tests = List[Test]


def load_test_result_xml(result_file: Path) -> Dict[Any, Any]:
    """
    Load a single MATLAB test result XML file into a dictionary.
    """
    with open(result_file, "r") as f:
        xml_text = "\n".join(f.readlines())
    return dict(xmltodict.parse(xml_text))


def extract_tests(xml_dict: Dict[Any, Any]) -> Tests:
    """
    Transform the MATLAB test result dictionary into a dictionary
    that can be understood by the benchmark visualisation software.
    """
    tests = []
    for test_suite in xml_dict["testsuites"]["testsuite"]:
        for test in test_suite["testcase"]:
            name = f'{test["@classname"]}.{test["@name"]}'
            time = test["@time"]
            tests.append(Test(name, time))

    return tests


def tests_to_json(tests: Tests) -> str:
    """
    Convert a list of tests to JSON.
    """
    dicts = [asdict(test) for test in tests]
    return json.dumps(dicts, indent=1)


if __name__ == "__main__":
    result_file = Path(__file__).parent.parent / "artifacts" / "results.xml"
    if not result_file.exists():
        raise FileNotFoundError(f"Could not find test result file at {result_file}")

    result_dict = load_test_result_xml(result_file)
    tests = extract_tests(result_dict)
    test_json = tests_to_json(tests)

    json_file = Path(__file__).parent.parent / "benchmarks.json"
    if json_file.exists():
        print("Deleting existing JSON benchmarks")
        os.remove(json_file)

    with open(json_file, "w") as f:
        f.write(test_json)

    print(f"JSON file written to {json_file}")
