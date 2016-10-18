# equitymaster-scrape

roeder/ 
> scraping from equitymaster.com for ROE and Debt to Equity ratio of BSE listed companies (Indian stock market)

> 1. Get `Return on Equity` and `Debt to Equity Ratio` from equitymaster:
 
> ```
> $ bash fetch.sh > <REPORT_FILE_PATH>
> ```

> 2. Run analysis to get subset satisfying the criterion: 

> ```
> $ python analyze.py <MIN_ROE_ACROSS_ALL_YEARS> <MAX_DTE_RATIO_ACROSS_ALL_YEARS> <REPORT_FILE_PATH>
> ```

dividend-taxrate/

> 1. Get `Divided payout %` and `Effective tax rate` from equitymaster:
 
> ```
> $ bash fetch.sh > <REPORT_FILE_PATH>
> ```

shareholding/

> 1. Get `Shareholding pattern` from equitymaster: (peek into the source .sh to see format)
 
> ```
> $ bash fetch.sh > <REPORT_FILE_PATH>
> ```

