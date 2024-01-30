# Copyright Xavier Beheydt. All rights reserved.
.PHONY: all clean fclean re help vcpkg/new_app

## Variables deinition
BUILD_DIR		= build
VCPKG_ROOT_DIR	= ${BUILD_DIR}/extern/repo/vcpkg
#! Variables deinition

ifeq ($(OS),Windows_NT)
    RMDIR 		= rd /s /q
	VCPKG_EXE	= ${VCPKG_ROOT_DIR}/vcpkg.exe
	PYTHON_EXE	= python
else
    RMDIR 		= rm -rf
	VCPKG_EXE	= ${VCPKG_ROOT_DIR}/vcpkg
	PYTHON_EXE	= python3
endif

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("\t%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT


## Main
clean: ## Remove package files
	$(RMDIR) ${VCPKG_ROOT_DIR}

fclean: clean ## Remove all build files
	$(RMDIR) ${BUILD_DIR}

help: ## Print helps - FIXME not running in Windows
	@echo "Usage: make [target]"
	@$(PYTHON_EXE) -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

vcpkg/new_app: ## Create a new vcpkg app
	${VCPKG_EXE} new --application
#! Main
