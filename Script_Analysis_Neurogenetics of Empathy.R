# ==============================================================================
# CAPSTONE PROJECT OMICS LITE
# Topic: Transcriptomic Profiling of Social Cognition & Empathy (Temporal Cortex)
# Author: Nazmi Soufi Alnifari
# ==============================================================================

# 1. Memanggil Library
library(GEOquery)
library(limma)
library(umap)
library(ggplot2)
library(pheatmap)
library(clusterProfiler)
library(org.Hs.eg.db)

# 2. Mengunduh Dataset Microarray (GSE28521)
Sys.setenv("VROOM_CONNECTION_SIZE" = 131072 * 5)
gse <- getGEO("GSE28521", GSEMatrix = TRUE)
exprs_data <- exprs(gse[[1]])
pheno_data <- pData(gse[[1]])

# Mencegah error karena ada baris data yang kosong (NA)
exprs_data <- na.omit(exprs_data)

# 3. Exploratory Data Analysis (EDA) - Kualitas Data
# A. Boxplot
boxplot(exprs_data, outline=FALSE, main="Boxplot of Gene Expression (GSE28521)",
        col="lightblue", las=2, cex.axis=0.7)

# B. Density Plot
plotDensities(exprs_data, main="Density Plot of Gene Expression", legend=FALSE)

# C. UMAP (Dimensionality Reduction)
# Pemindaian kata "autism" di SELURUH kolom metadata (Anti-Error)
grup_logical <- apply(pheno_data, 1, function(row) any(grepl("autism", row, ignore.case=TRUE)))
grup <- factor(ifelse(grup_logical, "Neurodivergent", "Neurotypical"))

# Mencetak jumlah sampel untuk memastikan sudah terbagi dua
print(table(grup))

set.seed(123)
umap_result <- umap(t(exprs_data))
umap_df <- data.frame(UMAP1 = umap_result$layout[,1],
                      UMAP2 = umap_result$layout[,2],
                      Group = grup)

# Memunculkan ulang plot UMAP
p_umap <- ggplot(umap_df, aes(x = UMAP1, y = UMAP2, color = Group)) +
  geom_point(size = 3, alpha = 0.8) +
  theme_minimal() +
  labs(title = "UMAP: Neurotypical vs Neurodivergent",
       subtitle = "Global Transcriptomic Shift in Social Cognition")
print(p_umap)

# 4. Differential Gene Expression (DEG) dengan limma
design <- model.matrix(~ 0 + grup)
colnames(design) <- c("Neurodivergent", "Neurotypical")

fit <- lmFit(exprs_data, design)
# Menjadikan Neurotypical (Otak Standar) sebagai Baseline
contrast_matrix <- makeContrasts(Neurodivergent_vs_Neurotypical = Neurodivergent - Neurotypical, levels = design)
fit2 <- contrasts.fit(fit, contrast_matrix)
fit2 <- eBayes(fit2)

# Mengambil hasil statistik
results <- topTable(fit2, adjust="fdr", sort.by="B", number=Inf)
significant_DEGs <- subset(results, adj.P.Val < 0.05 & abs(logFC) > 1)

# 5. Volcano Plot
results$DiffExp <- "Not Significant"
results$DiffExp[results$logFC > 1 & results$adj.P.Val < 0.05] <- "Up-regulated (High in Neurodivergent)"
results$DiffExp[results$logFC < -1 & results$adj.P.Val < 0.05] <- "Down-regulated (Low in Neurodivergent)"

p_volcano <- ggplot(results, aes(x = logFC, y = -log10(adj.P.Val), color = DiffExp)) +
  geom_point(alpha = 0.7, size = 2) +
  scale_color_manual(values = c("blue", "grey", "red")) +
  theme_minimal() +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "black") +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "black") +
  labs(title = "Volcano Plot: Genetic Response in Social Cognition",
       x = "Log2 Fold Change", y = "-Log10 Adjusted P-Value")
print(p_volcano)

# 6. Heatmap Top 50 DEGs
top_genes <- rownames(results)[1:50]
heatmap_data <- exprs_data[top_genes, ]
pheatmap(heatmap_data, scale = "row", show_colnames = FALSE,
         main = "Top 50 Differentially Expressed Genes")

