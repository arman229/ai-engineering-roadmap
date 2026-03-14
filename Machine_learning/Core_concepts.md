## There are three concepts that are at the core of machine learning: data, a model, and learning.

## **1. Data**

- **What it is:** Data is the raw information that we feed into a machine learning system. It can be numbers, text, images, audio, sensor readings, or any measurable input.
- **Role in ML:**

  - The model learns patterns from this data.
  - Quality and quantity of data determine how well the model can learn.

- **Types:**

  - **Structured data:** Tables with rows and columns (e.g., Excel sheets, CSV files)
  - **Unstructured data:** Text, images, videos, or audio files

- **Example:** If you want to build a system that predicts house prices, data could include features like square footage, number of bedrooms, location, and price.

---

## **2. Model**

- **What it is:** A model is a mathematical representation of patterns in data. It’s like a “function” that maps input data to predictions or outputs.
- **Role in ML:**

  - The model “learns” the relationship between inputs and outputs from the data.
  - It defines how the machine makes decisions or predictions.

- **Types:**

  - **Linear models:** Linear regression, logistic regression
  - **Non-linear models:** Neural networks, decision trees
  - **Probabilistic models:** Naive Bayes, Hidden Markov Models

- **Example:** A linear regression model might learn that `Price = 5000 + 300*Area + 1000*Bedrooms`.

---

## **3. Learning**

- **What it is:** Learning is the process of improving the model using data. The model adjusts its internal parameters to minimize errors between predictions and actual outcomes.
- **Role in ML:**

  - Learning is the core activity that allows machines to improve over time without explicit programming.
  - Different types of learning exist:

    - **Supervised learning:** Learn from labeled data (input → output known)
    - **Unsupervised learning:** Find patterns in unlabeled data
    - **Reinforcement learning:** Learn through trial and error using feedback (rewards/punishments)

- **Example:** Training a neural network on thousands of labeled images of cats and dogs so it can correctly classify new images.

---
