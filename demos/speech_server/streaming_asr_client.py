# in PaddleSpeech/demos/streaming_asr_server directory
import sys
import os
sys.path.append(os.path.abspath("./../../"))

from paddlespeech.server.bin.paddlespeech_client import ASRClientExecutor

asrclient_executor = ASRClientExecutor()
res = asrclient_executor(
    input="./1-1.wav",
    server_ip="127.0.0.1",
    port=8090,
    sample_rate=16000,
    lang="zh_cn",
    audio_format="wav")
print(res)