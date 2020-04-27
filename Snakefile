#!/usr/bin/env python3

import os
import re
import pathlib

#########
#RULES###
#########

rule nexus_targets:
    input:
        'output/nxs/olfactory_rename.fa.nxs',
        'output/nxs/olfactory_gappyout.fa.nxs'

#########
# MAIN ##
#########

#trimal no trim nexus output
rule nexus:
    input:
        'data/olfactory.fa.aln'
    output:
        'output/nxs/olfactory_rename.fa.nxs'
    shell:
        'trimal '
        '-nexus '
        '-in {input} '
        '-out {output} '

#trimal no trim nexus output
rule nexus_trim:
    input:
        'data/olfactory.fa.aln'
    output:
        'output/nxs/olfactory_gappyout.fa.nxs'
    shell:
        'trimal '
        '-nexus '
        '-gappyout '
        '-in {input} '
        '-out {output} '

#mb tree

rule mb_tree:
    input:
        'output/nxs/olfactory_rename.fa.nxs'
    output:
        'output/tre/olfactory_rename.fa.tre'

#mb tree trimmed

rule mb_tree_trimmed:
    input:
        'output/nxs/olfactory_gappyout.fa.nxs'
    output:
        'output/tre/olfactory_gappyout.fa.tre'
