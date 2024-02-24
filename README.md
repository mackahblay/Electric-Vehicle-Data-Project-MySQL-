PROJECT SUMMARY:

This project involved designing a database for individual consumers interested in purchasing an electric vehicle (EV) in Washington state. The goal was to create a centralized platform where consumers can access information about various EV features to help them compare options and make an informed purchase.

The primary user groups are Washington residents looking to buy an EV and the state's Department of Transportation to gain insights into EV adoption across the state. The database enables users to view and filter EVs by price, features, and eligibility for state EV incentives.

The main database entities include:

Model - Contains EV features like range, battery type, etc.
Vehicle - Links each registered EV to its model using the vehicle ID.
Make - Details the make/brand of each model.
Electric_vehicle_type - Classifies models as plug-in hybrid or battery electric.
Location - Provides county, city, census tract, and postal code where vehicles are registered.
Vehicle_location - Links locations to specific vehicles.

The project report discusses the database design process including normalization, modifying the initial ERD, data cleaning, and considerations around socioeconomic factors, accessibility, and privacy. Potential future work is proposed like adding more models, a luxury classification, and a rental option.

ADDITIONAL KEY POINTS:

Here are some additional key points about the project:

The motivation was to help Washington accelerate EV adoption, reduce emissions, and support the state's plan to expand charging infrastructure.
To make the data more manageable, the number of rows per table was reduced from an initial goal of 500 to around 20.
The database structure was reframed from initially focusing on manufacturer insights to being oriented around individual consumer purchases.
Python code was used to clean the raw CSV data by removing unnecessary columns and rows.
The group collaborated on normalizing the data, designing the ERD, creating the tables, and ensuring alignment.
Ethical considerations included enabling filtering by price for accessibility, excluding direct vehicle IDs for privacy, and potential bias from lack of rural charging infrastructure data.
Lessons learned included strategic data extraction, normalization, ERD design, MySQL table creation, Python data cleaning, and the importance of collaboration.
Next steps could include adding more vehicle specs, a luxury classification, and a rental feature to improve affordability.

In summary, this academic project involved thoughtfully designing a consumer-focused EV database for Washington residents using skills like data modeling, cleaning, collaboration, and ethical data practices.
