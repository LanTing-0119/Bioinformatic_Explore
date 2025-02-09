# 安装DNAcopy包（如果没有安装）
BiocManager::install("DNAcopy")
library(DNAcopy)

# 假设数据：基因组区域、位置、拷贝数（示例数据）
data <- data.frame(
  chromosome = rep(1, 100),        # 染色体
  position = 1:100,                # 基因组位置
  copy_number = c(rep(2, 20), rep(3, 20), rep(1, 20), rep(2, 20), rep(1, 20)) # 模拟的拷贝数
)

# add noise
data$copy_number <- data$copy_number + rnorm(length(data$copy_number), mean = 0, sd = 0.5)


# 创建CNA对象：将数据转换为DNAcopy包可以处理的格式
cna_obj <- CNA(data$copy_number, data$chromosome, data$position, data.type="logratio")

# 使用CBS算法进行分段
segment_result <- segment(cna_obj, verbose=1)

# 查看分段结果
print(segment_result)
