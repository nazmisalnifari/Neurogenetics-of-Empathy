# Transcriptomic Profiling of Social Cognition & Empathy: The Molecular Architecture of Neurodiversity

**Prepared by:** Nazmi Soufi Alnifari  

---

## 📌 I. Introduction (Problem Statement & Motivation)

Empathy and intrapersonal intelligence are often reduced to merely the result of upbringing or purely psychological constructs. However, scientific reality demonstrates that our capacity to emotionally connect with others, as well as our ability to regulate anxiety, is tightly governed by the neurobiological blueprint within our brains.

**The Molecular Mechanism of Empathy: Lock and Key**
Biologically, empathy is triggered by oxytocin acting as a neurotransmitter. When we receive social signals, the hypothalamus releases oxytocin molecules that flood neural circuits, particularly targeting the Amygdala (the center of emotional regulation). These molecules bind to specific "locks" on the surface of nerve cells, namely the Oxytocin Receptor (OXTR). The binding of this molecule initiates a reaction that dampens amygdala reactivity, reduces anxiety, and enables the cognitive intelligence required to "read" the emotions of others.

**Genetic Architecture: Why Do Humans Differ in Empathy Levels?**
If the OXTR gene is present in all humans, why are some individuals highly empathetic while others remain emotionally distant? The answer lies in genetic and epigenetic variation:
1. **Inherited Variation (rs53576 Polymorphism):** Individuals who inherit the G nucleotide base (G Variant) possess receptors that are highly efficient and abundant, making them extremely sensitive to non-verbal cues. In contrast, individuals with the A Variant possess less sensitive receptors, requiring significantly stronger stimulation to process social connections.
2. **Epigenetic Switch (DNA Methylation):** External and environmental factors can trigger the attachment of methyl groups (carbon) onto the OXTR gene. This methylation process literally "silences" the gene, causing brain cells to stop producing oxytocin receptors, ultimately leading to a biologically reduced capacity for empathy.

**Scientific Validation Behind the Neuroscience Mystery**
Studying social cognition presents a major ethical barrier: it is impossible to dissect living human brain tissue to measure oxytocin receptors directly. However, findings from behavioral genetics are not merely speculative hypotheses. Science validates them through Imaging Genetics methods, combining fMRI brain imaging with DNA testing (swab samples) to directly observe how the A Variant triggers an over-reactive Amygdala in real time.

Additionally, experiments using Peripheral Biomarkers (DNA extracted from blood) and Stem Cell engineering (iPSCs) allow researchers to track methylation and gene expression without physically accessing a patient's skull.

**Study Focus (Problem Statement)**
Directly studying social cognition presents an absolute ethical barrier: science cannot dissect the healthy brain tissue of living humans merely to measure oxytocin receptor sensitivity or levels of empathy. Furthermore, raw DNA data (such as A vs. G alleles) are highly restricted in public databases due to strict confidentiality policies.

As the most scientifically valid alternative, this project employs a transcriptomic proxy approach using a Neurodiversity dataset (Autism Spectrum Disorder/ASD). ASD is fundamentally not a disease caused by trauma, but rather an inherent difference in neurological architecture that profoundly influences how the brain processes empathy and social interaction.

By comparing Temporal Cortex tissue, the central hub of social cognition in the brain—between Neurotypical individuals (control) and Neurodivergent individuals (ASD), we can uncover the genetic machinery underlying the spectrum of human social intelligence in a manner that is legal, ethical, and scientifically accurate.

---

## 🔬 II. Methods of Analysis

**1. Dataset & Sample Selection**
* **Database:** NCBI Gene Expression Omnibus (GEO)
* **GSE ID:** GSE28521
* **Platform:** Microarray (Illumina HumanRef-8 v3.0 expression beadchip)
* **Jaringan:** *Temporal Cortex* from the human brain.
This study employs a Case vs. Control comparison design (Neurodivergent vs. Neurotypical) to observe shifts in the genetic machinery responsible for processing social signals.

**2. Alur Kerja Bioinformatika (Pipeline)**

*[Upload Screenshot Bagan Alir Draw.io di sini]*

Proses analisis dilakukan dengan mengintegrasikan komputasi RStudio dan *Web-based Enrichment Tools*:
* **Pra-pemrosesan Data (EDA):** Mengunduh matriks menggunakan package `GEOquery`, membersihkan nilai kosong, dan memvalidasi distribusi normalisasi data menggunakan fungsi `boxplot` dan `plotDensities`. Visualisasi reduksi dimensi dilakukan menggunakan `umap`.
* **Differential Gene Expression (DEG):** Analisis statistik dilakukan menggunakan package `limma`. **Catatan Penting Parameter:** Berbeda dengan sel kanker yang bermutasi secara ekstrem, perubahan ekspresi neurobiologi di otak sangat halus (*subtle*). Oleh karena itu, ambang batas disesuaikan secara presisi pada **|LogFC| > 0.5** dan **P-Value < 0.05** agar RStudio cukup peka menangkap gen-gen pengendali kognisi sosial.
* **Analisis Pengayaan (Enrichment):** ID gen yang signifikan (*ILMN_Gene*) diekstraksi dari hasil DEG dan diproses ke *database* eksternal melalui web **g:Profiler** dan **KEGG Mapper** untuk memetakan *Gene Ontology (Biological Process)* dan jalur pensinyalannya. 

---

## 📊 III. Results and Interpretation

**A. Data Distribution and Quality (Quality Control)**
Boxplot and Density Plot analyses confirmed that all microarray samples were evenly distributed and properly normalized. No significant anomalies were detected, indicating that comparisons of genetic expression between the two groups are valid.

*[Upload Gambar Boxplot.png di sini]*
*[Upload Gambar Density_Plot.png di sini]*
*[Upload Gambar UMAP.png di sini]*

**B. Genetic Mapping (Volcano Plot & Heatmap)**
The `limma` filtering results using the subtle-shift parameter successfully detected 66 genes that were significantly differentially expressed (DEGs) in the brain’s social cognition center.

*[Upload Gambar Volcano_Plot.png di sini]*


In the Volcano Plot, red dots represent genes that are down-regulated in neurodivergent brains, while blue dots represent up-regulated genes. 

*[Upload Gambar Heatmap.png di sini]*

The contrasting color patterns in the Heatmap visualize the "transcriptomic fingerprint" of social cognition. Several candidate genes detected by the analysis, such as GABRG2 and SNAP25, are known to play crucial roles in neural signal transmission and neurotransmitter vesicle release.

**C. Biological Pathway Analysis (GO & KEGG)**

*[Upload Screenshot GO_gProfiler.png di sini]*
*[Upload Screenshot KEGG_Pathway.png di sini]*

Enrichment analysis demonstrates that the 66 significant genes cluster heavily around synaptic regulation, exocytosis control, and responses to chemical signaling. This indicates that differences in empathy sensitivity are directly determined by how efficiently neurons within the Temporal Cortex communicate when responding to emotional stimuli.

---

## 💡 IV. Conclusion

This project computationally demonstrates that the spectrum of social intelligence and empathy in humans possesses a real molecular architectural foundation, rather than being solely shaped by environmental influences. Through analysis of the Temporal Cortex, 66 regulatory genes were identified that modify how the brain transmits neural signals, dictate response speed, and process social cues.

These findings conclude our bioinformatics exploration, reaffirming that even from the same genome, diversity in genetic regulation can produce a wide spectrum of personality traits, self-regulation abilities, and highly complex forms of empathy.
