# Concourse

Reusable [Concourse](https://concourse-ci.org) tasks.

Tasks are in the [`contrast`](contrast) folder, with documentation.

Pipeline(s) using these tasks are in [`example-pipelines`](example-pipelines).

## Development Setup
Various tools enforce code standards, and are run as a pre-commit hook. This must be setup before committing changes with the following commands:
```bash
python3 -m venv venv # setup a virtual environment
. venv/bin/activate # activate the virtual environment
pip3 install -r requirements-dev.txt # install development dependencies (will also include app dependencies)
pre-commit install # setup the pre-commit hook which handles formatting
```
