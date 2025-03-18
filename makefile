SRC_DIR=src
SOURCES=$(shell find $(SRC_DIR) -name "*.py")

# Set default values; allow overriding via env vars
PYTHON_VERSION ?= python3.13
POETRY_PATH ?= poetry@2.1  # pipx install --suffix "@2.1" poetry==2.1.1
OS := $(shell uname -s)

install:
	curl -sSL https://install.python-poetry.org | $(PYTHON_VERSION) -
	$(POETRY_PATH) config virtualenvs.create true
	$(POETRY_PATH) config virtualenvs.in-project true
	$(POETRY_PATH) env use /opt/homebrew/bin/$(PYTHON_VERSION)

	$(POETRY_PATH) lock
	$(POETRY_PATH) install
