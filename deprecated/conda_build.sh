conda config --set anaconda_upload no
   
if [ $TOXENV = 'py36' ]; then
    OUTPUT_FN=$(conda-build conda_36/ --output)
    conda-build conda_36
else
    if [ $TOXENV = 'py37' ]; then
        OUTPUT_FN=$(conda-build conda_37/ --output)
        conda-build conda_37
    else
        if [ $TOXENV = 'gen' ]; then
            OUTPUT_FN=$(conda-build conda_gen/ --output)
            conda-build conda_gen
        else
            OUTPUT_FN=$(conda-build conda_38/ --output)
            conda-build conda_38
        fi
    fi
fi

anaconda -t $CONDA_UPLOAD_TOKEN upload -u kaihsinwu $OUTPUT_FN --force
