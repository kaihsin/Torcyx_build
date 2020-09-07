conda config --set anaconda_upload no

if [ $TOXENV = 'py36' ]; then
    OUTPUT_FN=$(conda-build conda_gpu_36/ --output)
    conda-build conda_gpu_36 -c conda-forge
else
    OUTPUT_FN=$(conda-build conda_gpu_37/ --output)
    conda-build conda_gpu_37 -c conda-forge
fi

anaconda -t $CONDA_UPLOAD_TOKEN upload -u kaihsinwu $OUTPUT_FN --force
