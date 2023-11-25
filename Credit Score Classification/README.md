## <p align="center">Credit Score Classification</p>

![Alt text](https://drive.google.com/uc?id=1Jq-YNV_BdKAaoAuSxLslTkydjjjszZ5a)


:round_pushpin:	**About**

Welcome to the Financial Analysis Project! This project delves into a comprehensive exploration of a rich dataset encompassing various aspects of customers' financial profiles. By conducting a thorough examination of income patterns, credit scores, debt management, and more, this analysis aims to extract valuable insights that can inform strategic financial decisions.

:globe_with_meridians: **Technologies**

<div align="center">
  <img src="https://drive.google.com/uc?id=1e3JzgF5W88Hl56c9PlMsruqPRGY4UTmI" alt="Image 1" width="100" height="100">
  <img src="https://drive.google.com/uc?id=1PHb7i9galZ75n1g8v37g_uw3s-Yk8qZe" alt="Image 2" width="100" height="100">
  <img src="https://drive.google.com/uc?id=1nV6GakOpOpakGTARtwlKOygdNmUcvs7_" alt="Image 3" width="100" height="100">
</div>
<br>

:notebook: **Library and Module used**
```python
import pandas as pd 
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.impute import SimpleImputer
import plotly.figure_factory as ff
import plotly.express as px 
from matplotlib import colors 
import matplotlib.ticker as mtick 
import plotly.graph_objects as go
```

:dart: **Some ideas**

- Uncover patterns in monthly earnings
- Explore financial behaviors across diverse occupations
- Investigate the correlation between age groups and credit behaviors, shedding light on credit score trends and payment behaviors.
- Understand the impact of credit scores on various financial metrics
- Examine the relationship between monthly investments and credit ratings
- ssess the financial risks associated with specific occupations
- Analyze payment behavior trends across different age groups
- The influence of credit history on credit scores
- The potential association between interest rates and loan sizes

:bulb: **Summary of key findings**

**Monthly Earnings:**

A significant portion of customers earns between $1,500 - $2,500 monthly.

**Recurring Monthly Balance:**

The majority of customers maintain a recurring monthly balance between 13% - 16% of their earnings, typically in the range of $200 - $400.

**Outstanding Debt:**

Most customers carry outstanding debt ranging from $500 - $2,500, indicating potential eligibility for additional loans.

**Occupation and Income:**

Musicians have the highest annual income, while journalists have the lowest.

**Income and Monthly Investments:**

Musicians, with the highest income, also exhibit the highest monthly investments. Developers and teachers have the lowest monthly investments.

**Interest Rates:**

Managers face the highest interest rates, while architects have the lowest.

**Monthly Investments by Month:**

May stands out with the largest amount of investments.

**Age and Number of Loans:**

Customers aged 18 - 45 have the highest number of loans, with an average of 3.5 to nearly 4.5 loans.

**Credit Scores by Age:**

Individuals aged 25 to 44 generally have both the highest "good" and "poor" credit scores.

**Job Risk and Credit Scores:**

Scientists face a higher risk with a higher number of "poor" credit scores. Engineers, despite having the most "good" credit scores, also have the highest number of "poor" credit scores.

**Loan Numbers by Occupation:**

Lawyers, on average, have the highest number of loans, while musicians have the lowest.

**Outstanding Debt by Job:**

Mechanics have the highest outstanding debt, while architects have the lowest.

**Income and Credit Score:**

Generally, a higher mean income corresponds to a better credit score.

**Income and Credit Score Relationship:**

Poorer credit scores tend to be associated with lower monthly incomes, ranging mostly from $1,500 to $2,000.

**Number of Bank Cards:**

On average, customers with a "Good" credit rating have 3 bank cards, while those with a "Poor" rating have 7.

**Credit Inquiries and Credit Score:**

Higher credit inquiries (>10) are associated with lower credit scores.

**Payment Behavior by Age:**

Customers aged 40 to 50 are considered to have the best payment behavior, while those aged 20 to 40 exhibit the opposite trend.

**Credit Score and Payment Behavior:**

Lower credit scores are correlated with poorer payment behavior.

**Credit History and Credit Score:**

Longer credit history positively influences credit scores.

**Credit Ratings Over Months:**

Later months tend to have higher "good" credit ratings.

**Monthly Investments of "Poor" Credit Ratings:**

Customers with "Poor" credit ratings typically invest around $1,000 down to 0 monthly.

**Months with Highest Investments:**

March and August stand out as months with the most significant investments.

**Monthly Investment and Credit Score Relationship:**

Higher monthly investment amounts generally correlate with more positive credit scores, except in February and March.

**Interest Rate and Loan Size:**

A tentative observation suggests that higher interest rates may be associated with larger loans. Further analysis is needed to confirm this relationship.

:checkered_flag: **Conclusion**

**1. Income and Financial Behavior:**

There is a notable correlation between higher monthly income and positive financial behavior, as indicated by better credit scores and fewer outstanding debts.

**2. Occupation and Financial Metrics:**

Different occupations exhibit distinct financial profiles, with musicians having high income and monthly investments, while managers face higher interest rates.

**3. Age and Credit Behavior:**

Age plays a significant role in credit behavior, with individuals aged 25 to 44 showing both the highest "good" and "poor" credit scores.

**4. Credit Score and Debt Management:**

Higher credit scores tend to be associated with more responsible debt management, lower outstanding debts, and a lower number of credit inquiries.

**5. Monthly Investments and Credit Ratings:**

Monthly investment patterns are diverse, with customers having "Poor" credit ratings showing lower investment amounts. However, higher monthly investments generally correlate with more positive credit ratings.

**6. Monthly investment Trends:**

Certain months, particularly May, exhibit higher investment activities and credit ratings.

**7. Occupation-Specific Risks:**

Some occupations, such as scientists and engineers, demonstrate specific financial risks, with scientists having higher "poor" credit scores and engineers having the highest number of both "good" and "poor" credit scores.

**8. Credit Score and Loan Dynamics:**

Credit scores influence loan dynamics, with customers having "Poor" credit ratings often having more bank cards and potentially larger loans.

**9. Payment Behavior and Age:**

Older customers, particularly those aged 40 to 50, tend to exhibit more favorable payment behavior, while younger individuals may face challenges in this regard.

**10. Credit History Impact:**

Longer credit histories positively impact credit scores, reinforcing the importance of a stable financial track record.

**11. Interest Rates and Loan Size (Tentative):**

There appears to be a tentative association between higher interest rates and larger loans. However, further analysis is needed to confirm this relationship.


![Alt text](https://drive.google.com/uc?id=1-kUUkJP3fM0pLr25WnyxdHMl5mAaLXga)
