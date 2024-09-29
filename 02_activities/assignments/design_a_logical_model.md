# Assignment 1: Design a Logical Model

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).
```
See ERD 1 diagram with the five tables below.
```
## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.
```
See ERD 2 diagram with an additional table for 'Shifts' below. The Shifts table is highlighted in orange color.
```
## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._
```
I have shown the two architectures for Customer_address tables in the ERD 2 diagram below. They are labelled and highlighted in blue color.
```
Bonus: Are there privacy implications to this, why or why not?
```
Privacy Implications:
There are some privacy concerns associated with storing customer addresses, especially when it involves retaining historical data:
1. Type 1 SCD (Overwrite): Since only the current address is kept, the risk is lower compared to Type 2. However, standard care is a must in order to protect the customer's personal information.
2. Type 2 SCD (Retain History): Storing historical addresses increases privacy concerns because it involves keeping a record of past locations where the customer has lived. This data could potentially be misused or exposed in a data breach, which poses a higher risk. Additional security and privacy measures (e.g., data encryption, access control) should be in place to mitigate these risks.
```

## Question 4
Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. Would you change anything in yours?
```
Two interesting differences between the AdventureWorks ERD and your participant ERD are:
1. DB Schema Organization: AdventureWorks uses multiple schemas (e.g., Sales, Human Resources) to segment the database by function, improving organization and scalability. My ERD uses a single schema, which is simpler but I know is likely to become difficult to manage if the system grows (for example if there are multiple branches of the bookstore, if the store sells digital books as well as physical copies, etc.).
2. Entity Relationships: AdventureWorks contains more complex relationships, including many-to-many and hierarchical relationships (e.g., in the Product and Sales areas). My ERD focuses mainly on one-to-many relationships, which simplifies the structure but again it may not be suited to future complexity as the database/business grows.

My reflection is that AdventureWorks uses a high level of normalization which is great for larger, more complex systems. I could account for that in my DB - but it isn't really required at this stage. I also think separating functional areas into separate schemas helps with scalability. I could make this change in my ERD too - with deparate schemas for customers, books, and employees entities.
```
## ERD 1 Diagram (5 tables referred to in Question 1)

![ERD1](https://github.com/user-attachments/assets/2f22f9e6-762c-4f81-ae5d-0967909cc38f)

## ERD 2 Diagram (3 additional tables referred to in Question 2 highlighted in orange color and Question 3 highlighted in blue color)

![ERD2](https://github.com/user-attachments/assets/fd0d60ec-1ab0-42b7-b3c8-9303b0def668)

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `September 28, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [x] Create a branch called `model-design`.
- [x] Ensure that the repository is public.
- [x] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [x] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-4-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
