# in PaddleSpeech/demos/streaming_asr_server directory
import sys
import os
sys.path.append(os.path.abspath("./../../"))

from paddlespeech.server.bin.paddlespeech_server import ServerExecutor

server_executor = ServerExecutor()
server_executor(
    config_file="./conf/conformer_talcs_application.yaml",
    log_file="./log/paddlespeech.log")