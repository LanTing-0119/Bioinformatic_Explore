# 设置种子以确保结果可重复
set.seed(123)

# 模拟的基因位点数量
n <- 100  # 假设有100个基因位点

# 模拟正常组织的拷贝数：纯合子和杂合子
normal_pure_homozygous <- rep(2, n)  # 纯合子正常拷贝数
normal_heterozygous <- rep(2, n)  # 假设杂合子拷贝数为2，但含有杂合突变

# 模拟肿瘤组织
# 假设肿瘤纯度和倍性分别为不同组合
tumor_purity <- c(0.8, 0.6, 0.4)  # 纯度分别为80%，60%，40%
tumor_ploidy <- c(2, 3, 4)  # 肿瘤倍性：2（正常），3（增多），4（极度增多）

# 存储结果的列表
results <- list()

# 模拟不同纯度和倍性情况下的等位基因分数
for (purity in tumor_purity) {
  for (ploidy in tumor_ploidy) {
    # 肿瘤细胞的拷贝数
    tumor_copy_number <- rep(ploidy, n)
    
    # 根据纯度和倍性计算肿瘤细胞的等位基因分数（假设肿瘤细胞只有一个等位基因突变）
    # 默认了只有新增的基因是突变的
    allelic_fraction <- purity * (tumor_copy_number - 2) / 2 + (1 - purity) * 0  # 用拷贝数差异模拟等位基因分数
    
    # 将结果存储到列表中
    results[[paste0("Purity_", purity, "_Ploidy_", ploidy)]] <- data.frame(
      position = 1:n,
      normal_copy_number = normal_pure_homozygous,
      tumor_copy_number = tumor_copy_number,
      allelic_fraction = allelic_fraction
    )
  }
}

# 查看部分结果
head(results[["Purity_0.8_Ploidy_2"]])
