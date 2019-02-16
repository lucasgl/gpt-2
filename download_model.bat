@echo off
if %1.==. (
    echo "You must enter the model name as a parameter, e.g.: download_model.bat 117M"
    exit 1
)
set model=%1

mkdir -p models/$model

# TODO: gsutil rsync -r gs://gpt-2/models/ models/
for %%f in (checkpoint, encoder.json, hparams.json, model.ckpt.data-00000-of-00001, model.ckpt.index, model.ckpt.meta, vocab.bpe) do
  gsutil cp gs://gpt-2/models/%model%/%%f models/%model%

