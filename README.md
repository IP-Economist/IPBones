# IPBones
IPBones is a package which is designed for evaluation of intellectual property objects

**Welcome to the IPBones project!**

This repository provides tools for estimating the value of 
intellectual property (IP) and calculating royalties. It 
leverages basic analysis techniques, internet data gathering, 
and regression analysis to generate estimates. 


**Project Description:**

* **Objective:** This module aims to estimate the monetary value 
of an IP object using online data sources and apply simple 
royalty calculation methods.
* **Data Sources:** Currently relies on publicly available 
information gathered from the internet to form the basis for its 
estimations.  This data is used as input for analysis in various 
steps like cost estimation, coefficient determination through 
regression analysis, and royalty calculations. 
* **Functionality:** The project offers:

    * **IPBones_CollectData:** A framework for data collection 
based on web scraping techniques. 
    * **IPError:** A custom enum to handle potential errors 
during the execution of functions, such as "NoData" or 
"InsufficientData".
    * **AnalysisData:** Data structure holding object name and 
its corresponding value used in regression analysis
    * **IPBones_Value:** This struct encapsulates cost 
estimation methods and royalty calculation logic. 
      * `cost`:  The estimated cost of the IP object (currently 
using an integer-based approach)
      * `addedCoefficient`: Represents a fixed coefficient based 
on specific criteria, which is used in conjunction with the 
'cost' value to calculate the final estimate. 
      * `data`: This property will hold data for regression 
analysis. This should be implemented and extended as needed by 
the developer.

    * **IPBones_Royalties:**  This struct calculates royalties 
based on a pre-defined rule or method (currently, it uses a 
basic 25% royalty calculation).
      * `objectValue`: The value of the IP object being assessed 
for royalty purposes.


**Current Status and Future Development:**

* This project is still under development, and some features are 
incomplete, particularly those related to data collection and 
regression analysis integration. 
* Further development will focus on:
   - **Data Acquisition**:  Implementing robust web scraping 
techniques to collect and store relevant IP data (e.g., patents, 
trademarks, etc.). 
   - **Regression Analysis:** Integrating a more sophisticated 
regression analysis module that uses multiple data points for 
better estimations. 
   - **Royalty Calculation:** Exploring additional royalty 
calculation methods beyond basic percentages.


**Disclaimer:**  

*  This code is intended as a basic framework, not a 
comprehensive solution for IP valuation or royalty calculation. 
It should be used cautiously and its outputs are not guaranteed 
to be reliable or accurate without additional research and 
validation. 
* **Always consult with qualified professionals in intellectual 
property law and financial matters.**
