#!/bin/bash

dlx() {
  wget $1/$2
  tar -xvzf $2
  rm $2
}

dlx http://conll.cemantix.org/download reference-coreference-scorers.v8.01.tar.gz
mv reference-coreference-scorers conll-2012/scorer

cp ~/mention_bottleneck/data/original/conll_mult/conll12_dev.txt dev.english.v4_gold_conll
cp ~/mention_bottleneck/data/original/conll_mult/conll12_train.txt train.english.v4_gold_conll
cp ~/mention_bottleneck/data/original/conll_mult/conll12_test.txt test.english.v4_gold_conll

python minimize.py
python get_char_vocab.py

python filter_embeddings.py glove.840B.300d.txt train.english.jsonlines dev.english.jsonlines
python cache_elmo.py train.english.jsonlines dev.english.jsonlines
