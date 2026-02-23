TRUNCATE TABLE clinvar_raw;

DROP TABLE IF EXISTS clinvar_raw;

DROP TABLE IF EXISTS variants_import;

CREATE TABLE variants_import (
    allele_id TEXT,
    type TEXT,
    name TEXT,
    gene_id TEXT,
    gene_symbol TEXT,
    hgnc_id TEXT,
    clinical_significance TEXT,
    clinsig_simple TEXT,
    last_evaluated TEXT,
    rs_id TEXT,
    dbvar TEXT,
    rcv_accession TEXT,
    phenotype_ids TEXT,
    phenotype_list TEXT,
    origin TEXT,
    origin_simple TEXT,
    assembly TEXT,
    chromosome_accession TEXT,
    chromosome TEXT,
    start_position TEXT,
    stop_position TEXT,
    reference_allele TEXT,
    alternate_allele TEXT,
    cytogenetic TEXT,
    review_status TEXT,
    number_submitters TEXT,
    guidelines TEXT,
    tested_in_gtr TEXT,
    other_ids TEXT,
    submitter_categories TEXT,
    variation_id TEXT,
    position_vcf TEXT,
    reference_allele_vcf TEXT,
    alternate_allele_vcf TEXT,
    somatic_clinical_impact TEXT,
    somatic_clinical_impact_last_evaluated TEXT,
    review_status_clinical_impact TEXT,
    oncogenicity TEXT,
    oncogenicity_last_evaluated TEXT,
    review_status_oncogenicity TEXT,
    scvs_germline TEXT,
    scvs_somatic TEXT,
    scvs_oncogenicity TEXT
);

SELECT COUNT(*) FROM variants_import;

SELECT gene_symbol, clinical_significance, chromosome
FROM variants_import
LIMIT 10;

SELECT gene_symbol, COUNT(*) AS variant_count
FROM variants_import
GROUP BY gene_symbol
ORDER BY variant_count DESC
LIMIT 15;

SELECT chromosome, COUNT(*) AS variant_count
FROM variants_import
GROUP BY chromosome
ORDER BY variant_count DESC;

SELECT *
FROM variants_import;

SELECT *
FROM variants_import
ORDER BY gene_symbol, chromosome, start_position;

SELECT *
FROM variants_import
LIMIT 100;

SELECT *
FROM variants_import
LIMIT 100 OFFSET 100;

SELECT *
FROM variants_import
ORDER BY type;

SELECT type, COUNT(*) AS variant_count
FROM variants_import
GROUP BY type
ORDER BY variant_count DESC;

SELECT *
FROM variants_import
WHERE type = 'Deletion'
LIMIT 50;

SELECT chromosome,
       type,
       COUNT(*) AS variant_count
FROM variants_import
WHERE chromosome ~ '^[0-9XY]+$'
GROUP BY chromosome, type
ORDER BY chromosome, variant_count DESC;

SELECT gene_symbol,
       type,
       COUNT(*) AS variant_count
FROM variants_import
WHERE gene_symbol IS NOT NULL
AND gene_symbol <> '-'
GROUP BY gene_symbol, type
ORDER BY variant_count DESC
LIMIT 30;

SELECT *
FROM variants_import
WHERE name ILIKE '%fs%'
LIMIT 20;

SELECT COUNT(*)
FROM variants_import
WHERE name ILIKE '%fs%';