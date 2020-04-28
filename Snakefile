#!/usr/bin/env python3

import os
import re
import pathlib

#########
#RULES###
#########

rule nexus_targets:
    input:
        'data/olfactory.disambiguous.fa',
        'output/nxs/olfactory.disambiguous.rename.nxs',
        'output/nxs/olfactory.disambiguous.gappyout.nxs'

#########
# MAIN ##
#########

#Change ambiguous amino acids to X
    input:
        'data/olfactory.fa'
    output:
        'data/olfactory.disambiguous.fa'
    shell:
        "sed '/^[^>]/s/[BJOUZ]/X/g' "
        "{input} "
        "> {output}"

#Align sequences

#trimal no trim nexus output
rule nexus:
    input:
        'data/olfactory.disambiguous.fa'
    output:
        'output/nxs/olfactory.disambiguous.rename.nxs'
    shell:
        'trimal '
        '-nexus '
        '-in {input} '
        '-out {output}'

#trimal no trim nexus output
rule nexus_trim:
    input:
        'data/olfactory.disambiguous.fa'
    output:
        'output/nxs/olfactory.disambiguous.gappyout.nxs'
    shell:
        'trimal '
        '-nexus '
        '-gappyout '
        '-in {input} '
        '-out {output}'

#mb tree

rule mb_tree:
    input:
        'output/nxs/olfactory.disambiguous.rename.nxs'
    output:
        'output/nxs/olfactory.disambiguous.rename.tre'

#mb tree trimmed

rule mb_tree_trimmed:
    input:
        'output/nxs/olfactory.disambiguous.trim.nxs'
    output:
        'output/nxs/olfactory.disambiguous.trim.tre'
