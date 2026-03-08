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

By comparing Temporal Cortex tissue, the central hub of social cognition in the brain, between Neurotypical individuals (control) and Neurodivergent individuals (ASD), we can uncover the genetic machinery underlying the spectrum of human social intelligence in a manner that is legal, ethical, and scientifically accurate.

---

## 🔬 II. Methods of Analysis

**1. Dataset & Sample Selection**
* **Database:** NCBI Gene Expression Omnibus (GEO)
* **GSE ID:** GSE28521
* **Platform:** Microarray (Illumina HumanRef-8 v3.0 expression beadchip)
* **Tissue:** *Temporal Cortex* from the human brain.
This study employs a Case vs. Control comparison design (Neurodivergent vs. Neurotypical) to observe shifts in the genetic machinery responsible for processing social signals.

**2. Bioinformatics Workflow (Pipeline)**

The analysis process was conducted by integrating RStudio computation with Web-based Enrichment Tools:
* **Data Pre-processing (EDA):** The expression matrix was downloaded using the `GEOquery` package, missing values were cleaned, and data normalization was validated using `boxplot` and `plotDensities` functions. Dimensionality reduction visualization was performed using `umap`.
* **Differential Gene Expression (DEG):** Statistical analysis was performed using the `limma` package. **Crucial Parameter Note:** Unlike cancer cells which mutate extremely, neurobiological expression changes in the brain are very subtle. Therefore, the threshold was precisely adjusted to **|LogFC| > 0.5** and **P-Value < 0.05** to ensure the algorithm was sensitive enough to capture social cognition regulatory genes.
* **Enrichment Analysis:** Significant gene IDs (*ILMN_Gene*) were extracted from the DEG results and processed through external databases via **g:Profiler** and **KEGG Mapper** web tools to map their *Gene Ontology (Biological Process)* and signaling pathways. 

---

## 📊 III. Results and Interpretation

**A. Data Distribution and Quality (Quality Control)**
Boxplot and Density Plot analyses confirmed that all microarray samples were evenly distributed and properly normalized. No significant anomalies were detected, indicating that comparisons of genetic expression between the two groups are statistically valid.

![Boxplot 1](https://github.com/user-attachments/assets/bff7bac5-fa36-48ef-a404-f2b9c98ec843)

<br>
<img width="862" height="558" alt="image" src="https://github.com/user-attachments/assets/a5cabb89-b219-4c7b-bfb4-6ed69edfaf27" />



<br>
<img width="862" height="558" alt="image" src="https://github.com/user-attachments/assets/e03fcde2-0746-4b68-8155-8879f651a535" />



**B. Genetic Mapping (Volcano Plot & Heatmap)**
The `limma` filtering results using the subtle-shift parameter successfully detected **66 differentially expressed genes (DEGs)** in the brain’s social cognition center.

![Volcano Plot 1](https://github.com/user-attachments/assets/97305839-02b3-4466-aca2-8d496919f38f)


In the Volcano Plot, red dots represent genes that are down-regulated in neurodivergent brains, while blue dots represent up-regulated genes. 

![Heatmap 1](https://github.com/user-attachments/assets/2872e0dc-a7d5-462e-bdaf-c786d37f63b8)


The contrasting color patterns in the Heatmap visualize the "transcriptomic fingerprint" of social cognition. Several candidate genes detected by the analysis, such as GABRG2 and SNAP25, are known to play crucial roles in neural signal transmission and neurotransmitter vesicle release.

**C. Biological Pathway Analysis (GO & KEGG)**
To understand the systemic impact of the differentially expressed genes, pathway analysis was conducted by separating the up-regulated and down-regulated genes.

**1. Gene Ontology (GO) Enrichment**
![GO 1](https://github.com/user-attachments/assets/7b11cdde-2b21-4942-bacc-63a2499afa16)

<br>
<img width="553" height="1024" alt="image" src="https://github.com/user-attachments/assets/a640d79c-2599-421e-9b24-af403822e315" />



**2. KEGG Pathway Mapping**

* **Suppressed Pathways (Down-regulated):** Genes with decreased expression in the neurodivergent group are specifically clustered in the **GABAergic synapse**, **Synaptic vesicle cycle**, and other related signal transmission pathways. The downregulation of these pathways indicates a weakened capacity of the brain to rapidly transmit neurotransmitters and dampen Amygdala reactivity (loss of self-soothing ability), which is the primary foundation of empathy regulation.

<img width="1231" height="908" alt="Downregulated 1" src="https://github.com/user-attachments/assets/f2ae8086-e055-4474-9740-92d33dcf71d4" />

<br>
<img width="1502" height="962" alt="Downregulated 2" src="https://github.com/user-attachments/assets/6e8a1868-c1c2-484b-99a5-db3c12e23517" />


<br>
<img width="1075" height="1206" alt="Downregulated 3" src="https://github.com/user-attachments/assets/81c873b9-44ac-4836-8d80-3a97a133ac26" />


* **Active Pathways (Up-regulated):** Conversely, up-regulated genes are dominated by cellular stress and immune response pathways, with the **MAPK signaling pathway** acting as the main driver. The high expression of these stress and inflammatory pathways (which in databases often overlap with pathological responses of systemic diseases and cancers) indicates the presence of **low-grade neuroinflammation** in the neurodivergent brain.

<img width="1922" height="1310" alt="Upregulated 1" src="https://github.com/user-attachments/assets/a8969b86-2182-4866-8d5d-1a4f01f19385" />

<br>
<img width="1346" height="1046" alt="Upregulated 2" src="https://github.com/user-attachments/assets/bed1d108-0c17-4480-bc70-c2468e779321" />

<br>
<img width="1491" height="1099" alt="Upregulated 3" src="https://github.com/user-attachments/assets/505eea41-777d-4768-bd7a-78e6c97c8f92" />


---

## 💡 IV. Conclusion

This project computationally demonstrates that the spectrum of social intelligence and empathy in humans is governed by a push-and-pull molecular architecture within the Temporal Cortex. Based on transcriptomic analysis, the biological reduction in empathy capacity is triggered by two simultaneous mechanisms: first, the suppression of neural signal transmission and emotional braking pathways (*GABAergic synapse* and *Synaptic vesicle cycle*); and second, the elevation of cellular stress or neuroinflammation, marked by the hyperactivity of the *MAPK signaling pathway*.

These findings confirm that social cognition diversity (*neurodiversity*) is not merely a psychological construct, but the result of genetic regulatory shifts where nerve cells experiencing low-grade stress lose their efficiency in processing empathy cues and social interactions.
