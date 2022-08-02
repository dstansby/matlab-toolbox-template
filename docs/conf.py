# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information
import pathlib

project = 'mypackage'
copyright = '2022, David Stansby'
author = 'David Stansby'
release = '0.0.1'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ['myst_parser',
              'sphinxcontrib.matlab',
              'sphinx.ext.autodoc']

source_suffix = {
    '.rst': 'restructuredtext',
    '.md': 'markdown',
    }

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

matlab_src_dir = str(pathlib.Path(__file__).parent.parent.resolve())
primary_domain = 'mat'
matlab_keep_package_prefix = False

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']
