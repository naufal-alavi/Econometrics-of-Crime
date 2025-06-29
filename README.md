# 📊 Econometrics of Crime

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
- **Tahani et al. (2015)** – Crime Prediction Using Spatial and Temporal Data  

These studies inform our choice of variables and model design, particularly focusing on punishment severity (sentence length) and demographic context.

## 🧪 Methods
We developed several regression models with the response variable:

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
- **Tahani et al. (2015)** – Crime Prediction Using Spatial and Temporal Data  

These studies inform our choice of variables and model design, particularly focusing on punishment severity (sentence length) and demographic context.

## 🧪 Methods
We developed several regression models with the response variable:


- **avgsen**: average sentence length (months)  
- **qemp86**: quarters employed in 1986  
- **inc86**: legal income in 1986 (hundreds of dollars)  
- **black / hispan**: binary race indicators  

We addressed issues of **heteroskedasticity** using the **Breusch-Pagan test** and used **robust standard errors** where appropriate. Additional models included nonlinear terms and variable selection via joint significance testing.

## 📈 Key Results
- **Employment**: more quarters worked is associated with shorter average sentence length.
- **Race**: being Black is statistically associated with longer sentences, even after controlling for other variables.
- **Prior convictions**: significant, with diminishing marginal effects as the proportion increases.
- **Income** and **Hispanic ethnicity** were not consistently significant across models.

> Final model explains ~4.25% of the variation in sentence length (Adjusted R² = 0.0411).

## 🔍 Conclusion
This analysis suggests that race and employment history are statistically significant factors in sentence length. However, due to data limitations, no definitive claims about causality or fairness can be made. Further research with richer datasets is required.

## 📦 Dataset
- **Source**: `crime1` dataset from *Introductory Econometrics: A Modern Approach* by Jeffrey Wooldridge  
  [Dataset Link](https://www.cengage.com/cgi-wadsworth/course_products_wp.pl?fid=M20b&product_isbn_issn=9781111531041)

## 🔗 References
- Becker, G. (1968). *Crime and Punishment: An Economic Approach* – [JSTOR](http://www.jstor.org/stable/1830482)  
- Friesen, L. (2012). *Certainty vs. Severity of Punishment* – [JSTOR](http://www.jstor.org/stable/41638882)  
- Tahani, A. et al. (2015). *Crime Prediction Using Hotspots* – [arXiv](https://arxiv.org/ftp/arxiv/papers/1508/1508.02050.pdf)

## 📁 Files
- `Descriptive_Statistics.R` – Contains data loading, variable summaries, and initial exploration of the dataset.
- `Model_Selection.R` – Contains all regression models, hypothesis testing, and robust standard error adjustments.
- `crime1.xls` – Cleaned dataset used in the analysis (derived from Wooldridge's `crime1`).
