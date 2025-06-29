# 📊 Econometrics of Crime — Pantone 448C Final Project

This project investigates potential biases in sentencing within the U.S. justice system using the `crime1` dataset from the Wooldridge collection. The analysis focuses on whether race, employment, and income correlate with average sentence length, using a series of linear regression models and robust statistical techniques.

## 👥 Authors
**Naufal Alavi**  
**Luke Sunderman**

## 🎯 Project Objective
To explore whether socioeconomic and demographic factors like race, employment history, and income are statistically associated with longer prison sentences. The project does **not** attempt to establish causality, but rather identify possible correlations.

## 📚 Theoretical Background
Our work builds on foundational papers in the economics of crime:
- **Becker (1968)** – Crime and Punishment: An Economic Approach
- **Friesen (2012)** – Certainty vs. Severity of Punishment
- **Tahani et al. (2015)** – Crime prediction using spatial and temporal data

These studies inform our choice of variables and model design, particularly focusing on punishment severity (sentence length) and demographic context.

## 🧪 Methods
We developed several regression models with the response variable:


- **avgsen**: average sentence length (months)
- **qemp86**: quarters employed in 1986
- **inc86**: legal income in 1986 (hundreds of dollars)
- **black / hispan**: binary race indicators

We addressed issues of **heteroskedasticity** using the **Breusch-Pagan test** and employed **robust standard errors** where appropriate. Additional models incorporated nonlinear and interaction effects (e.g., prior convictions and their square).

## 📈 Key Results
- **Employment** negatively correlates with sentence length — more employment is associated with shorter sentences.
- **Black individuals** serve longer sentences on average than non-Black individuals, holding other factors constant.
- **Hispanic ethnicity** was not statistically significant in final models.
- **Prior convictions** have a nonlinear (diminishing) effect on sentencing length.

> Final model explains ~4.25% of variance in sentence length (R² = 0.0425), indicating small but statistically significant relationships.

## 🔍 Conclusion
While limited by data scope and time, our findings suggest that racial disparities and employment history play measurable roles in sentencing outcomes. More comprehensive data is required for causal or policy conclusions.

## 📦 Dataset
- **Source**: `crime1` dataset from *Introductory Econometrics: A Modern Approach* by Jeffrey Wooldridge  
  [Dataset Link](https://www.cengage.com/cgi-wadsworth/course_products_wp.pl?fid=M20b&product_isbn_issn=9781111531041)

## 🔗 References
- Becker, G. (1968). *Crime and Punishment: An Economic Approach*  
  [JSTOR](http://www.jstor.org/stable/1830482)  
- Friesen, L. (2012). *Certainty vs. Severity of Punishment*  
  [JSTOR](http://www.jstor.org/stable/41638882)  
- Tahani, A. et al. (2015). *Crime Prediction Using Hotspots*  
  [arXiv](https://arxiv.org/ftp/arxiv/papers/1508/1508.02050.pdf)

## 📁 Files
- `final_project.Rmd` – RMarkdown report with analysis
- `project_data.csv` – Pre-processed dataset
- `models_output/` – Model results, figures, and regression tables
