# Two-Way ANOVA in R — Practical & Production Guide

## 📌 Overview

Two-Way ANOVA (Analysis of Variance) is a statistical technique used to evaluate:

* The effect of **two categorical independent variables (factors)**
* On a **single continuous dependent variable**
* Including whether there is a **statistical interaction** between the two factors

This method is widely applied in:

* Experimental design
* A/B testing
* Behavioral and social sciences
* Business and product analytics

---

## ⚙️ Prerequisites

Before running the analysis, ensure:

* R ≥ 3.6 installed
* Basic familiarity with R syntax
* Foundational understanding of ANOVA concepts

---

## 📦 Installation

Install required packages:

```r
install.packages(c("ggplot2", "dplyr", "car"))
```

Load them:

```r
library(ggplot2)
library(dplyr)
library(car)
```

---

## 🔄 End-to-End Workflow

### 1. Load Data

```r
data <- read.csv("path_to_your_dataset.csv")
head(data)
```

---

### 2. Inspect & Prepare Data

Check structure:

```r
str(data)
```

Ensure:

* Independent variables → **Factors**
* Dependent variable → **Numeric**

Convert if needed:

```r
data$Factor1 <- as.factor(data$Factor1)
data$Factor2 <- as.factor(data$Factor2)
```

---

### 3. Fit the Two-Way ANOVA Model

```r
anova_model <- aov(DependentVariable ~ Factor1 * Factor2, data = data)
summary(anova_model)
```

💡 The `*` operator includes:

* Main effect of `Factor1`
* Main effect of `Factor2`
* Interaction effect `Factor1:Factor2`

---

## ✅ Assumption Checks (Don’t Skip This)

### 4. Homogeneity of Variance

```r
leveneTest(DependentVariable ~ Factor1 * Factor2, data = data)
```

✔️ Interpretation:

* **p > 0.05** → assumption satisfied
* **p ≤ 0.05** → variance is unequal (consider alternatives)

---

### 5. Normality of Residuals

#### Q-Q Plot

```r
qqnorm(residuals(anova_model))
qqline(residuals(anova_model))
```

#### Shapiro-Wilk Test

```r
shapiro.test(residuals(anova_model))
```

✔️ Interpretation:

* **p > 0.05** → residuals approximately normal

---

## 📊 Interpreting Results

From:

```r
summary(anova_model)
```

| Component           | Interpretation                        |
| ------------------- | ------------------------------------- |
| **Factor1**         | Effect of first independent variable  |
| **Factor2**         | Effect of second independent variable |
| **Factor1:Factor2** | Interaction between the two variables |

### 🔑 Key Insight

* If **interaction is significant**, it takes priority
* This means:
  👉 *The effect of one factor depends on the other*

⚠️ Do **not** interpret main effects in isolation when interaction is significant.

---

## 🔍 Post-Hoc Analysis

If significant effects are found:

```r
TukeyHSD(anova_model)
```

This identifies:

* Which specific group pairs differ
* The magnitude and direction of differences

---

## 📈 Visualization (Interaction Plot)

```r
ggplot(data, aes(x = Factor1, y = DependentVariable, color = Factor2)) +
  geom_point(position = position_jitterdodge()) +
  stat_summary(fun = mean, geom = "line", aes(group = Factor2)) +
  labs(
    title = "Interaction Plot",
    x = "Factor 1",
    y = "Dependent Variable"
  ) +
  theme_minimal()
```

💡 Why this matters:

* Helps visually confirm interaction effects
* Makes interpretation faster and clearer

---

## 🧪 Reproducible Example

```r
data <- data.frame(
  Factor1 = factor(rep(c("A", "B"), each = 10)),
  Factor2 = factor(rep(c("X", "Y"), 10)),
  DependentVariable = c(
    23, 21, 19, 30, 29, 31, 23, 22, 24, 26,
    30, 28, 25, 27, 29, 22, 24, 21, 23, 20
  )
)

anova_model <- aov(DependentVariable ~ Factor1 * Factor2, data = data)
summary(anova_model)
```

---

## ⚠️ Common Pitfalls

* Treating numeric variables as categorical incorrectly
* Ignoring interaction effects
* Skipping assumption checks
* Using small sample sizes (low statistical power)
* Over-interpreting insignificant results

---

## ✅ Best Practices

* Always **visualize before and after modeling**
* Validate assumptions **before drawing conclusions**
* Use post-hoc tests for deeper insights
* Keep your data clean and structured
* Document your workflow for reproducibility

---
