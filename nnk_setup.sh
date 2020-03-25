 git clone https://github.com/nnkennard/e2e-coref.git
 cd e2e-coref/
 tar -xzvf e2e-coref.tgz
 virtualenv --python /cm/shared/apps/python/3.6.3-1710/bin/python3 ec_ve
 source ec_ve/bin/activate
 python -m pip install -r requirements.txt 
 bash setup_all.sh 
 bash setup_training.sh 
