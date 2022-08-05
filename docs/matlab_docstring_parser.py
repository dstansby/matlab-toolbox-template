"""
A sphinx plugin to modify MATLAB-style docstrings into something
that renders nicely in a sphinx document.
"""
from typing import Any, Dict, List

from sphinx.application import Sphinx  # type: ignore
from sphinx.ext.autodoc import Options  # type: ignore


def process_docstring(
    app: Sphinx, what: str, name: str, obj: Any, options: Options, lines: List[str]
) -> None:
    """
    Modify docstring lines in-place (this is important!) to go from
    a MATLAB style docstring to something that looks good using
    sphinx.
    """
    if what in ["function", "class"]:
        # Strip function name from first line
        lines[0] = " ".join(lines[0].split()[1:])
        # Add empty line between function description and further
        # description
        lines.insert(1, "")


def setup(app: Sphinx) -> Dict[str, Any]:
    """
    Setup extension. This does not add a new extension, but installs
    a hook into autodoc that processes each docstring it encounters.
    """
    app.setup_extension("sphinx.ext.autosummary")
    app.connect("autodoc-process-docstring", process_docstring)

    metadata = {
        "version": "0.1",
        "parallel_read_safe": True,
        "parallel_write_safe": True,
    }
    return metadata
