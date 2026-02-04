install:
	pip install -r requirements.txt

test:
	pytest mlops-telco-churn/cicd/tests -q
