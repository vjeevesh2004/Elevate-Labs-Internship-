# -*- coding: utf-8 -*-
"""Elevate Labs Project

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1qnAerSlrb6aNyolvMEi5_gKhTgHaupoX

# SECTION 1: DATA CLEANING (Python – Pandas)
"""

import pandas as pd

df = pd.read_csv("/content/ecommerce_returns.csv")

df.head()

df.info()

df.isnull().sum()

df['OrderDate'] = pd.to_datetime(df['OrderDate'], format = '%d-%m-%Y')

df['is_returned'] = df['ReturnStatus'].apply(lambda x: 1 if x == 'Returned' else 0)

"""# SECTION 2: EXPLORATORY DATA ANALYSIS (EDA)[link text]

Return % by Product Category
"""

category_return = (
    df.groupby('ProductCategory')['is_returned']
    .mean()
    .reset_index()
    .sort_values(by='is_returned', ascending=False)
)

print("Return Rate by Product Category:")
print(category_return)

"""Return % by Supplier"""

supplier_return = (
    df.groupby('Supplier')['is_returned']
    .mean()
    .reset_index()
    .sort_values(by='is_returned', ascending=False)
)

print("Return Rate by Supplier:")
print(supplier_return)

"""Return % by Region"""

region_return = (
    df.groupby('Region')['is_returned']
    .mean()
    .reset_index()
    .sort_values(by='is_returned', ascending=False)
)

print("Return Rate by Region:")
print(region_return)

"""Return % by Marketing Channel"""

channel_return = (
    df.groupby('MarketingChannel')['is_returned']
    .mean()
    .reset_index()
    .sort_values(by='is_returned', ascending=False)
)

print("Return Rate by Marketing Channel:")
print(channel_return)

"""# SECTION 3: FEATURE ENCODING & DATA SPLITTING"""

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

# Categorical and numerical feature columns
categorical_cols = ['ProductCategory', 'Supplier', 'Region', 'MarketingChannel']
numerical_cols = ['OrderValue']

# Final feature set and target
X = df[categorical_cols + numerical_cols]
y = df['is_returned']

from sklearn.model_selection import train_test_split

# Split data into 70% train and 30% test
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=42, stratify=y
)

"""# SECTION 4: LOGISTIC REGRESSION MODELING & EVALUATION"""

from sklearn.pipeline import Pipeline
from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.linear_model import LogisticRegression

# Preprocess categorical columns with OneHotEncoder
preprocessor = ColumnTransformer(
    transformers=[
        ('cat', OneHotEncoder(drop='first'), categorical_cols)
    ],
    remainder='passthrough'  # Keep OrderValue as-is
)

# Pipeline: preprocessing + logistic regression
model_pipeline = Pipeline(steps=[
    ('preprocessor', preprocessor),
    ('classifier', LogisticRegression(max_iter=1000))
])

# Train the pipeline
model_pipeline.fit(X_train, y_train)

from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

# Predict return status on test set
y_pred = model_pipeline.predict(X_test)

# Evaluate performance
print("Accuracy:", accuracy_score(y_test, y_pred))
print("Confusion Matrix:\n", confusion_matrix(y_test, y_pred))
print("Classification Report:\n", classification_report(y_test, y_pred))

# Predict return probability for full dataset
df['return_probability'] = model_pipeline.predict_proba(X)[:, 1]

"""# SECTION 5: RETURN RISK SCORING & EXPORT"""

# Filter high-return-risk products (probability > 60%)
high_risk_df = df[df['return_probability'] > 0.6]

# Preview top rows
print(high_risk_df[['ProductCategory', 'Supplier', 'Region', 'return_probability']].head())

print(df.head())

high_risk_df = df[df['return_probability'] > 0.4]

high_risk_df.to_csv("high_risk_products.csv", index=False)

