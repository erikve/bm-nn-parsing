# Contents
The files; 

* mt-nn-to-bm-train.conllu
* mt-nn-to-bm-dev.conllu
* mt-nn-to-bm-test.conllu

contains the result of automatically translating the corresponding sections (train, dev, test) of the Nynorsk UD NDT to Bokmål using Apertium. Note that only the full-forms are translated, not the lemma column. The only sanity checking performed was ensuring that the number of tokens in the target translation matched that of the source. Sentences where the token counts diverged are not included in files avbove. For these cases, the original Nynorsk version is preserved in the following files;

* skipped-mt-nn-to-bm-train.conllu 
* skipped-mt-nn-to-bm-dev.conllu
* skipped-mt-nn-to-bm-test.conllu

Overall, just below 4% of the sentences failed to yield a valid translation (in terms of identical token counts). Detailed numbers are provided below for the different sections;

* Train: 13617 sentences translated + 557 sentenes skipped (3.9%).
* Dev: 1826 translated + 64 skipped (3.4%). 
* Test: 1445 translated + 66 skipped (4.4%).
* Total: 17575 translated + 687 skipped (3.9%).
