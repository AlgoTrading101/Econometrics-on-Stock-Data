# Econometrics on Stock Data with R - Algotrading101

[R Finance – An Econometrics Guide to Stocks](https://algotrading101.com/learn/r-finance-guide/)

When working with a time series you need to test your model for serial correlation and correct it with the Cochrane-Orcutt method. We also want to make sure that the time series is stationary so we can make predictions.

When looking for the correlation between time series you need to use cointegration because it is more informative. Too many people just look for plain correlations that can be meaningless.

This article was written in order to help traders make data informed decisions and will be linked here upon release.

And remember these wise words: "Correlation doesn't mean causation!".

## Table of contents

<ol><li><a href="https://algotrading101.com/learn/r-finance-guide/#what-is-r">What is R?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#r-finance">How can R be used for Finance?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#r-pros">Why should I use R for Finance?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#r-cons">Why shouldn’t I use R for Finance?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#r-alternatives">What are some R alternatives?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#econometrics">What is Econometrics?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#stock-problem">Stock problem definition</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#stock-data">How to download stock data with R?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#r-csv">How to save data to CSV with R?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#linear-regression">What is linear regression?&nbsp;</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#null-hypothesis">What is the null hypothesis?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#p-value">What is the p-value?</a><ol><li><a href="https://algotrading101.com/learn/r-finance-guide/#p-value-downfalls">p-value downfalls</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#p-value-alternatives">p-value alternatives and supplements</a></li></ol></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#reg">How to do a linear regression on stock data with R?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#granger-causality">What is the Granger causality test?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#granger-test">How to do a Granger causality test in R?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#serial-correlation">What is Serial Correlation?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#serial-corr-test">How to do a Serial Correlation test with R?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#remove-serial-corr">How to remove Serial Correlation from a model in R?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#stationarity">What is Stationarity?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#stationarity-test">How to test for Stationarity with R?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#cointegration">What is Cointegration?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#cointegration-test">How to test for Cointegration with R?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#common-mistakes">What are the 3 Common Analysis/Testing Mistakes?</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#final-thoughts">Final thoughts</a></li><li><a href="https://algotrading101.com/learn/r-finance-guide/#full-code">Full code</a></li></ol>

----------
## Info

| Author | Igor Radovanovic
--- | ---
| Published | February 12, 2023
