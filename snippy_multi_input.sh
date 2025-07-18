#!/bin/bash

ls trimmed_samples/*_1.trim.fastq | awk -F'/' '
{
    split($NF, filename, "_")
    id = filename[1]
    r1_path = $0
    r2_path = $0
    gsub("_1.trim.fastq", "_2.trim.fastq", r2_path)
    print id "\t" r1_path "\t" r2_path
}' > snippy_multi_input.tab