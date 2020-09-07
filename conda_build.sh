conda config --set anaconda_upload no
   
OUTPUT_FN=$(conda-build conda_gen/ -c kaihsinwu -c pytorch --output)
conda-build conda_gen -c kaihsinwu -c pytorch

anaconda -t $CONDA_UPLOAD_TOKEN upload -u kaihsinwu $OUTPUT_FN --force
