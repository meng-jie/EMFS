## paper "Drug-target interaction prediction based on multi-source data efficient fusion"


### Quick start
We have 12 lab folders and each folder provides an example script to run experiments with the fusion of networks and network features already extracted from our dataset:
- Run `run_main.m`: predict drug-target interactions, and evaluate the results with cross-validation.

### Experimental environment and version
We test the code on Ubuntu 20.04 with Matlab R2018a installed
Operating system:Linux 5.11.0

### Code and data
#### `code/` directory
- `Single_Network_Class` : The classification network combination predicts drug-target interactions. 
- `Multi_Network_Class` : The class networks include a single network and multiple networks, so the fusion and splicing of multiple networks are compared.
- `Testbased_SNF` : Four types of variant forms based on similiarity network fusion(SNF) methods(i.e., Selective fusion, Weighted fusion based on entropy, Weighted fusion based on predictive performance and Select and weight fusion)

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

#### ` fusion/` directory
We provided the pre-fused networks for drug and target, which were used to produce the results in our paper.

#### `feature/` directory
We provided the pre-trained vector representations for the fusion networks of drug and target.

#### `DNGR/` directory
This directory contains code necessary to run the DNGR algorithm.
- Run `main.m`: it will generate a low-dimensional vector representation of features for each node in the fused drug or target network.

#### `supplementary/` directory
- `Supplementary_Table_8.xlsx`: an excel table including two evaluation index values AUROC and AUPR of 36 combined experiments connecting six classes of drugs and four classes of targets.`Supplementary_Table_9.xlsx`: an excel table including five evaluation index values Presicion, Recall, F1, AUROC and AUPR of four types of variant forms, which are based on the results of  combined experiments to predict Drug-Target interactions.
- `Supplementary_Table_10.xlsx`: an excel table including novel drug-target interactions predicted  by select and weight fusion with score. We rank the scores in terms of the drug and the target  connecting 732 approved drugs and 1,915 human targets. 

#### ` related_documents/ ` directory
- `classify_Combine` : Some Word documents about all results of combined experiments.
- `fusion_Variant` : Some Word documents about 10 results from four types of variant forms.
