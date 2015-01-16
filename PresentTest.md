Case Management
========================================================
author: Steve Nelson
date: January 16, 2015

Description of App
===

This App is to help Disability Services casemanagers to maintain their control of spending when working with clients with disabilities.     

Intructions: Select a service type and hours of that service are needed by the client. The output will show whether the parameters fit within budget.

The parameters include selection of the service and determining the hourly need with the slider.

The App reads the hourly rate from the rates file and calculate the total cost for that service and hour combination.  The graphics assist the casemanager in calibrating the service hours. Furthermore a warning is provided if the selection result is over budget.






Services
===

These are the services:

- "Behavioral Programing"
- "Independent Living Skills"
- "Supported Work"
- "Custodial Care"

Statutory Rates: These rates are read by R from the rates file.
===

```
                    service rate
1    Behavioral Programming   18
2 Independent Living Skills   16
3            Supported Work   14
4            Custodial Care   12
```





Shiny Functions used
===
1. This shiny app uses reactive output based on the selection of service and hours of service.
2. This app also uses renderUI contingently and UIoutput functions to provide a warning when parameters exceed the budget.
3. The app provides information in two tabs and two graphics are provided.
