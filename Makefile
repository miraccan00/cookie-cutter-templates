VENV ?= venv
OUTPUT_DIR ?= _sandbox

ifeq ($(OS),Windows_NT)
PYTHON ?= python
VENV_BIN := $(VENV)/Scripts
else
PYTHON ?= python3
VENV_BIN := $(VENV)/bin
endif

VENV_PY := $(VENV_BIN)/python

.PHONY: help venv clean quicktest \
	cookiecutter-dotnet cookiecutter-fiber cookiecutter-spring cookiecutter-django check-django

help:
	@echo "make venv                  - create venv and install deps"
	@echo "make quicktest             - render all working templates into $(OUTPUT_DIR)"
	@echo "make cookiecutter-dotnet   - render .NET template into $(OUTPUT_DIR)"
	@echo "make cookiecutter-fiber    - render Go Fiber template into $(OUTPUT_DIR)"
	@echo "make cookiecutter-spring   - render Spring Boot template into $(OUTPUT_DIR)"
	@echo "make cookiecutter-django   - render Django template into $(OUTPUT_DIR)"
	@echo "make clean                 - remove $(OUTPUT_DIR)"

venv:
	$(PYTHON) -m venv $(VENV)
	$(VENV_PY) -m pip install --upgrade pip
	$(VENV_PY) -m pip install -r requirements.txt

check-django:
	$(PYTHON) -c "import os,sys; p='cookiecutter-django-template/cookiecutter.json'; missing=not os.path.exists(p); print(f'Missing {p}. Add it before generating.' if missing else ''); sys.exit(1 if missing else 0)"

cookiecutter-dotnet: venv
	$(VENV_PY) -m cookiecutter cookiecutter-dotnet-template --no-input --output-dir $(OUTPUT_DIR) --overwrite-if-exists

cookiecutter-fiber: venv
	$(VENV_PY) -m cookiecutter cookiecutter-fiber-template --no-input --output-dir $(OUTPUT_DIR) --overwrite-if-exists

cookiecutter-spring: venv
	$(VENV_PY) -m cookiecutter cookiecutter-spring-mvn-template --no-input --output-dir $(OUTPUT_DIR) --overwrite-if-exists

cookiecutter-django: venv check-django
	$(VENV_PY) -m cookiecutter cookiecutter-django-template --no-input --output-dir $(OUTPUT_DIR) --overwrite-if-exists

quicktest: cookiecutter-dotnet cookiecutter-fiber cookiecutter-spring

clean:
	$(PYTHON) -c "import shutil; shutil.rmtree('$(OUTPUT_DIR)', ignore_errors=True)"
