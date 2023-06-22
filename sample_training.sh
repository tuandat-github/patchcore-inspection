datapath=/content/patchcore-inspection/mvtec
datasets=('bottle'  'cable'  'capsule'  'carpet'  'grid'  'hazelnut' 'leather'  'metal_nut'  'pill' 'screw' 'tile' 'toothbrush' 'transistor' 'wood' 'zipper')

#datapath=/content/patchcore-inspection/BTAD/BTADv2/BTech_Dataset_transformed
#datasets=('01'  '02'  '03')

dataset_flags=($(for dataset in "${datasets[@]}"; do echo '-d '"${dataset}"; done))

### WideResNet50, BTAD:
#python patchcore-inspection/bin/run_patchcore.py --gpu 0 --seed 0 --save_patchcore_model --log_group IM224_WR50_S --log_project BTAD_Results results \
#patch_core -b wideresnet50 -le layer2 -le layer3 --faiss_on_gpu --pretrain_embed_dimension 1024  --target_embed_dimension 384 --anomaly_scorer_num_nn 1 --patchsize 3 sampler -p 0.1 approx_greedy_coreset dataset --resize 256 --imagesize 224 "${dataset_flags[@]}" btad $datapath

### vit_base, BTAD:
# python patchcore-inspection/bin/run_patchcore.py --gpu 0 --seed 0 --save_patchcore_model --log_group IM224_VB_S0 --log_project BTAD_Results results \
# patch_core -b vit_base -le blocks.6 -le blocks.7 --faiss_on_gpu --pretrain_embed_dimension 768  --target_embed_dimension 768 --anomaly_scorer_num_nn 1 --patchsize 3 sampler -p 0.1 approx_greedy_coreset dataset --resize 256 --imagesize 224 "${dataset_flags[@]}" btad $datapath

# ### vit_deit_distilled, BTAD:
# python patchcore-inspection/bin/run_patchcore.py --gpu 0 --seed 0 --save_patchcore_model --log_group IM224_VDD_S --log_project BTAD_Results results \
# patch_core -b vit_deit_distilled -le blocks.6 -le blocks.7 --faiss_on_gpu --pretrain_embed_dimension 768  --target_embed_dimension 768 --anomaly_scorer_num_nn 1 --patchsize 3 sampler -p 0.1 approx_greedy_coreset dataset --resize 256 --imagesize 224 "${dataset_flags[@]}" btad $datapath

### WideResNet50, mvtec:
python patchcore-inspection/bin/run_patchcore.py --gpu 0 --seed 0 --save_patchcore_model --log_group IM224_WR50_S --log_project mvtec_Results results \
patch_core -b wideresnet50 -le layer2 -le layer3 --faiss_on_gpu --pretrain_embed_dimension 1024  --target_embed_dimension 384 --anomaly_scorer_num_nn 1 --patchsize 3 sampler -p 0.1 approx_greedy_coreset dataset --resize 256 --imagesize 224 "${dataset_flags[@]}" mvtec $datapath

# ### vit_base, mvtec:
# python patchcore-inspection/bin/run_patchcore.py --gpu 0 --seed 0 --save_patchcore_model --log_group IM224_VB_S0 --log_project mvtec_Results results \
# patch_core -b vit_base -le blocks.6 -le blocks.7 --faiss_on_gpu --pretrain_embed_dimension 768  --target_embed_dimension 768 --anomaly_scorer_num_nn 1 --patchsize 3 sampler -p 0.1 approx_greedy_coreset dataset --resize 256 --imagesize 224 "${dataset_flags[@]}" mvtec $datapath

# ### vit_deit_distilled, mvtec:
# python patchcore-inspection/bin/run_patchcore.py --gpu 0 --seed 0 --save_patchcore_model --log_group IM224_VDD_S --log_project mvtec_Results results \
# patch_core -b vit_deit_distilled -le blocks.6 -le blocks.7 --faiss_on_gpu --pretrain_embed_dimension 768  --target_embed_dimension 768 --anomaly_scorer_num_nn 1 --patchsize 3 sampler -p 0.1 approx_greedy_coreset dataset --resize 256 --imagesize 224 "${dataset_flags[@]}" mvtec $datapath
