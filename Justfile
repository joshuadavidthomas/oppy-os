set dotenv-load := true

@_default:
    just --list

bootstrap:
    @just lock
    uv pip sync requirements.txt

install: venv
    uv pip install .

lock: venv
    uv pip compile pyproject.toml --output-file requirements.txt

venv:
    uv venv
