UPDATE ChartOfAccounts
set 
AccountTitle = LTRIM(RTRIM(AccountTitle)),
NormalBalance = LTRIM(RTRIM(NormalBalance))
