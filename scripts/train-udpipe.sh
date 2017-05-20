#!/bin/sh

# Syntax:
# ./train-udpipe.sh model-prefix training-data validation-data
#
# Example: 
# ./train-udpipeline.sh my-bm ud-data/bm/bm-train.conllu ud-data/bm/bm-dev.conllu
#
# To evaluate:
# udpipe --accuracy --tag --parse ../udpipe-models/my-bm.model ../ud-data/bm/bm-dev.conllu 
#
# Model files (word2vec embeddings and udpipe model) are created under '../udpipe-models/'.


# Create word2vec training data:
cat $2 | grep -v -e "^#" -e "^[0-9]*-" | cut -f2 | perl -e '$w=""; while(<>) {chomp; if (length $_) {$w .= (length $w ? " " : "") . $_;} else {print "$w\n"; $w="";}} print "$w\n" if length $w' > ../udpipe-models/"$1".embeddings.input

# Train skipgram embeddings:
word2vec -train ../udpipe-models/"$1".embeddings.input -output ../udpipe-models/"$1".skip.forms.50.vectors -cbow 0 -size 50 -window 10 -negative 5 -hs 0 -sample 1e-1 -threads 12 -binary 0 -iter 15 -min-count 2
# Alternative with CBOW embeddings:
#./word2vec -train "$2".in -output "$1".cbow.forms.50.vectors -cbow 1 -size 50 -window 8 -negative 0 -hs 1 -sample 1e-1 -threads 12 -binary 0 -iter 15 -min-count 2

# Clean up word2vec training data:
rm ../udpipe-models/"$1".embeddings.input

# Train udpipe:
udpipe --train \
--tokenizer=none \
--tagger=dictionary_accuracy=file:$3\;models=2\;templates_1=tagger\;guesser_suffix_rules_1=10\;guesser_enrich_dictionary_1=6\;guesser_prefixes_max_1=0\;use_lemma_1=1\;use_xpostag_1=1\;use_feats_1=1\;provide_xpostag_1=1\;provide_feats_1=1\;prune_features_1=0\;templates_2=lemmatizer\;guesser_suffix_rules_2=8\;guesser_enrich_dictionary_2=5\;guesser_prefixes_max_2=4\;use_lemma_2=1\;use_xpostag_2=0\;use_feats_2=0\;provide_lemma_2=1\;prune_features_2=0 \
--parser=iterations=10\;embedding_upostag=20\;embedding_feats=20\;embedding_xpostag=0\;embedding_form=50\;embedding_form_file=../udpipe-models/"$1".skip.forms.50.vectors\;embedding_lemma=0\;embedding_deprel=20\;learning_rate=0.01\;learning_rate_final=0.001\;l2=0.5\;hidden_layer=200\;batch_size=10\;use_gold_tags=0\;transition_system=projective\;transition_oracle=dynamic\;structured_interval=8 \
--heldout=$3 \
../udpipe-models/"$1".model $2
