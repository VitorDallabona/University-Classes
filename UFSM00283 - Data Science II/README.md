# Data Science II - Final Project: Mining and Classification of Themes in Mobile App Reviews

## Project Overview
 The main objective of this project is to build an original dataset of mobile app reviews from the Google Play Store and apply Natural Language Processing (NLP), clustering, and supervised classification techniques to identify, interpret, and classify the main themes reported by users.

The chosen domain is **Food Delivery Apps**, focusing on analyzing user feedback to understand technical problems, usability issues, and overall satisfaction.

## Dataset
The dataset was built by scraping public user reviews from the Google Play Store using the `google-play-scraper` library. 
* **Target Applications:** iFood, Delivery Much, Zé Delivery, and Pigz.
* **Data Volume:** 725 recent reviews in Portuguese.
* **Features Collected:** App name, review content, star rating, and review date.

## Methodology & Pipeline

### 1. Exploratory Data Analysis (EDA) & Preprocessing
* Explored the distribution of user ratings and comment lengths for each application.
* Handled missing values, normalized text, and defined two text preprocessing streams: one keeping stopwords (for contextual models) and one removing stopwords (for lexical baselines and human interpretation).

### 2. Text Representation
* **Baseline:** TF-IDF (Term Frequency-Inverse Document Frequency) and Bag of Words (CountVectorizer).
* **State-of-the-Art (Embeddings):** Dense vector representations generated using the `SentenceTransformer` library with the Portuguese pre-trained model **BERTimbau**.

### 3. Unsupervised Learning (Clustering)
Applied clustering algorithms to discover hidden patterns and group similar comments:
* **Algorithms Tested:** K-Means and Agglomerative Clustering (Ward linkage).
* **Evaluation Metrics:** Silhouette Score, Davies-Bouldin, and Calinski-Harabasz.
* **Topic Extraction:** Extracted the top 10 keywords per cluster using **c-TF-IDF** (Class-based TF-IDF) applied to clean text (without stopwords) to interpret the clusters logically.

### 4. Supervised Learning (Classification)
Trained models to automatically classify comments into predefined categorical themes. 
* **Algorithms Tested:** Logistic Regression, LinearSVC (SVM), and Random Forest.
* **Hyperparameter Tuning:** Performed exhaustive search using `GridSearchCV` with 5-fold Cross-Validation.
* **Evaluation Metric:** **F1-Score (Macro)** to account for the imbalanced nature of the classes.

## Results & Best Model
After comparing the lexical baselines against the dense embeddings, the model combining **BERTimbau (WITH Stopwords)** and **Logistic Regression** achieved the best performance.

* **Why it worked best:** The Transformer-based architecture (BERT) relies heavily on self-attention mechanisms, where stopwords (conjunctions, prepositions) provide crucial syntactic context to understand sentiment polarity. The Logistic Regression classifier proved highly efficient at drawing decision boundaries within the 768-dimensional embedding space.
* **Inference:** The winning model was deployed on an unseen batch of comments to validate its real-world generalization and confidence scoring.

## Technologies Used
* **Language:** Python 3
* **Data Collection:** `google-play-scraper`
* **Data Manipulation & EDA:** `pandas`, `numpy`, `matplotlib`, `seaborn`
* **Machine Learning:** `scikit-learn`
* **NLP & Deep Learning:** `sentence-transformers` (BERTimbau)

## Authors
* Daniela Alessandra Prill
* Leonardo Moschetta dos Santos
* Miguel dos Santos Baggio
* Vitor Dallabona