# 7. Menyimpan Dataset Final ke CSV
write.csv(results, "Empathy_Transcriptomic_Results.csv", row.names=TRUE)

# ==============================================================================
# REVISI SENSITIVITAS & ANALISIS PENGAYAAN (GO / KEGG)
# ==============================================================================

# 5. (REVISI) Volcano Plot untuk Data Neurosains
results$DiffExp <- "Not Significant"
# Menurunkan batas LogFC menjadi 0.5 agar lebih peka terhadap gen otak
results$DiffExp[results$logFC > 0.5 & results$P.Value < 0.05] <- "Up-regulated (High in Neurodivergent)"
results$DiffExp[results$logFC < -0.5 & results$P.Value < 0.05] <- "Down-regulated (Low in Neurodivergent)"

p_volcano_rev <- ggplot(results, aes(x = logFC, y = -log10(P.Value), color = DiffExp)) +
  geom_point(alpha = 0.7, size = 2) +
  scale_color_manual(values = c("blue", "grey", "red")) +
  theme_minimal() +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "black") +
  geom_vline(xintercept = c(-0.5, 0.5), linetype = "dashed", color = "black") +
  labs(title = "Volcano Plot: Subtle Genetic Response in Social Cognition",
       x = "Log2 Fold Change", y = "-Log10 P-Value")
print(p_volcano_rev)

# 8. Analisis Pengayaan (Gene Ontology & KEGG)
# Menyaring gen-gen yang sudah berhasil diwarnai tadi
sig_genes <- subset(results, P.Value < 0.05 & abs(logFC) > 0.5)

# Mengambil kolom nama gen (biasanya bernama "Gene.symbol" atau "Symbol")
# Catatan: Jika error, cek nama kolom gen di file CSV-mu dan ganti "Gene.symbol"
gene_symbols <- sig_genes$`Gene.symbol` 
gene_symbols <- gene_symbols[gene_symbols != "" & !is.na(gene_symbols)]

# Mengubah nama gen menjadi ID angka (ENTREZ) agar bisa dibaca oleh database KEGG
gene_list <- bitr(gene_symbols, fromType = "SYMBOL",
                  toType = "ENTREZID", OrgDb = org.Hs.eg.db)

# A. Gene Ontology (GO) Plot
go_results <- enrichGO(gene = gene_list$ENTREZID,
                       OrgDb = org.Hs.eg.db,
                       ont = "BP", # Biological Process
                       pAdjustMethod = "BH",
                       pvalueCutoff = 0.05)
p_go <- barplot(go_results, showCategory = 10, title = "Gene Ontology (Biological Process)")
print(p_go)

# B. KEGG Pathway Plot
kegg_results <- enrichKEGG(gene = gene_list$ENTREZID,
                           organism = 'hsa',
                           pvalueCutoff = 0.05)
p_kegg <- dotplot(kegg_results, showCategory = 10, title = "KEGG Pathway Enrichment")
print(p_kegg)

# ==============================================================================
# 8. MENARIK NAMA GEN ASLI & EXPORT UNTUK g:PROFILER (WEB)
# ==============================================================================

# Mengambil "kamus" nama gen dari dataset
fdata <- fData(gse[[1]])

# Menggabungkan hasil statistik (results) dengan nama gen asli (fdata)
results_annotated <- merge(results, fdata, by=0, all.x=TRUE)

# Menyaring HANYA gen yang signifikan (berwarna merah/biru di Volcano Plot)
sig_genes <- subset(results_annotated, P.Value < 0.05 & abs(logFC) > 0.5)

# Menyimpan hasil lengkap ke CSV (Ini yang di-upload ke GitHub nanti)
write.csv(results_annotated, "Empathy_Transcriptomic_FULL_Results.csv", row.names=FALSE)

# Menyimpan khusus gen signifikan untuk di-copy ke g:Profiler
write.csv(sig_genes, "Significant_DEGs_For_Web.csv", row.names=FALSE)

print("File CSV berhasil dibuat! Silakan cek folder kerjamu.")