#!/bin/bash

cd ${HOME}
module purge

rm -f .bash_profile
ln -s /home/sjyuan/.bash_profile .

cd project
if [ ! -d 'software' ]; then
	mkdir software
fi

cd ..
if [ ! -d 'software' ]; then
	ln -s /project/${USER}/software .
fi

cd software
if [ ! -d 'python' ]; then
    mkdir python
fi
cd ..

source .bash_profile

pip install --user -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install --user matplotlib h5py
