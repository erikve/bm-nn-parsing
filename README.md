# Joint UD Parsing of Norwegian Bokmål and Nynorsk

This repo contains the data used for the experiments in the paper _Joint UD Parsing of Norwegian Bokmål and Nynorsk_ by E. Velldal, L. Øvrelid and P. Hohle for Nodalida 2017 ([http://www.ep.liu.se/ecp/131/001/ecp17131001.pdf](http://www.ep.liu.se/ecp/131/001/ecp17131001.pdf)).

## Abstract
This paper investigates interactions in parser performance for the two official standards for written Norwegian: Bokmål and Nynorsk. We demonstrate that while applying models across standards yields poor performance, combining the training data for both standards yields better results than previously achieved for each of them in isolation. This has immediate practical value for processing Norwegian, as it means that a single parsing pipeline is sufficient to cover both varieties, with no loss in accuracy. Based on the Norwegian Universal Dependencies treebank we present results for multiple taggers and parsers, experimenting with different ways of varying the training data given to the learners, including the use of machine translation.

## Data sets
The experiments in the paper are based on both the Bokmål and Nynorsk sections of Norwegian Dependency Treebank (NDT), converted to Universal Dependencies v1.2. We also experimented with translating between the two standards using the Apertium MT toolkit. In addition to the datasets, this repo provides the key UDPipe models used for tagging and parsing.
