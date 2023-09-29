#!/bin/bash
rm models/imageclassifier.keras
rm ~/.jupyter/migrated
rm -rf .ipynb_checkpoints/
rm -rf .vscode
rm -rf logs
rm -rf ~/.jupyter/lab/workspaces


jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity00.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity01.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity02.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity03.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity04.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity05.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity21.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity22.ipynb

