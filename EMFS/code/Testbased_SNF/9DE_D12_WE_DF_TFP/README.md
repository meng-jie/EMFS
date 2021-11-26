## paper "EFMS-DTI: Drug-target interaction prediction based on efficient fusion of multi-source data "


### Quick start
We have 12 experiments and provide three experimental scripts to run with the fusion of networks and network features already extracted from dataset:
- Run `run_EFMS.m`: predict drug-target interactions, and evaluate the results with cross-validation.

### Experimental environment and version
We test the code on Ubuntu 20.04 with Matlab R2018a installed
Operating system:Linux 5.11.0

### Code and data
#### `src/` directory
- `auc.m`: evaluation script
- `compute_similarity.m`: compute Jaccard similarity based on association network(i.e., DD, DSE, and TD networks)
- `imf_train.mexa64`: pre-built binary file of PU-Matrix Completion algorithm 
- `PUMC.m`: predict drug-target interactions (DTIs) with PU-Matrix Completion
- `run_EFMS.m`: example code of running model for drug-target prediction

#### `data/` directory
- `drug_dict.txt`: list of drug unique identifier and drug names
- `protein_dict.txt`: list of target unique identifier and target names
- `disease_dict.txt`: list of disease unique identifier and disease names
- `se_dict.txt`: list of side effect unique identifier and side effect names
- `drugdrug.txt`: DDI matrix
- `drugDisease.txt`: DD matrix
- `drugsideEffect.txt`: DSE  matrix
- `drugsim1network.txt`: SD<sub>C</sub>  matrix
- `drugsim2network.txt`: SD<SUB>ATC</SUB>  matrix
- `drugsim3network.txt`: SD<SUB>P</SUB>  matrix
- `drugsim4network.txt`: SD<SUB>BP</SUB>  matrix
- `drugsim5network.txt`: SD<SUB>CC</SUB>  matrix
- `drugsim6network.txt`: SD<SUB>MF</SUB>  matrix
- `proteinprotein.txt`: TTI matrix
- `proteinDisease.txt`: TD matrix
- `proteinsim1network.txt`: ST<SUB>P</SUB>  matrix
- `proteinsim2network.txt`: ST<SUB>BP</SUB>  matrix
- `proteinsim3network.txt`: ST<SUB>CC</SUB>  matrix
- `proteinsim4network.txt`: ST<SUB>MF</SUB>  matrix

#### ` WNetwork/ ` directory

This fold are results of  the ` Compute_Entropy/ ` run with dataset.

#### ` fusion/` directory

We provided the pre-fused networks for drug and target, which were used to produce the results in our paper.

#### `feature/` directory
We provided the pre-trained vector representations for the fusion networks of drug and target.

#### ` DTIScore/` directory

This fold are the scores of novel drug-target interactions by running the ` Compute_DTIScore/ ` .

#### ` Compute_Entropy/` directory

- `drug.m`: compute the entropy of each network of drug. 
- `target.m`: compute the entropy of each network of target. 

#### ` Compute_DTIScore/` directory

- `computeS.m`: it will compute the average score from running a 5-fold cross-validation. 
- `Sort.m`: it will rank the scores of drug-target interactions.

#### ` SNF/` directory

This directory contains code necessary to run the SNF algorithm.

- `drug.m`: it will generate a fusion matrix of multi drug networks.
- `target.m`: it will generate a fusion matrix of multi drug networks.

#### `DNGR/` directory

This directory contains code necessary to run the DNGR algorithm.
- Run `main.m`: it will generate a low-dimensional vector representation of features for each node in the fused drug or target network.

#### `supplementary/` directory
- `Supplementary_Table_8.xlsx`: an excel table including two evaluation index values AUROC and AUPR of 36 combined experiments connecting six classes of drugs and four classes of targets.`Supplementary_Table_9.xlsx`: an excel table including five evaluation index values Presicion, Recall, F1, AUROC and AUPR of four types of variant forms, which are based on the results of  combined experiments to predict Drug-Target interactions.
- `Supplementary_Table_10.xlsx`: an excel table including novel drug-target interactions predicted  by select and weight fusion with score. We rank the scores in terms of the drug and the target  connecting 732 approved drugs and 1,915 human targets. 
