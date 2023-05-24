export MAIN_ROOT=`realpath ${PWD}/../../../`

export PATH=${MAIN_ROOT}:${MAIN_ROOT}/utils:${PATH}
export LC_ALL=C

export PYTHONDONTWRITEBYTECODE=1
# Use UTF-8 in Python to avoid UnicodeDecodeError when LC_ALL=C
export PYTHONIOENCODING=UTF-8
export PYTHONPATH=${MAIN_ROOT}${PYTHONPATH}

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib/

# model exp
MODEL=u2
export BIN_DIR=${MAIN_ROOT}/paddlespeech/s2t/exps/${MODEL}/bin


set -e

gpus=0
stage=0
stop_stage=50
conf_path=asr1_conformer_talcs_ckpt_1.4.0.model/conf/conformer.yaml
ips=  #xxx.xxx.xxx.xxx,xxx.xxx.xxx.xxx
decode_conf_path=asr1_conformer_talcs_ckpt_1.4.0.model/conf/tuning/decode.yaml
average_checkpoint=true
avg_num=10

. ${MAIN_ROOT}/utils/parse_options.sh || exit 1;

avg_ckpt=avg_${avg_num}
ckpt=$(basename ${conf_path} | awk -F'.' '{print $1}')
echo "checkpoint name ${ckpt}"
echo "${conf_path}"

# audio_file="data/demo_01_03.wav"
audio_file="data/1-1.wav"

if [ ${stage} -le 0 ] && [ ${stop_stage} -ge 0 ]; then
    # test a single .wav file
    CUDA_VISIBLE_DEVICES=0 ./local/test_wav.sh ${conf_path} ${decode_conf_path} asr1_conformer_talcs_ckpt_1.4.0.model/exp/${ckpt}/checkpoints/${avg_ckpt} ${audio_file} || exit -1
fi