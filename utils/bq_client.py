from google.cloud import bigquery

def get_bq_client(project=None):
    return bigquery.Client(project=project)
