#!/bin/bash

jupyter notebook --generate-config -y
echo "c.NotebookApp.token = ''" >> /root/.jupyter/jupyter_notebook_config.py
exec jupyter notebook --port 8888 --no-browser --ip=0.0.0.0 --allow-root