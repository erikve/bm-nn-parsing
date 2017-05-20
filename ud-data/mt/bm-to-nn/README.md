# Contents

The files; 

* mt-bm-to-nn-train.conllu 
* mt-bm-to-nn-dev.conllu
* mt-bm-to-nn-test.conllu

contains the result of automatically translating the corresponding sections (train, dev, test) of the Bokmål UD NDT to Nynorsk using Apertium. Note that only the full-forms are translated, not the lemma column. The only sanity checking performed was ensuring that the number of tokens in the target translation matched that of the source. Sentences where the token counts diverged are not included in files avbove. For these cases, the original Bokmål version is preserved in the following files;

* skipped-mt-bm-to-nn-train.conllu 
* skipped-mt-bm-to-nn-dev.conllu
* skipped-mt-bm-to-nn-test.conllu

Overall, just below 13% of the sentences failed to yield a valid translation (in terms of identical token counts). Detailed numbers are provided below for the different sections;

* Train: 13628 sentences translated + 2068 sentenes skipped (13.18%).
* Dev: 2115 translated + 295 skipped (12.2%). 
* Test: 1743 translated + 196 skipped (10.1%).
* Total: 17486 translated + 2559 skipped (12.8%). 20045 sentences in total. 
