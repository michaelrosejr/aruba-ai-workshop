#!/bin/bash
echo "Removing lab specific files."
rm -rf models/imageclassifier.keras
rm -rf .ipynb_checkpoints/
rm -rf .vscode
rm -rf logs
rm -rf ~/.jupyter/lab/workspaces

echo "Clearing Outputs for all cells and all Jupyter Notebooks."
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity00.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity01.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity02.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity03.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity04.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity05.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity21.ipynb
jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace Activity22.ipynb

